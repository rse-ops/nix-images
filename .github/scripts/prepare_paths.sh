#!/bin/bash

set -e
parsed=""
for file in ${changed_files}; do
    filename=$(basename ${file})

    # If we find a Dockerfile, change to uptodate.yaml if it exists
    if [[ "$filename" == "Dockerfile" ]]; then
        dir=$(dirname ${file})
        uptodate_yaml=${dir}/uptodate.yaml
        if [[ -e "${uptodate_yaml}" ]]; then
            parsed="${parsed} ${uptodate_yaml}"
        fi
    fi
done
echo ${parsed}

# No parsed results will build ALL
if [[ "${parsed}" == "" ]]; then
    parsed="/does/not/exist/pathy"
fi

echo "parsed_files=${parsed}" >> $GITHUB_OUTPUT
