package com.lottery.generator.plugin;

import java.util.List;
import java.util.Properties;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.Interface;
import org.mybatis.generator.internal.util.StringUtility;

/**
 * Created by Dyer on 2019/8/22.
 */
public class AnnotationAddPlugin extends PluginAdapter {

    private boolean addRepositoryAnnotation = true;

    @Override
    public void setProperties(Properties properties) {
        super.setProperties(properties);
        String addMapperAnnotation = this.properties.getProperty("addRepositoryAnnotation");
        if (StringUtility.stringHasValue(addMapperAnnotation)) {
            this.addRepositoryAnnotation = addMapperAnnotation.equalsIgnoreCase("true");
        }
    }

    public boolean validate(List<String> list) {
        return true;
    }

    @Override
    public boolean clientGenerated(Interface interfaze, IntrospectedTable introspectedTable) {
        if (addRepositoryAnnotation) {
            interfaze.addImportedType(
                new FullyQualifiedJavaType("org.springframework.stereotype.Repository"));
            interfaze.addAnnotation("@Repository");
        }
        return super.clientGenerated(interfaze, introspectedTable);
    }
}
