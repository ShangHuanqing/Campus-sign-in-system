<%@page import="com.cn.web.school.po.Student"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.cn.web.school.po.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="no-js">
<head>
<title>签到平台登录</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/Iframe.css" />
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css">
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script src="js/jquery.mobile-1.4.5.min.js"></script>
<!-- <script>
$(document).on("pagebeforecreate",function(){
  alert("pagebeforecreate 事件触发 - 页面即将初始化。jQuery Mobile 还未增强页面");
});                     
$(document).on("pagecreate",function(){
  alert("pagecreate 事件触发 - 页面已经创建，但还未增强完成");
});
</script> -->
<style>
body,html {width:100%;height:100%;}
.containerS { width:100%; height:100%;}
</style>
</head>
<body>
<%
Student student = (Student)session.getAttribute("student1");
//判断user是否为空，如果不为空才操作以下。不然会报空指针异常。 
if(student != null){ 
 System.out.println("管理平台--Session数据获取--studentevent.jsp: "+student.getCode()+student.getName());
} else{
	 System.out.println("管理平台--Session数据获取--studentevent.jsp: 未获取Session");
}
String name = student.getName();
%> 
<div data-role="page" id="pageone">
  <div data-role="panel" id="myPanel"> 
   <p><%=name%></p>
    <h2></h2>
    <p></p>
  </div> 

  <div data-role="header">
    <a href=<c:url value="/index"/> target="studentFrame" data-transition="slide" data-direction="reverse" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left">目录</a>
    <h1></h1>
    <a href="studentloginA" data-transition="slide" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-right">退出</a>
  </div>

  <div data-role="content" >
  <div class="ui-grid-b">
    <iframe id="studentFrame" name="studentFrame"  style="overflow:visible; background-image:url(images/centerback.jpg);
                background-positon: 100%, 100%;             
                -moz-background-size:100% 100%;
                background-size:100% 100%;
                background-repeat: no-repeat;"scrolling="yes" frameborder="no" width="100%" height="500px"></iframe>
  </div>         
  </div>

  <div data-role="footer"  data-theme="b">
	      <div data-role="navbar">
	      <ul>
	        <li><a href=<c:url value="/classChoose"/> target="studentFrame" data-icon="edit" class="ui-btn-active">选课</a></li>
	        <li><a href=<c:url value="/classTable"/> target="studentFrame" data-icon="calendar">课表</a></li>
	        <li><a href=<c:url value="/recordnow"/> target="studentFrame" data-icon="clock">签到</a></li>
	        <li><a href=<c:url value="/recordhis"/> target="studentFrame" data-icon="search">考勤历史</a></li>
	         <li><a href=<c:url value="/presoninfor"/> target="studentFrame" data-icon="user">个人信息</a></li>
	      </ul>
    	 </div>  
  </div>
</div> 

</body>
</html>
