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
<script type="text/javascript" src="js/login.js"></script>
<script src="js/jquery.mobile-1.4.5.min.js"></script>
	<style>
	.containerS{width:100%; height:700px; float:left;margin-left:20%;margin-top:5%;}
	.blockS { height: 100%;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px;}
	.blockS2 { height: 100%; border:0;  background-color: blue; background-color: rgba(165, 26, 15, 0.75);}
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
String code = student.getCode();
String school = student.getSchoolCode();
String password = student.getPassword();
%> 

<!--   <div data-role="header">
   <a href="" data-transition="slide" data-direction="reverse" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left">主页</a>
    <h1>&nbsp;</h1>
  </div> -->
  

  <p style="color:red;">${message}</p>
   <c:url value="/changestudent" var="changestudent" /> 
    <form  action="${changestudent}" method="post" data-ajax="false" id="regUser" onclick="return but()">
        <div>
        
          <div id="userCue" class="cue">输入正确密码后修改密码</div>
          
          <label for="usrnm" class="ui-hidden-accessible">姓名:</label>
                    <input type="text" readonly="readonly" name="name" value=<%=name%>>	
           <label for="usrnm" class="ui-hidden-accessible">学号:</label>
                     <input type="text" readonly="readonly" name="code" value=<%=code%> >	
           <label for="usrnm" class="ui-hidden-accessible">所属大学:</label>
                      <input type="text" readonly="readonly" name="schoolCode" value=<%=school%>>	
           <input type="hidden" name=""  onblur="but()" id="userpass" value=<%=password%>>	
           <label for="usrnm" class="ui-hidden-accessible">密码：</label>
                      <input type="text" name="" onblur="but()" id="putpass" onkeyup="this.value=this.value.replace(/[^\w]/g,'');" placeholder="请输入旧密码">	
           <label for="usrnm" class="ui-hidden-accessible">新密码：</label>
                      <input type="text" name="password"  onblur="but()" id="passwd" onkeyup="this.value=this.value.replace(/[^\w]/g,'');" placeholder="请输入新密码">	
           <label for="usrnm" class="ui-hidden-accessible">确认密码:</label>
                      <input type="text" name="" id="passwd2"  onclick="but()" onkeyup="this.value=this.value.replace(/[^\w]/g,'');" placeholder="请输入确认密码">	
          <input type="submit" id="reg"   onclick="but()" value="修改密码">  
        </div>
        <script type="text/javascript" language="javaScript">
		
			function but(){
				   var val1=document.getElementById('userpass').value;
				   var val2=document.getElementById('putpass').value;
				   var val3=document.getElementById('reg');
				   var pas1 =document.getElementById('passwd').value;
				   var pas2 =document.getElementById('passwd2').value;
				   if(val1 == val2){
					   $('#userCue').html("<font color='black'><b>输入新密码</b></font>");
					   if(pas1 == val1){
						  
						   //alert("若更改用户密码，！");
						   $('#userCue').html("<font color='red'><b>输入密码与原密码相同，请重新修改</b></font>");	
						   return false;
					   }else{
						   
						   if(pas1 == ""||pas1 == null){
							   $('#userCue').html("<font color='red'><b>请输入新密码</b></font>");	
							   return false;
						   }else{
								  if(pas1 == pas2){
									  return true;
								  }else{
									$('#userCue').html("<font color='red'><b>确认密码不同，请重新输入</b></font>");	
									return false;
								  }
						   }					   
					   }				      
				   }else 
				   {				
						   $('#userCue').html("<font color='red'><b>请输入正确登录密码以便更改</b></font>");
						   return false;					
				
				   }				
			}
		</script>
      </form>
</body>
</html>
