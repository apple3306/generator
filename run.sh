#!/usr/bin/env bash

GENERATOR_HOME=$(cd $(dirname "${BASH_SOURCE}")/ && pwd)

mvn clean install -Dmaven.test.skip -pl plugin -U

# mkcp
rm -rf "$GENERATOR_HOME"/example/src/main/java/com/lottery/master/dao/*.java
rm -rf "$GENERATOR_HOME"/example/src/main/java/com/lottery/master/dto/*.java
rm -rf "$GENERATOR_HOME"/example/src/main/resources/com/lottery/master/dao/*.xml
mvn mybatis-generator:generate -Dmaven.test.skip -Dmodel.target.project=example/src/main/java \
                               -Ddao.target.project=example/src/main/java \
                               -Dmapper.target.project=example/src/main/resources \
                               -pl example -U

# mkcp_yabo
rm -rf "$GENERATOR_HOME"/example/src/main/java/com/lottery/merchant/dao/*.java
rm -rf "$GENERATOR_HOME"/example/src/main/java/com/lottery/merchant/dto/*.java
rm -rf "$GENERATOR_HOME"/example/src/main/resources/com/lottery/merchant/dao/*.xml
mvn mybatis-generator:generate -Dmaven.test.skip -Dmodel.target.project=example/src/main/java \
                               -Ddao.target.project=example/src/main/java \
                               -Dmapper.target.project=example/src/main/resources \
                               -Dgenerator.configurationFile=src/main/resources/generatorConfigMkcpYabo.xml \
                               -Dmodel.target.package=com.lottery.merchant.dto \
                               -Ddao.target.package=com.lottery.merchant.dao \
                               -Dmapper.target.package=com.lottery.merchant.dao \
                               -Djdbc.url="jdbc:mysql://172.18.3.60:3330/mkcp_demo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF8&zeroDateTimeBehavior=convertToNull&nullCatalogMeansCurrent=true" \
                               -pl example -U