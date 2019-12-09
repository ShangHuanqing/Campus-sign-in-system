<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@ page import="com.cn.web.school.po.Teacher" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/Iframe.css" />
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script language="javascript" type="text/javascript" src="js/Blob.js"></script> 
<script language="javascript" type="text/javascript" src="js/FileSaver.js"></script> 
<script language="javascript" type="text/javascript" src="js/tableExport.js"></script> 
<title>考勤系统管理平台</title>
<style type="text/css">
table,th,td{
border:1px solid #328AA4;
border-radius:5px;
}
td input{
border:none;
}
</style>

</head>
<body style="background-image:url(images/centerback.jpg);
                background-positon: 100%, 100%;             
                -moz-background-size:100% 100%;
                background-size:100% 100%;
                background-repeat: no-repeat;">
  <center>
    <p style="color:red;">*${courcesshowr1}</p>
	<table id="table1" style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:90%;margin-top:5%;"border="1" cellspacing="0" cellpadding="0">
		<tbody style="border-radius:7px;">
		<tr>	
			<th>课程标识</th>			
			<th>课程名称</th>
			<th>上课时间</th>
			<th>起始时间</th>
			<th>下课时间</th>
			<th>上课地点</th>
			<th>课程学时</th>
			<th>课程学分</th>	
		</tr>
		<c:forEach var="courcesshowr" items="${courcesshowr}">
			<tr>
				<td>${courcesshowr.code}</td>
				<td>${courcesshowr.name}</td>
				<td>${courcesshowr.time}</td>
				<td><spring:eval expression="courcesshowr.start" /></td>
				<td><spring:eval expression="courcesshowr.end" /></td>
				<td>${courcesshowr.site}</td>
				<td>${courcesshowr.period}</td>
				<td>${courcesshowr.credit}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		<div id="export">
		<a data-type="txt" href="javascript:;">导出txt</a>
    	<a data-type="xls" href="javascript:;">导出excel</a>
        <a data-type="doc" href="javascript:;">导出word</a>
	</div>

	<script type="text/javascript">
	$(document).ready(function($){
		$('#thetable').tableScroll({
			width:480,
			height:150
		});
	});

	var $exportLink = document.getElementById('export');

	$exportLink.addEventListener('click', function(e){

		e.preventDefault();

		if(e.target.nodeName === "A"){

			tableExport('table1', '课程表', e.target.getAttribute('data-type'));

		}		

	}, false);
	</script>
 </center>
</body>
</html>