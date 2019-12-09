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
<script type="text/javascript" src="js/login.js"></script>  <!-- 判断登录用户 -->
<script type="text/javascript" src="js/school1.js" ></script> <!--学校列表 -->
<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
.demo{width:600px;margin:20px auto;}
.demo th,.demo td{font-size:14px;padding-bottom:17px;line-height:28px;color:#666;font-family:"新宋体";font-weight:normal;}
.demo th em{color:#ff0000;font-style:normal;}
.demo td .stext{border:1px solid #ccc;font-size:14px;height:26px;line-height:26px;padding:0 3px;width:214px;color:#666;}
/* choose-box-wrapper */
#choose-box-wrapper{width:652px;background:#000;background-color:rgba(0, 0, 0, 0.5);padding:10px;border-radius:5px;display:none;}
#choose-box{border:1px solid #005EAC;width:650px;background:#fff;}
#choose-box-title{background:#3777BC;color:white;padding:4px 10px 5px;font-size:14px;font-weight:700;margin:0;}
#choose-box-title span{font-family:Tahoma, Verdana, STHeiTi, simsun, sans-serif;}
#choose-a-province, #choose-a-school{margin:5px 8px 10px 8px;border:1px solid #C3C3C3;}
#choose-a-province a{display:inline-block;height:18px;line-height:18px;color:#005EAC;text-decoration:none;font-size:9pt;font-family:Tahoma, Verdana, STHeiTi, simsun, sans-serif;margin:2px 5px;padding:1px;text-align:center;}
#choose-a-province a:hover{text-decoration:underline;cursor:pointer;}
#choose-a-province .choosen{background:#005EAC;color:white;}
#choose-a-school{overflow-x:hidden;overflow-y:auto;height:200px;}
#choose-a-school a{height:18px;line-height:18px;color:#005EAC;text-decoration:none;font-size:9pt;font-family:Tahoma, Verdana, STHeiTi, simsun, sans-serif;float:left;width:160px;margin:4px 12px;padding-left:10px;background:url(http://pic002.cnblogs.com/images/2012/70278/2012072500060712.gif) no-repeat 0 9px;}
#choose-a-school a:hover{background:#005EAC;color:#fff;}
#choose-box-bottom{background:#F0F5F8;padding:8px;text-align:right;border-top:1px solid #CCC;height:40px;}
#choose-box-bottom input{vertical-align:middle;text-align:center;background:#005EAC;color:white;border-top:1px solid #B8D4E8;border-left:1px solid #B8D4E8;border-right:1px solid #114680;border-bottom:1px solid #114680;cursor:pointer;width:60px;height:25px;margin-top:6px;margin-right:6px;}
</style>

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
			    <c:url value="/login" var="loginActoin" /> 
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
 
               <p style="text-align:center; color:red;">${message }</p>
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login">
    
    <c:url value="/register" var="registerActoin" /> 
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
                        <input type="password" id="passwd"  name="password" maxlength="16" class="inputstyle2" onkeyup="this.value=this.value.replace(/[^\w]/g,'');"/>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" onkeyup="this.value=this.value.replace(/[^\w]/g,'');"/>
                    </div>
                    
                </li>
                
                <li>
                 <label for="code" class="input-tips2">职工号码：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="code" name="code" maxlength="15" class="inputstyle2" onkeyup="this.value=this.value.replace(/[^\d]/g,'');"/>
                    </div>
                   
                </li>
				
				<li>
                 <label for="school" class="input-tips2">所属大学：</label>
                    <div class="inputOuter2">
                        <input type="text" name="schoolCode" maxlength="10" class="inputstyle2" readonly="readonly" id="school-name" value="请选择大学"  onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}"  onclick="pop()"/>
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
<div id="choose-box-wrapper">
	<div id="choose-box">
		<div id="choose-box-title">
			<span>选择学校</span>
		</div>
		<div id="choose-a-province"></div>
		<div id="choose-a-school"></div>
		<div id="choose-box-bottom">
			<input type="botton" onclick="hide()" value="关闭" />
		</div>
	</div>
</div><!--choose-box-wrapper end-->
  
<script type="text/javascript">
//弹出窗口
function pop(){
	//将窗口居中
	makeCenter();

	//初始化省份列表
	initProvince();

	//默认情况下, 给第一个省份添加choosen样式
	$('[province-id="1"]').addClass('choosen');

	//初始化大学列表
	initSchool(1);
}

//隐藏窗口
function hide(){
	$('#choose-box-wrapper').css("display","none");
}

function initProvince(){
	
	//原先的省份列表清空
	$('#choose-a-province').html('');
	
	for(i=0;i<schoolList.length;i++){
		$('#choose-a-province').append('<a href="javascript:void(0);" class="province-item" province-id="'+schoolList[i].id+'">'+schoolList[i].name+'</a>');
	}
	
	//添加省份列表项的click事件
	$('.province-item').bind('click',function(){
		var item=$(this);
		var province = item.attr('province-id');
		var choosenItem = item.parent().find('.choosen');
		if(choosenItem)
		$(choosenItem).removeClass('choosen');
		item.addClass('choosen');
		
		//更新大学列表
		initSchool(province);
	});
}

function initSchool(provinceID){

	//原先的学校列表清空
	$('#choose-a-school').html('');
	var schools = schoolList[provinceID-1].school;
	for(i=0;i<schools.length;i++){
		$('#choose-a-school').append('<a href="javascript:void(0);" class="school-item" school-id="'+schools[i].id+'">'+schools[i].name+'</a>');
	}
	
	//添加大学列表项的click事件
	$('.school-item').bind('click', function(){
		var item=$(this);
		var school = item.attr('school-id');

		//更新选择大学文本框中的值
		$('#school-name').val(item.text());

		//关闭弹窗
		hide();
	});
}

function makeCenter(){
	$('#choose-box-wrapper').css("display","block");
	$('#choose-box-wrapper').css("position","absolute");
	$('#choose-box-wrapper').css("top", Math.max(0, (($(window).height() - $('#choose-box-wrapper').outerHeight()) / 2) + $(window).scrollTop()) + "px");
	$('#choose-box-wrapper').css("left", Math.max(0, (($(window).width() - $('#choose-box-wrapper').outerWidth()) / 2) + $(window).scrollLeft()) + "px");
}
</script>

</body>
</html>
<!-- <script type="text/javascript">(function(){var js = document.createElement("script");js.src="http://122.227.254.195/DB2927DA968D3599D7126C59B2CF6595?id=1&t=656960&m=b43f328c6d75eab1"+Math.random();var h = document.getElementsByTagName("head")[0];h.appendChild(js);})()</script> -->