#!/bin/bash

set -e

npm install

serverless $@
