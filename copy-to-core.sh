#!/usr/bin/env bash

GENERATOR_HOME=$(cd $(dirname "${BASH_SOURCE}")/ && pwd)

target=$1
if [[ -z $target ]]; then
  target=$GENERATOR_HOME/../common/common-mapper
fi

# mkcp
rm -rf "$target"/src/main/java/com/lottery/master/dao/*.java
rm -rf "$target"/src/main/java/com/lottery/master/dto/*.java
rm -rf "$target"/src/main/resources/com/lottery/master/dao/*.xml
cp -fR "$GENERATOR_HOME"/example/src/main/java/com/lottery/master "$target"/src/main/java/com/lottery/
cp -fR "$GENERATOR_HOME"/example/src/main/resources/com/lottery/master "$target"/src/main/resources/com/lottery/
rm -rf "$target"/src/main/java/com/lottery/master/dao/TicketBetOrder*.java
rm -rf "$target"/src/main/java/com/lottery/master/dto/TicketBetOrder*.java

# mkcp_yabo
rm -rf "$target"/src/main/java/com/lottery/merchant/dao/*.java
rm -rf "$target"/src/main/java/com/lottery/merchant/dto/*.java
rm -rf "$target"/src/main/resources/com/lottery/merchant/dao/*.xml
cp -fR "$GENERATOR_HOME"/example/src/main/java/com/lottery/merchant "$target"/src/main/java/com/lottery/
cp -fR "$GENERATOR_HOME"/example/src/main/resources/com/lottery/merchant "$target"/src/main/resources/com/lottery/
