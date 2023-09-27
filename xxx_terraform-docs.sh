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

if ! command -v terraform-docs &> /dev/null
    then
    echo "!!! Plaese ensure you have terraform-docs installed & on your path !!!"
    echo -e "https://github.com/terraform-docs/terraform-docs\n"
    exit 42
fi

if [ "$#" -ne 1 ]; then
    echo "USAGE: ./xxx_terraform-docs.sh \${YOUR_TERRAFORM_EXEC}"
    echo "e.g > ./xxx_terraform-docs.sh terraform_v1.0.6"
    exit 0
fi

terraform_exec=$1

### Run tf fmt
$terraform_exec fmt -recursive

unique_tf_dirs=$(find ./ -not -path "*/\.*" -not -path "*venv/*" -not -path "*node_modules/*" -iname "*.tf" -exec dirname {} \; | uniq)

for tf_dirs in $unique_tf_dirs; do
    cd $tf_dirs
        # TODO: customise this further to enrich READMEs and create links to them from root directory
        terraform-docs markdown table --output-file README.md --output-mode inject .
    cd -
done