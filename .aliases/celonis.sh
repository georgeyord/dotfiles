#!/usr/bin/env bash

alias cel_aws_login="aws sso login "
alias cel_docker_login="aws ecr get-login-password --region eu-central-1 --profile 652406827250_CelonisEngineer | docker login --username AWS --password-stdin 652406827250.dkr.ecr.eu-central-1.amazonaws.com"
