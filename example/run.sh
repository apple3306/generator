#!/usr/bin/env bash

GENERATOR_HOME=$(cd $(dirname "${BASH_SOURCE}")/ && pwd)

# mkcp
rm -rf "$GENERATOR_HOME"/src/main/java/com/lottery/master/dao/*.java
rm -rf "$GENERATOR_HOME"/src/main/java/com/lottery/master/dto/*.java
rm -rf "$GENERATOR_HOME"/src/main/resources/com/lottery/master/dao/*.xml
mvn mybatis-generator:generate -f "$GENERATOR_HOME"/pom.xml -Dmaven.test.skip -U

# mkcp_yabo
rm -rf "$GENERATOR_HOME"/src/main/java/com/lottery/merchant/dao/*.java
rm -rf "$GENERATOR_HOME"/src/main/java/com/lottery/merchant/dto/*.java
rm -rf "$GENERATOR_HOME"/src/main/resources/com/lottery/merchant/dao/*.xml
mvn mybatis-generator:generate -Dmaven.test.skip \
                               -Dgenerator.configurationFile=src/main/resources/generatorConfigMkcpYabo.xml \
                               -Dmodel.target.package=com.lottery.merchant.dto \
                               -Ddao.target.package=com.lottery.merchant.dao \
                               -Dmapper.target.package=com.lottery.merchant.dao \
                               -Djdbc.url="jdbc:mysql://172.18.3.31:3306/mkcp_bob?useUnicode=true&characterEncoding=UTF8&zeroDateTimeBehavior=convertToNull&nullCatalogMeansCurrent=true" \
                               -f "$GENERATOR_HOME"/pom.xml -U
