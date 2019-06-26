#!/bin/bash

ONOS_SIMULATORS_ROOT=$GOPATH/src/github.com/onosproject/simulators

if [ -z $1 ]
then
  testId="*** Unknown Test ***"
elif [ -n $1 ]
then
# otherwise make first arg as a rental
  testId=$1
fi


case "$testId" in
  ## Get "clock" config value with type CONFIG
  "test1")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:1, path: <elem: <name:'system'> elem:<name:'clock'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt
    ;;
    ## Get "clock" config value with type STATE
   "test2")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:2, path: <elem: <name:'system'> elem:<name:'clock'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get "clock" config value with type ALL
    "test3")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:0, path: <elem: <name:'system'> elem:<name:'clock'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All Config leaves under /system
    "test4")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:1, path: <elem: <name: 'system'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All State Leaves under /system
    "test5")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:2, path: <elem: <name: 'system'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All config leaves under /system/openflow/controllers/
    "test6")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:1, path: <elem: <name: 'system'> elem: <name: 'openflow'> elem: <name: 'controllers'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All state leaves under /system/openflow/controllers
    "test7")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:2, path: <elem: <name: 'system'> elem: <name: 'openflow'> elem: <name: 'controllers'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All config leaves under /system/config
    "test8")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:1, path: <elem: <name:'system'> elem:<name:'config'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All Config values under the root
    "test9")
     gnmi_cli -address localhost:10161 -get \
    -proto "type:1" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    ## Get All State values under the root
    "test10")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:2" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    *) echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac

 

