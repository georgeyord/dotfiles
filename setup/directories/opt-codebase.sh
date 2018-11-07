#!/usr/bin/env bash
set -e

CURRENT_USER="$(whoami)"

sudo mkdir -p /opt
chown "${CURRENT_USER}" /opt

mkdir -p /opt/codebase/georgeyord