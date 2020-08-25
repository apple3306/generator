package com.lottery.generator.plugin;

import java.sql.Types;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.internal.types.JavaTypeResolverDefaultImpl;

/**
 * Created by Dyer on 11/17/19.
 */
public class CustomerJavaTypeResolver extends JavaTypeResolverDefaultImpl {

    /**
     * Constructor.
     */
    public CustomerJavaTypeResolver() {
        super();
        //把数据库的 TINYINT 映射成 Integer
        super.typeMap.put(Types.TINYINT, new JdbcTypeInformation("TINYINT",
            new FullyQualifiedJavaType(Integer.class.getName())));
    }
}
