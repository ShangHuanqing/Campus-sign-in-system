package com.cn.web.school.util;

import java.util.List;

import org.mybatis.generator.api.CommentGenerator;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.ShellRunner;
import org.mybatis.generator.api.dom.java.Field;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.JavaVisibility;
import org.mybatis.generator.api.dom.java.Method;
import org.mybatis.generator.api.dom.java.Parameter;
import org.mybatis.generator.api.dom.java.TopLevelClass;
import org.mybatis.generator.api.dom.xml.Attribute;
import org.mybatis.generator.api.dom.xml.TextElement;
import org.mybatis.generator.api.dom.xml.XmlElement;

/**
 * 
 * Class PaginationPlugin description goes here.
 * 
 * @version 1.0, 2013-2-3
 * @author alphabeta
 */
public class PaginationPlugin extends PluginAdapter {

    /*
     * 
     * <p>Title: validate</p> <p>Description: </p>
     * 
     * @param arg0
     * 
     * @return
     * 
     * @see org.mybatis.generator.api.Plugin#validate(java.util.List)
     */
	
    @Override
    public final boolean validate(List<String> arg0) {
        return true;
    }

    /*
     * 
     * <p>Title: modelExampleClassGenerated</p> <p>Description: </p>
     * 
     * @param topLevelClass
     * 
     * @param introspectedTable
     * 
     * @return
     * 
     * @see
     * org.mybatis.generator.api.PluginAdapter#modelExampleClassGenerated(org
     * .mybatis.generator.api.dom.java.TopLevelClass,
     * org.mybatis.generator.api.IntrospectedTable)
     */
    @Override
    public final boolean modelExampleClassGenerated(
            TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        // add field, getter, setter for limit clause
        addLimit(topLevelClass, introspectedTable, "start");
        addLimit(topLevelClass, introspectedTable, "limit");
        return super.modelExampleClassGenerated(topLevelClass,
                introspectedTable);
    }

    /*
     * 
     * <p>Title: sqlMapSelectByExampleWithoutBLOBsElementGenerated</p>
     * <p>Description: </p>
     * 
     * @param element
     * 
     * @param introspectedTable
     * 
     * @return
     * 
     * @see org.mybatis.generator.api.PluginAdapter#
     * sqlMapSelectByExampleWithoutBLOBsElementGenerated
     * (org.mybatis.generator.api.dom.xml.XmlElement,
     * org.mybatis.generator.api.IntrospectedTable)
     */
    @Override
    public final boolean sqlMapSelectByExampleWithoutBLOBsElementGenerated(
            XmlElement element, IntrospectedTable introspectedTable) {
        XmlElement isNotNullElement = new XmlElement("if");
        isNotNullElement.addAttribute(new Attribute("test", "start > -1"));
        isNotNullElement
                .addElement(new TextElement("limit #{start} , #{limit}"));
        element.addElement(isNotNullElement);
        return super.sqlMapUpdateByExampleWithoutBLOBsElementGenerated(element,
                introspectedTable);
    }

    /**
     * 
     * Method addLimit documentation comment.
     * 
     * @param topLevelClass
     *            topLevelClass
     * @param introspectedTable
     *            introspectedTable
     * @param name
     *            name
     */
    private void addLimit(TopLevelClass topLevelClass,
            IntrospectedTable introspectedTable, String name) {
        CommentGenerator commentGenerator = context.getCommentGenerator();
        Field field = new Field();
        field.setVisibility(JavaVisibility.PROTECTED);
        field.setType(FullyQualifiedJavaType.getIntInstance());
        field.setName(name);
        field.setInitializationString("-1");
        commentGenerator.addFieldComment(field, introspectedTable);
        topLevelClass.addField(field);
        char c = name.charAt(0);
        String camel = Character.toUpperCase(c) + name.substring(1);
        Method method = new Method();
        method.setVisibility(JavaVisibility.PUBLIC);
        method.setName("set" + camel);
        method.addParameter(new Parameter(FullyQualifiedJavaType
                .getIntInstance(), name));
        method.addBodyLine("this." + name + "=" + name + ";");
        commentGenerator.addGeneralMethodComment(method, introspectedTable);
        topLevelClass.addMethod(method);
        method = new Method();
        method.setVisibility(JavaVisibility.PUBLIC);
        method.setReturnType(FullyQualifiedJavaType.getIntInstance());
        method.setName("get" + camel);
        method.addBodyLine("return " + name + ";");
        commentGenerator.addGeneralMethodComment(method, introspectedTable);
        topLevelClass.addMethod(method);
    }

    /**
     * 
     * Method generate documentation comment.
     * 
     */
    public static void generate() {
        String config = PaginationPlugin.class.getClassLoader()
                .getResource("generatorConfig.xml").getFile();
        String[] arg = {"-configfile", config, "-overwrite"};
        ShellRunner.main(arg);
    }

    /**
     * 
     * Method main documentation comment.
     * 
     * @param args
     *            arguments
     */
    public static void main(String[] args) {
        generate();
    }
}
