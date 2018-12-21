#!/bin/bash
black='\033[30;1m'
red='\033[31;1;4m'
green='\033[32;1;4m'
yellow='\033[33;1m'
reset='\033[0m'
arrow='\033[36;5m↳'

# define first argument as the ASN that will be looked up
ASN=$1

# PeeringDB API resources by ASN: https://www.peeringdb.com/apidocs/#/
ENDPOINT='https://www.peeringdb.com/api/net?asn__in='

# PeeringDB API resources by ASN
HEADER='Accept: application/json'

# Limit delimeters to tabs and new lines
IFS=$'\t\n'

getOrg=()
  # PeeringDB API call with output mapped to an array
  CALL=$(curl -sS -X GET --header "$HEADER" "${ENDPOINT}${ASN}")
  # Use jq to filter the response and output raw Org name
  ORG+=( $( jq '.["data"][]|.["name"]' -r <<< "$CALL" ) )
  # If PeeringDB field 'name' is empty, return an error with pretty colors
  if [[ $ORG == "" ]]
    then printf "${black}AS$ASN${nocolor} ${red}does not have a PeeringDB entry${reset}\n";
  else
  # If PeeringDB field 'name' is not empty, return the data
    # Clean up delimeters
    unset $IFS;
    # return filtered respose to stdout with pretty colors
    printf "\n";
    printf "%1s$arrow%1s${yellow}AS$ASN${reset} belongs to ${green}${ORG}${reset}\n";
    printf "\n";
fi
exit 0
