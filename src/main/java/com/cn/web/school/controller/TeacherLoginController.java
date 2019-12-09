package com.cn.web.school.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cn.web.school.po.Teacher;
import com.cn.web.school.service.TeacherLoginService;


@Controller
public class TeacherLoginController {

	@Resource
	private TeacherLoginService teacherLoginService;
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String tologin(){
		//String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());	
		return "login";
	}
	
	/** 教师信息更新（密码更新，传入表值）	   
	*/
	@RequestMapping(value="/updateinfor",method = RequestMethod.POST)
	public String updateinfor(@ModelAttribute Teacher teacher, ModelMap model,HttpSession httpSession)
	{
		System.out.println("更新信息--数据获取--TeacherLogincontroller。updateinfor: 密码:"+teacher.getPassword()+";姓名: "+teacher.getName()+";职工号: "+teacher.getCode());
		if(teacherLoginService.updateinfor(teacher)){
			Teacher infor1 = teacherLoginService.infor(teacher.getCode());
			model.addAttribute("infor", "修改成功！");
			httpSession.setAttribute("teacher1", infor1);
			return "index";
		}else{
			model.addAttribute("infor", "您未修改密码或修改格式不正确");
			return "center";
		}
	}
	
	//** 课程发布跳转action
	
	@RequestMapping(value="/coursePut")
	public String coursePut(){
		return "coursePut";
	}
	
	
	//** 教师管理平台个人信息action

	@RequestMapping(value="/index")
	public String index(){
		return "index";
	}
	
	//** 教师管理平台个人信息action

	@RequestMapping(value="/information")
	public String information(){
		return "center";
	}
	
	//** 登录action判断
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(@ModelAttribute Teacher teacher, ModelMap model,HttpSession httpSession)
	{
		System.out.println("       -------Login Strat-------");
		if(teacherLoginService.login(teacher))
		{
			Session session;
			Teacher infor1 = teacherLoginService.infor(teacher.getCode());
			System.out.println("登录信息--登陆成功--教师姓名查询--TeacherLogincontroller。login: "+infor1.toString());
			model.addAttribute("teacher", infor1);
			httpSession.setAttribute("teacher1", infor1);
			model.put("teacher_id", infor1.getId());
			model.put("teacher_code", infor1.getCode());
			model.put("teacher_name", infor1.getName());
			model.put("teacher_schoolCode", infor1.getSchoolCode());
			model.put("teacher_password", infor1.getPassword());
			return "success";
		}
		else
		{
			model.put("message", "* 职工号码/密码有误，重试登录！");
            return "login";
		}	
	}
	
	//** 注册action判定
	
	@RequestMapping(value="register",method = RequestMethod.POST)
	public String register(@ModelAttribute Teacher teacher, ModelMap model)
	{
		System.out.println("注册信息--获取数据--TeacherLogincontroller。register: "+"注册姓名: "+teacher.getName()+" ;注册学校: "+teacher.getSchoolCode());
		if(teacherLoginService.register(teacher))
		{
			model.put("message", "* 注册成功！");
			return "login";
		}
		else {
			model.put("message", "* 注册失败！请输入正确注册信息");
			return "login";
		}
	}
}
