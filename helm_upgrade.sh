#!/usr/bin/env bash

source connect.sh

DEFAULT_VALUES_FILE=`[ -f values.yaml ] && echo "-f values.yaml"`
ENVIRONMENT_VALUES_FILE=`[ -f "values.${K8S_ENVIRONMENT_NAME}.yaml" ] && echo "-f values.${K8S_ENVIRONMENT_NAME}.yaml"`
AUTO_UPDATED_VALUES_FILE=`[ -f "values.${K8S_ENVIRONMENT_NAME}.auto-updated.yaml" ] && echo "-f values.${K8S_ENVIRONMENT_NAME}.auto-updated.yaml"`

helm upgrade $DEFAULT_VALUES_FILE $ENVIRONMENT_VALUES_FILE $AUTO_UPDATED_VALUES_FILE "${K8S_HELM_RELEASE_NAME}" . "$@"