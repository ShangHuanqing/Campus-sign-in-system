<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>登陆成功</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	登陆成功,欢迎您，用户
	<p>${username}</p>
</body>
</html> --%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="no-js">
<head>
<title>考勤系统管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/teacher_index.css" type="text/css" media="screen" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/tendina.min.js"></script>
<script type="text/javascript" src="js/teacher_common.js"></script>

</head>
<body>
<div class="top">
<% 
String datetime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
%> 
            <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #fff">考勤管理平台</h1></span></div>
            <div id="ad_setting" class="ad_setting">
                <a class="ad_setting_a" href="javascript:; " id="username1"><p>欢迎您!&nbsp;${teacher.getName()}老师,登录时间:<%=datetime%></p> </a>
                <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
                    <li class="ad_setting_ul_li"> <a href="center.jsp" target="menuFrame"><i class="icon-user glyph-icon"></i>个人中心</a> </li>
                    <!-- <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-cog glyph-icon"></i>设置</a> </li> -->
                    <li class="ad_setting_ul_li"> <a href="login"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span> </a> </li>
                </ul>
                <img class="use_xl" src="images/right_menu.png" />
            </div>
    </div>
    <!--顶部结束-->
    <!--菜单-->
    <div class="left-menu">
        <ul id="menu">
            <li class="menu-list">
               <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>课程管理<s class="sz"></s></a>
                <ul>
                    <li><a href="企业资料管理.html" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>课程发布管理</a></li>
                    <li><a href="产品管理.html" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>课表信息管理</a></li>
                   <!--  <li><a href="我的微网站.html" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>我的微网站</a></li> -->
                </ul>
            </li>
            <li class="menu-list">
               <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>考勤管理<s class="sz"></s></a>
                <ul>
                    <li><a href="企业资料管理.html" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>考勤发布管理</a></li>
                    <li><a href="产品管理.html" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>考勤信息管理</a></li>
                    <!-- <li><a href="我的微网站.html" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>我的微网站</a></li> -->
                </ul>
            </li>
        </ul>
    </div>
    
    <!--菜单右边的iframe页面-->
    <div id="right-content" class="right-content">
        <div class="content">
            <div id="page_content">
                <iframe id="menuFrame" name="menuFrame" src="企业资料管理.html" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
            </div>
        </div>
    </div>
    
</body>
</html>