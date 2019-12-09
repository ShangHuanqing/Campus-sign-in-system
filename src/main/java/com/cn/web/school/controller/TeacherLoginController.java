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
	
	/** ��ʦ��Ϣ���£�������£������ֵ��	   
	*/
	@RequestMapping(value="/updateinfor",method = RequestMethod.POST)
	public String updateinfor(@ModelAttribute Teacher teacher, ModelMap model,HttpSession httpSession)
	{
		System.out.println("������Ϣ--���ݻ�ȡ--TeacherLogincontroller��updateinfor: ����:"+teacher.getPassword()+";����: "+teacher.getName()+";ְ����: "+teacher.getCode());
		if(teacherLoginService.updateinfor(teacher)){
			Teacher infor1 = teacherLoginService.infor(teacher.getCode());
			model.addAttribute("infor", "�޸ĳɹ���");
			httpSession.setAttribute("teacher1", infor1);
			return "index";
		}else{
			model.addAttribute("infor", "��δ�޸�������޸ĸ�ʽ����ȷ");
			return "center";
		}
	}
	
	//** �γ̷�����תaction
	
	@RequestMapping(value="/coursePut")
	public String coursePut(){
		return "coursePut";
	}
	
	
	//** ��ʦ����ƽ̨������Ϣaction

	@RequestMapping(value="/index")
	public String index(){
		return "index";
	}
	
	//** ��ʦ����ƽ̨������Ϣaction

	@RequestMapping(value="/information")
	public String information(){
		return "center";
	}
	
	//** ��¼action�ж�
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(@ModelAttribute Teacher teacher, ModelMap model,HttpSession httpSession)
	{
		System.out.println("       -------Login Strat-------");
		if(teacherLoginService.login(teacher))
		{
			Session session;
			Teacher infor1 = teacherLoginService.infor(teacher.getCode());
			System.out.println("��¼��Ϣ--��½�ɹ�--��ʦ������ѯ--TeacherLogincontroller��login: "+infor1.toString());
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
			model.put("message", "* ְ������/�����������Ե�¼��");
            return "login";
		}	
	}
	
	//** ע��action�ж�
	
	@RequestMapping(value="register",method = RequestMethod.POST)
	public String register(@ModelAttribute Teacher teacher, ModelMap model)
	{
		System.out.println("ע����Ϣ--��ȡ����--TeacherLogincontroller��register: "+"ע������: "+teacher.getName()+" ;ע��ѧУ: "+teacher.getSchoolCode());
		if(teacherLoginService.register(teacher))
		{
			model.put("message", "* ע��ɹ���");
			return "login";
		}
		else {
			model.put("message", "* ע��ʧ�ܣ���������ȷע����Ϣ");
			return "login";
		}
	}
}
