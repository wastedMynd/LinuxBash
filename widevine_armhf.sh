#!/bin/sh -eu

# Make sure we have wget or curl
available () {
  command -v "$1" >/dev/null 2>&1
  }
  if available wget; then
    DL="wget -O-"
      DL_SL="wget -qO-"
      elif available curl; then
        DL="curl -L"
          DL_SL="curl -s"
          else
            echo "Install Wget or cURL" >&2
              exit 1
              fi

              # Find a URL to a suitable armhf ChromeOS recovery image
              CHROMEOS_URL="$($DL_SL https://dl.google.com/dl/edgedl/chromeos/recovery/recovery.conf | grep -A11 CB5-312T | sed -n 's/^url=//p')"
              CHROMEOS_IMG="$(basename "$CHROMEOS_URL" .zip)"
              if [ -e "$CHROMEOS_IMG" ]; then
                CHROMEOS_IMG_PATH="./"
                  DEL_IMG=N
                  else
                    CHROMEOS_IMG_PATH="$(mktemp -td ChromeOS-IMG.XXXXXX)"
                      DEL_IMG=Y
                        # Fetch the recovery image (2Gb+ on disk after download)
                          $DL "$CHROMEOS_URL" | zcat > "$CHROMEOS_IMG_PATH/$CHROMEOS_IMG"
                          fi

                          # Note the next free loop device in a variable
                          LOOPD="$(losetup -f)"

                          # If root, we can mount silently (no popup windows after mount)
                          if [ "$USER" = "root" ]; then
                            MNTPNT="$(mktemp -d -t ChromeOS.XXXXXX)"
                              losetup -Pf "$CHROMEOS_IMG_PATH/$CHROMEOS_IMG"
                                mount -o ro "${LOOPD}p3" "$MNTPNT"
                                else
                                  # Associate all the partitions on the disk image with loop devices:
                                    udisksctl loop-setup -rf "$CHROMEOS_IMG_PATH/$CHROMEOS_IMG"
                                      sleep 1
                                        # Mount the third partition of the disk image (if the previous did not do it automatically)
                                          if ! lsblk -lo MOUNTPOINT "${LOOPD}p3" | tail -n1 | grep -q \.; then
                                              udisksctl mount -b "${LOOPD}p3"
                                                fi
                                                  # Note the mount point in a variable
                                                    MNTPNT="$(lsblk -lo MOUNTPOINT "${LOOPD}p3" | tail -n1)"
                                                    fi

                                                    # Copy over files and make manifest
                                                    CHRFILES="$(mktemp -d -t ChromeOS_Files.XXXXXX)"
                                                    install -Dm644 "$MNTPNT"/opt/google/chrome/pepper/libpepflashplayer.so "$CHRFILES"/opt/google/chrome/PepperFlash/libpepflashplayer.so
                                                    install -Dm644 "$MNTPNT"/opt/google/chrome/libwidevinecdm.so "$CHRFILES"/opt/WidevineCdm/_platform_specific/linux_arm/libwidevinecdm.so
                                                    WVVER="$(grep -Eaom1 '([0-9]+\.){3}[0-9]+' "$CHRFILES"/opt/WidevineCdm/_platform_specific/linux_arm/libwidevinecdm.so)"
                                                    WVMGR="$(echo $WVVER | cut -d. -f1)"
                                                    WVMIN="$(echo $WVVER | cut -d. -f2)"
                                                    echo "{\"version\":\"$WVVER\",\"x-cdm-codecs\":\"vp8,vp9.0,avc1,av01\",\"x-cdm-host-versions\":\"$WVMIN\",\"x-cdm-interface-versions\":\"$WVMIN\",\"x-cdm-module-versions\":\"$WVMGR\"}" > "$CHRFILES"/opt/WidevineCdm/manifest.json

                                                    # Extract the libs out and copy them to a compressed tar archive
                                                    ARCHIVE_NAME="widevine-flash-$(date '+%Y%m%d')_armhf.tgz"
                                                    echo "Extracting and compressing files"
                                                    tar -C"$CHRFILES" -caf "$ARCHIVE_NAME" opt/WidevineCdm/manifest.json opt/WidevineCdm/_platform_specific/linux_arm/libwidevinecdm.so opt/google/chrome/PepperFlash/libpepflashplayer.so --format ustar --owner 0 --group 0
                                                    rm -r "$CHRFILES"
                                                    echo "Created: $ARCHIVE_NAME"

                                                    # Cleanup
                                                    if [ "$USER" = "root" ]; then
                                                      umount "$MNTPNT"
                                                        losetup -d "$LOOPD"
                                                          rmdir "$MNTPNT"
                                                          else
                                                            ALLMNTS="$(lsblk -lo NAME,MOUNTPOINT "$LOOPD" | sed -n '/\//s/^\(loop[0-9]\+p[0-9]\+\).*/\1/p')"
                                                              echo "$ALLMNTS" | xargs -I{} -n1 udisksctl unmount -b /dev/{}
                                                                if [ "$LOOPD" != "$(losetup -f)" ]; then
                                                                    udisksctl loop-delete -b "$LOOPD"
                                                                      fi
                                                                      fi
                                                                      if [ "$DEL_IMG" = "N" ] || [ "${1:-EMPTY}" = "-k" ]; then
                                                                        :
                                                                        else
                                                                          rm "$CHROMEOS_IMG_PATH/$CHROMEOS_IMG"
                                                                            rmdir -v "$CHROMEOS_IMG_PATH"
                                                                            fi

                                                                            # Inform the user how to proceed
                                                                            cat <<EOF
