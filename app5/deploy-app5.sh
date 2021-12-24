#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================deploy gradle w jacoco coveralls============================================================="

cd app5
chmod +x gradlew

./gradlew assemble
./gradlew check

echo "=============================deploy gradle w jacoco coveralls============================================================="
