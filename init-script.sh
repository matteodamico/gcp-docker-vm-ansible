#!/bin/bash

sudo apt update;

sudo apt install ansible --assume-yes;

sudo ansible-galaxy install nickjj.docker;

