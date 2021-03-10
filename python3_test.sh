#!/bin/bash

#---------------------- Setup --------------------------------------------------------------------------------

fail_color='\033[1;31m'             #red
success_color='\033[1;32m'          #green
primary_color='\033[1;4;37m'        #Bold white underlined
secondary_color='\033[1;37m'        #Bold white
prompt_color='\033[1;33m'           #yellow
reset_color='\033[0m'

clear

test=$( ls | grep '^test_' | dmenu -p 'Please, Select a Test File:' )

#---------------------- Introduction -------------------------------------------------------------------------

echo -e ${primary_color}'Testing:'${reset_color}' "'${test}'"'

#---------------------- PEP8 Test ----------------------------------------------------------------------------

sleep 2
echo -e ${prompt_color}'\nPEP8 Testing ...\n'${reset_color}
pep8_issue_count=$(pep8 ${test} | wc -l )
echo -e 'Found on File '${test}'; '${fail_color}'"'${pep8_issue_count}'"'${reset_color}' PEP8 issues!'

#---------------------- Unit Test ----------------------------------------------------------------------------

#sleep 2
#time python3 -m unittest ${test}

#---------------------- Pytest -------------------------------------------------------------------------------

sleep 2
echo -e  ${prompt_color}'\nPytesting ...\n'${reset_color}
time python3 -m pytest -v ${test}

#---------------------- Conclusion ---------------------------------------------------------------------------

echo -e ${success_color}'\nDone!\n' ${reset_color}
