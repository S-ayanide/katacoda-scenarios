#!/bin/bash
# Scraping the latest version of litmus

curl=$(which curl)
url="https://docs.litmuschaos.io/docs/getstarted/"
version=""
command=""

function extract_version() {
	version=$($curl $url | grep "content" | sed 's/[content="]/\n/g' | sed -n '156p')
	version_error_check
}

function apply_command() {
	command="https://litmuschaos.github.io/litmus/litmus-operator-v${version}.yaml"
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
echo $version

#END
