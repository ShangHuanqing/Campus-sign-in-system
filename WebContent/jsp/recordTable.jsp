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
<body style="background-color:#CCC;">
    <div style="overflow-y: auto; height: 80%; width:100%;">
	<table id ="table1" style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:100%;margin-top:0;"border="1">
		<tbody>
		<tr>	
                    <th>学生学号</th>						
					<th>签到经度</th>
					<th>签到纬度</th>
					<th>签到时间</th>
					<th>考勤编号</th>
					<th>签到状态</th>
					<th>修         改</th>
					<th><div id="export"><a data-type="xls" href="javascript:;">导出</a></div></th>
					<!-- <input type="button" onclick="addRow()" value="添加" /> -->
		</tr>
		<c:forEach var="recordinfor" items="${recordinfor}">
			<tr>
				<td name=${recordinfor.id}>${recordinfor.studentCode}</td>
				<td name=${recordinfor.id}>${recordinfor.longitude}</td>
				<td name=${recordinfor.id}>${recordinfor.latitude}</td>
				<td name=${recordinfor.id}><spring:eval expression="recordinfor.time" /></td>
				<td name=${recordinfor.id} id="attendcode">${recordinfor.attendcode}</td>
				<td name=${recordinfor.id}>${recordinfor.valid}</td>
				<td><input type="button" id=${recordinfor.id} onclick="return trya(this.id)" value="修    改">
				<input type="button" id=${recordinfor.id} onclick="return trya1(this.id)" value="删     除">
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table id ="table1" style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:100%;margin-top:0;"border="1">
	<tbody>
	    <tr>	
                    <th>学生学号</th>						
					<th>签到状态</th>
					<!-- <input type="button" onclick="addRow()" value="添加" /> -->
		</tr>
		<c:forEach var="subjectinfo" items="${subjectinfo}">
			<tr>
				<td name=${subjectinfo.id}>${subjectinfo.studentCode}</td>
				<td name=${subjectinfo.id}>未签到</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<p style="color:red;">${recordinfor1}</p>
	</div>
	
	<script type="text/javascript">
	
	function trya(id)
	{
	   var a=document.getElementsByName(id);
   	   //alert("我又进来了啊"+a.length);
   	   for(var i=0;i<a.length;i++){
   	   //alert(a[i].innerHTML);
   	   }
   	    var form1 = document.createElement("form");  
	    form1.id = "form1";  
	    form1.name = "form1"; 
	    form1.target="tableFrame";
	  
	    // 添加到 body 中  
	    //document.body.appendChild(form1);  
	  
	    // 创建一个输入  
	    var input = document.createElement("input");  
	    // 设置相应参数  
	    input.type = "hidden";  
	    input.name = "valid";  
	    input.value = a[5].innerHTML;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input);  
	    
	    var input1 = document.createElement("input");  
	    // 设置相应参数  
	    input1.type = "hidden";  
	    input1.name = "attendcode";  
	    input1.value = a[4].innerHTML;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input1);  
	   
	    var input2 = document.createElement("input");  
	    // 设置相应参数  
	    input2.type = "hidden";  
	    input2.name = "studentCode";  
	    input2.value = a[0].innerHTML;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input2); 
	    
	    // form 的提交方式  
	    form1.method = "POST";  
	    // form 提交路径  
	    form1.action = "recordUpdate";  
	  
	    // 对该 form 执行提交  
	    form1.submit();  
	    // 删除该 form  
	    //document.body.removeChild(form1); 
	};
	
	
	function trya1(id)
	{
	   var a=document.getElementsByName(id);
   	   //alert("我又进来了啊"+a.length);
   	   for(var i=0;i<a.length;i++){
   	   //alert(a[i].innerHTML);
   	   }
   	    var form1 = document.createElement("form");  
	    form1.id = "form1";  
	    form1.name = "form1"; 
	    form1.target="tableFrame";
	  
	    // 添加到 body 中  
	    //document.body.appendChild(form1);  
	  
	    // 创建一个输入  
	    var input = document.createElement("input");  
	    // 设置相应参数  
	    input.type = "hidden";  
	    input.name = "valid";  
	    input.value = a[5].innerHTML;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input);  
	    
	    var input1 = document.createElement("input");  
	    // 设置相应参数  
	    input1.type = "hidden";  
	    input1.name = "attendcode";  
	    input1.value = a[4].innerHTML;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input1);  
	   
	    var input2 = document.createElement("input");  
	    // 设置相应参数  
	    input2.type = "hidden";  
	    input2.name = "studentCode";  
	    input2.value = a[0].innerHTML;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input2); 
	    
	    // form 的提交方式  
	    form1.method = "POST";  
	    // form 提交路径  
	    form1.action = "recorddelete";  
	  
	    // 对该 form 执行提交  
	    form1.submit();  
	    // 删除该 form  
	    //document.body.removeChild(form1); 
	};
	

	var $exportLink = document.getElementById('export');

	$exportLink.addEventListener('click', function(e){

		e.preventDefault();

		if(e.target.nodeName === "A"){

			tableExport('table1', '考勤表', e.target.getAttribute('data-type'));

		}		

	}, false);
	
	
    function $(obj){
        return document.getElementById(obj);
    }
    
    var num = 0;
    function row(id){
        //构造函数
        this.id = $(id);
    }
    row.prototype = {
        //插入行
        insert:function(){
        	var code = document.getElementById("attendcode").innerHTML;
        	alert(code);
        	if(code == null || code =="")
        	{
                num = num + 1;
                var newTr = this.id.insertRow(-1);
                var td_1 = newTr.insertCell(0);
                var td_2 = newTr.insertCell(1);
                var td_3 = newTr.insertCell(2);
                var td_4 = newTr.insertCell(3);
                var td_5 = newTr.insertCell(4);
                var td_6 = newTr.insertCell(5);
                var td_7 = newTr.insertCell(6);
                td_1.innerHTML = "输入学号";
                td_2.innerHTML = "经度";
                td_3.innerHTML = "纬度";
                td_4.innerHTML = "签到时间";
                td_5.innerHTML = "考勤编号";
                td_6.innerHTML = "签到状态";
                td_7.innerHTML = "课程编码";
        	}else{
	            num = num + 1;
	            var newTr = this.id.insertRow(-1);
	            var td_1 = newTr.insertCell(0);
	            var td_2 = newTr.insertCell(1);
	            var td_3 = newTr.insertCell(2);
	            var td_4 = newTr.insertCell(3);
	            var td_5 = newTr.insertCell(4);
	            var td_6 = newTr.insertCell(5);
	            var td_7 = newTr.insertCell(6);
	            td_1.innerHTML = " ";
	            td_2.innerHTML = " ";
	            td_3.innerHTML = " ";
	            td_4.innerHTML = " ";
	            td_5.innerHTML = document.getElementById("attendcode").innerHTML;
	            td_6.innerHTML = " ";
	            td_7.innerHTML = " ";
        	}
        },
        //删除行
        del:function(obj){
            var i = obj.parentNode.parentNode.rowIndex;
            this.id.deleteRow(i);
        }
    }
      
    function addRow(){
        var row2 = new row("table1");
        row2.insert();
    }
    
	var inputItem; // 输入框句柄
    var activeItem; // 保存正在编辑的单元格
    
    //转成文本
    function changeToText(obj){
        if( obj && inputItem ) {
            // 如果存在正在编辑的单元格， 则取消编辑状态， 并将编辑的数据保存起来
            var str = " ";
            if(inputItem.value != "") 
                str = inputItem.value;
            obj.innerText = str;   
        }
    }
    
    //转成编辑
    function changeToEdit(obj){
         if( !inputItem ) {
              inputItem = document.createElement('input');
              inputItem.type = 'text';
              inputItem.style.width = '100%';
         }
        // inputItem.style.display = '';
         inputItem.value = obj.innerText; // 将该单元格的数据文本读到控件上
         obj.innerHTML = ''; // 清空单元格的数据
         obj.appendChild(inputItem);
         inputItem.focus();
         activeItem = obj;
    }
    
    
    //双击时文本变成文本框
    document.ondblclick = function(){
        if(event.srcElement.tagName.toLowerCase() == "td"){
            if(!inputItem){
                inputItem = document.createElement("input");
                inputItem.type = "text";
                inputItem.style.width = "100%";
            }
            changeToText();
            changeToEdit(event.srcElement);
        }else{
            event.returnValue = false;
            return false;
        }
    }
    
    //单击时文本框变成文本
    document.onclick = function(){
        if(event.srcElement.parentNode == activeItem || event.srcElement == activeItem)
            return;
        else
            changeToText(activeItem);
    }
    </script>
</body>
</html>