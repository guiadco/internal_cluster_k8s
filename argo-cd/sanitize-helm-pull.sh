#!/bin/bash
if [[ $@ = pull* && "$@" == *"oci://"* ]]; then
    # If the command is `helm pull (..)` skips --repo flag and chartName
    # from command line args to make helm pull run

    # For explanation:
    # https://github.com/kubernetes-sigs/kustomize/issues/4381
    arr=(${@//--repo/});  # Skipping --repo
    args=(${arr[@]:0:5} ${arr[@]:6});  # Skipping chartName
else
    args=$@
fi
helm ${args[@]}
