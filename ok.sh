#!/bin/sh

set -o errexit
set -o nounset

# Check if the script is running on a CI
CI_WORKSPACE=${CI_WORKSPACE:-}

LOCAL_PATH=${CI_WORKSPACE:-/tmp/ok}
PROFILE=${PROFILE:-generic}
REPOSITORY="https://github.com/davidmogar/ok.git"
TAGS=${TAGS:-all}

check_dependencies() {
    info "Checking dependencies..."

    missing_dependencies=false

    command_exists ansible || {
        missing_dependencies=true
		error "ansible is not installed"
	}

    command_exists git || {
        missing_dependencies=true
		error "git is not installed"
	}

    command_exists sudo || {
        missing_dependencies=true
		error "sudo is not installed"
	}

    if [ "$missing_dependencies" = true ]; then
        exit 1
    fi
}

clone_repository() {
    if [ -n "$CI_WORKSPACE" ]; then
        warning "Running on a CI workflow. Skipping clonning..."
    else
        if [ -d ${LOCAL_PATH} ]; then
            info "Old installation found. Deleting..."
            rm -rf ${LOCAL_PATH}
        fi

        info "Clonning repository into '${LOCAL_PATH}'..."
        mkdir -p $LOCAL_PATH
        git clone $REPOSITORY $LOCAL_PATH
    fi
}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2;
}

info() {
    echo ${GREEN}"$@"${RESET}
}

run_playbook() {
    info "Running playbook..."
    cd $LOCAL_PATH
    ansible-playbook \
            --ask-become-pass \
            --diff \
            -i inventory playbook.yml \
            --limit $PROFILE \
            --tags $TAGS
}

setup_colors() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		GREEN=$(printf '\033[32m')
    RED=$(printf '\033[31m')
		RESET=$(printf '\033[m')
		YELLOW=$(printf '\033[33m')
	else
		GREEN=""; RED=""; RESET=""; YELLOW=""
	fi
}

warning() {
    info ${YELLOW}"Warning: $@"${RESET}
}

main() {
    if ! [ $(id -u) = 0 ]; then
        error "This boostrap script must be executed by root"
        exit 1
    fi

    setup_colors

    check_dependencies
    clone_repository
    run_playbook
}

main "$@"
