#!/bin/bash
# Scraping the latest version of litmus

curl=$(which curl)
url="https://raw.githubusercontent.com/litmuschaos/litmus/master/litmus-portal/README.md"
version=""
command=""

function extract_version() {
	version=$($curl $url | grep "https://raw.githubusercontent.com/litmuschaos/litmus/v" | sed 's/[/]/\n/g' | sed -n '6p')
	version_error_check
}

function apply_command() {
	command="https://litmuschaos.github.io/litmus/litmus-operator-${version}.yaml"
	command_error_check
}

function version_error_check() {
	[ $? -ne 0 ] && version="v1.8.x"
}

function command_error_check() {
	[ $? -ne 0 ] && command="https://litmuschaos.github.io/litmus/litmus-operator-v1.10.0.yaml"
}

extract_version
apply_command
echo $command

#END
