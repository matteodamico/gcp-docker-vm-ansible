#!/bin/bash

pushd ansible/roles/atosatto.docker-swarm

tox -e py27-ansible29 -- molecule test -s swarm-singlenode

popd
