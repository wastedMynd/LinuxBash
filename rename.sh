#!bin/bash

#$1: source
source=$1

#$2: destination
destination=$2

# is the source, a file or folder?
type=$( [[ -f ${source} ]] && echo 'File') || $( [[ -d ${source} ]] && echo 'Folder' )

echo 'Renaming, '${type}' '${source}'; to '${destination}' ...'

function copy(){

$( [[ -f ${source} ]] && cp ${source} ${destination} ) || $( [[ -d ${source} ]] && cp -r ${source} ${destination} )

}

function remove(){

$( [[ -f ${source} ]] && rm ${source} ) || $( [[ -d ${source} ]] && rmdir -r ${source} )

}


function validate_renaming(){

if  [[ -f ${destination} ]] || [[ -d ${destination} ]]; then

 echo ${type}' '${source}', was renamed; to '${destination}' ... successfuly.'

else

 echo ${type}' '${source}', was not renamed; to '${destination}' ... something; went wrong!'

 $( [[ -f ${source} ]] || [[ -d ${source} ]] ) && echo ${type}' '${source}'; was not modified!'

fi

}


copy && remove && validate_renaming
