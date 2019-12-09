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
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css">
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script src="js/jquery.mobile-1.4.5.min.js"></script>
	<style>
	.containerS{width:100%; height:700px; float:left;margin-left:20%;margin-top:5%;}
	.blockS { height: 100%;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px;}
	.blockS2 { height: 100%; border:0;  background-color: blue; background-color: rgba(165, 26, 15, 0.75);}
	</style>
</head>
<body>
<input type="hidden" id = "json" value=${jsoninfo} >

<!--   <div data-role="header">
   <a href="" data-transition="slide" data-direction="reverse" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left">主页</a>
    <h1>&nbsp;</h1>
  </div> -->
  

  <p style="color:red;">${message}</p>
  <table data-role="table" data-mode="columntoggle" class="ui-responsive" id="test">
      <thead>
         <tr>
		  <th data-priority="1">课程标识</th>
          <th data-priority="1">考勤标识</th>
          <th data-priority="1">签到时间</th>
          <th data-priority="1">签到状态</th>
        </tr>
      </thead>
      <tbody>
			<c:forEach var="recordinfor" items="${recordinfor}">
						<tr>
							<td>${recordinfor.schedulCode}</td>
							<td>${recordinfor.attendcode}</td>						
							<td><spring:eval expression="recordinfor.time" /></td>
							<td>${recordinfor.valid}</td>

						</tr>
			</c:forEach>
      </tbody>
    </table> 
</body>
</html>
