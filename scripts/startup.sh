#!/usr/bin/env bash

sysctl -w vm.max_map_count=262144
ulimit -n 65536
