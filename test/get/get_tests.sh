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
  "test1")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:1, path: <elem: <name:'system'> elem:<name:'clock'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt
    ;;
   "test2")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:2, path: <elem: <name:'system'> elem:<name:'clock'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    "test3")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:0, path: <elem: <name:'system'> elem:<name:'clock'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    "test4")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:1, path: <elem: <name: 'system'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    "test5")
    gnmi_cli -address localhost:10161 -get \
    -proto "type:2, path: <elem: <name: 'system'>>" \
    -timeout 5s -alsologtostderr \
    -client_crt $ONOS_SIMULATORS_ROOT/pkg/certs/client1.crt \
    -client_key $ONOS_SIMULATORS_ROOT/pkg/certs/client1.key \
    -ca_crt $ONOS_SIMULATORS_ROOT/pkg/certs/onfca.crt;;
    *) echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac

# Test Case 5: Get All State Leaves under /system
 

