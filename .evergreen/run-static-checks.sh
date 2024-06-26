#!/bin/bash

set -o xtrace   # Write all commands first to stderr
set -o errexit  # Exit the script with error if any of the commands fail

############################################
#            Main Program                  #
############################################

export JAVA_HOME=/opt/java/jdk11

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
if [ "$OS" == "darwin" ]; then
   sudo xcode-select -s /Applications/Xcode13.2.1.app
fi

echo "Compiling and running checks"

./gradlew --stop
./gradlew -version
./gradlew --info clean check -x allTests -x spotlessApply
