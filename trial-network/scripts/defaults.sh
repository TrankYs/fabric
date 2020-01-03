#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

# add binaries directory to collection of $PATH directories
# export configtx.yaml path to FABRIC_CFG_PATH so the script knows where to find it
# disable verbose logging level
function exportPaths() {

	# prepending $PWD/../bin to PATH to ensure we are picking up the correct binaries
	# this may be commented out to resolve installed version of tools if desired
	export PATH=${PWD}/../bin:${PWD}:$PATH
	
	# export configtx.yaml path to FABRIC_CFG_PATH so the script knows where to find it
	export FABRIC_CFG_PATH=${PWD}

	# disable verbose logging level
	export VERBOSE=false
	
	# default orderer name
	export ORDERER_NAME=Orderer
	
	# default orderer domain
	export ORDERER_DOMAIN=example.com
	
	# default orderer MSP name and ID
	export ORDERER_MSP_NAME="$ORDERER_NAME"MSP
	
	# default org1 name
	export ORG1_NAME=Org1

	# default org1 name (lowercase)
	export ORG1_LOWERCASE_NAME="${ORG1_NAME,,}"
	
	# default org1 domain
	export ORG1_DOMAIN="$ORG1_LOWERCASE_NAME".example.com
	
	# default org1 MSP name and ID
	export ORG1_MSP_NAME="$ORG1_NAME"MSP
	
	# default org2 name
	export ORG2_NAME=Org2	

	# default org2 name (lowercase)
	export ORG2_LOWERCASE_NAME="${ORG2_NAME,,}"
	
	# default org2 domain
	export ORG2_DOMAIN="$ORG2_LOWERCASE_NAME".example.com
	
	# default org2 MSP name and ID
	export ORG2_MSP_NAME="$ORG2_NAME"MSP
	
}

# Obtain the OS and Architecture string that will be used to select the correct
# native binaries for your platform, e.g., darwin-amd64 or linux-amd64
OS_ARCH=$(echo "$(uname -s | tr '[:upper:]' '[:lower:]' | sed 's/mingw64_nt.*/windows/')-$(uname -m | sed 's/x86_64/amd64/g')" | awk '{print tolower($0)}')

# timeout duration - the duration the CLI should wait for a response from
# another container before giving up
CLI_TIMEOUT=10

# default for delay between commands
CLI_DELAY=3

# system channel name defaults to "byfn-sys-channel"
SYS_CHANNEL="byfn-sys-channel"

# channel name defaults to "mychannel"
CHANNEL_NAME="mychannel"

# ca launch set to true by default
CERTIFICATE_AUTHORITIES=true

# use this as the default docker-compose yaml definition
COMPOSE_FILE=docker-compose-cli.yaml

# couchdb compose file
COMPOSE_FILE_COUCH=docker-compose-couch.yaml

# kafka and zookeeper compose file
COMPOSE_FILE_KAFKA=docker-compose-kafka.yaml

# two additional etcd/raft orderers
COMPOSE_FILE_RAFT2=docker-compose-etcdraft2.yaml

# certificate authorities compose file
COMPOSE_FILE_CA=docker-compose-ca.yaml

# use golang as the default language for chaincode
LANGUAGE=node

# default image tag
IMAGETAG="latest"

# default consensus type
CONSENSUS_TYPE="solo"