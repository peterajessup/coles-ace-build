oc project cp4i
set +e
oc delete Configuration key.jks
oc delete Configuration httpsconf
oc delete Configuration mqpolicy
oc delete Configuration scramparms


set -e

bash -x createConfig.sh serverconf httpsconf config/server.conf.yaml
bash -x createConfig.sh keystore key.jks config/key.jks
bash -x createConfig.sh setdbparms scramparms config/setdbparms.txt
bash -x createConfig.sh policyproject mqpolicy config/MQPolicy.zip

oc apply -f yaml/aceIVTDeploy.yaml
