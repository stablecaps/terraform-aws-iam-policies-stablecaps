#!/bin/bash

######################################################
# Error Check Script
set -e
function trap_debugger () {
    # Function to output script error & slack alert via alt script
    local parent_lineno="$1"
    local message="$2"
    local code="${3:-1}"

    if [[ -n "$message" ]] ; then
        echo "Error on or near line ${parent_lineno}: ${message}; command yielded exit code ${code}"
    else
        echo "Error on or near line ${parent_lineno}; command yielded exit code ${code}"
    fi

    exit "${code}"
}

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

trap 'trap_debugger ${LINENO}' ERR
######################################################


if [ "$#" -ne 1 ]; then
    echo "USAGE: ./xxx_tests_destroy_examples.sh \${YOUR_TERRAFORM_EXEC}"
    echo "e.g > ./xxx_tests_destroy_examples.sh terraform_v1.0.6"
    exit 0
fi

terraform_exec=$1

EXAMPLE_DIRS=$(ls -d examples/*)


for eg_dir in $EXAMPLE_DIRS; do
    echo -e "\n\nProcess example in $eg_dir"
    cd $eg_dir
        rm -rf .terraform .terraform.lock.hcl \
            && $terraform_exec init \
            && $terraform_exec validate \
            && $terraform_exec destroy -input=false -no-color -auto-approve
    cd -
done