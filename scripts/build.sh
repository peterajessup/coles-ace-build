set +e

oc project cp4i

oc delete BuildConfig aceivt

oc create -f yaml/aceIVTConfig.yaml

oc start-build aceivt --wait
