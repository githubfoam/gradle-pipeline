#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================deploy gradle============================================================="

gradlew clean build
# gradlew assemble
# gradlew check

echo "=============================deploy gradle============================================================="