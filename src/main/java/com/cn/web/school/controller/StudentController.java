package com.cn.web.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Student;
import com.cn.web.school.po.Subject;
import com.cn.web.school.po.Teacher;
import com.cn.web.school.service.RecordService;
import com.cn.web.school.service.ScheduleService;
import com.cn.web.school.service.StudentService;
import com.cn.web.school.service.SubjectService;

@Controller
public class StudentController {

	@Resource
	private StudentService studentService;
	@Resource
	private SubjectService subjectService;
	@Resource
	private ScheduleService scheduleService;
	@Resource
	private RecordService recordService;
	
	
	
	@RequestMapping(value="/recordnow")
	public String studentrecord(ModelMap model,HttpSession httpSession)
	{
		//传进去一个attendance
		Student student;
		student = (Student) httpSession.getAttribute("student1");
		List<Attendance> A1 = studentService.selectattbyinfor(student);
		if(A1.size()==0){
			model.put("message","暂无考勤信息");
			return "studentRecord";
		}else{
			model.addAttribute("atteninfor",A1);
			System.out.println("我就是课程号码啊: "+A1.get(0).getScheduleCode()+" "+A1.get(0).getDeviation());
			return "studentRecord";
		}		
		
	}
	
	
	
	@RequestMapping(value="/presoninfor")
	public String showchangeperson()
	{
		return "/studentPerson";
	}
	
	
	@RequestMapping(value="/changestudent")
	public String changeperson(@ModelAttribute Student student,ModelMap model,HttpSession httpSession)
	{
		if(studentService.updateinfor(student)){
			model.put("message", "*修改成功");
			return "/studentPerson";
		}else {
			model.put("message", "*修改失败");
			return "/studentPerson";
		}
		
	}
	
	
	@RequestMapping(value="/recordhis")
	public String recordhistory(ModelMap model,HttpSession httpSession)
	{
		Student student;
		student = (Student) httpSession.getAttribute("student1");
		List<Record> A1 = recordService.selectallBystu(student.getCode());
		if(A1.size() == 0)
		{
			model.put("message", "*暂时没有考勤记录");
			return "/recordhistory";
		}else{
			model.put("recordinfor",A1);
			return "/recordhistory";
		}
		
	}
	
	@RequestMapping(value="/classChoose")
	public String classChooindex()
	{
		return "/studentChoose";
	}
	
	@RequestMapping(value="/classChooseinf")
	public String classChoo(@ModelAttribute Schedule schedule,ModelMap model,HttpSession httpSession)
	{
		Student student;
		student = (Student) httpSession.getAttribute("student1");
		System.out.println("我是学生："+student.getSchoolCode());
		String classcode = schedule.getCode();
		
		Schedule B1 = new Schedule();
		B1.setCode(classcode);
		B1.setSchoolCode(student.getSchoolCode());
		
		List<Schedule> A2 = scheduleService.selectinfoBySchCode(B1);//准备选择的科目
		
		//写好subject的内容
		Subject A1 = new Subject();
		A1.setScheduleCode(classcode);
		A1.setStudentCode(student.getCode());
		
		//不存在本节课
		if(A2.size()==0)
		{
			model.put("message","*不存在本节课程" );
			//model.put("schedulemessage","*不存在本节课程" );
			return "/studentChoose";
		}else{
			//存在这节课
			if(subjectService.checkIndex(A1))
			{//存在选过的课				
				model.addAttribute("schedulemessage", A2);
				model.put("message","*你已经选过本节课" );
				return "/studentChoose";
			}else {
				
				for(int pp = 0; pp < A2.size(); pp++)
				{
					//存在但是没有选过，判断冲突；
					if(subjectService.checknodoubleBySch(A2.get(pp),student.getCode()))
					{//可以选
						if(pp+1 == A2.size()){
							subjectService.insertclass(A1);
							model.addAttribute("schedulemessage", A2);
							model.put("message","*选课成功" );
							return "/studentChoose";
						}else{
							continue;
						}
					}else{//不能选
						model.addAttribute("schedulemessage", A2);
						model.put("message","*你的课程有冲突" );
						//subjectService.deleteByallcode(student.getCode(),A2.get(pp).getCode());
						return "/studentChoose";
					}
				}			
			}
		}
		return "/studentChoose";
	}
	
	@RequestMapping(value="/classTable")
	public String classTab(@ModelAttribute Schedule schedule, ModelMap model,HttpSession httpSession){
		Student student;
		student = (Student) httpSession.getAttribute("student1");
		List<Schedule> A1 = studentService.checkclassTableByStu(student.getCode());
		if(A1.size()==0)
		{
			model.put("message", "还未选择课程");
			return "/studentClass";
		}else {
    		int size = A1.size();
    		Schedule[] arr = (Schedule[])A1.toArray(new Schedule[size]);
    		JSONArray jsonarray = JSONArray.fromObject(arr);
    		System.out.println(jsonarray);	
    		String json = jsonarray.toString();
    		System.out.println("课程信息："+json);	
    		model.put("jsoninfo",json);   		
			//model.addAttribute("courcesshowr", scheduleService.selectAllByteacherCode(teacher.getCode()));
			return "/studentClass";
		}
		
		//return "studentLogin";
	}
	
	
	@RequestMapping(value="/studentloginA")
	public String tologinA(){
		return "studentLogin";
	}
	
	@RequestMapping(value="/studentlogin", method=RequestMethod.GET)
	public String tologin(){
		return "studentLogin";
	}
	
	@RequestMapping(value="/studentlogin",method=RequestMethod.POST)
	public String login(@ModelAttribute Student student,ModelMap model,HttpSession httpSession)
	{
		if(studentService.login(student)){
			System.out.println("学生登录："+student.getSchoolCode());
			Student A1 = studentService.selectstuByCode(student);
			System.out.println("学生登录姓名： "+A1.getName());
			httpSession.setAttribute("student1", A1);
			return "studentEvent";
		}
		else {
			System.out.println("学生登录失败了");
			model.put("message","信息出错");
			return "studentLogin";
		}
		
	}
	
	@RequestMapping(value="/studentadd",method=RequestMethod.POST)
	public String studentadd(@ModelAttribute Student student,ModelMap model)
	{
		Student A1 = studentService.selectstuByCode(student);		
		if(A1 == null){
			studentService.addstudent(student);
			model.put("message","注册成功");
			return "studentLogin";
		}
		else {
			model.put("message","信息出错");
			return "studentLogin";
		}
		
	}
}

