package com.cn.web.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.web.school.dao.TeacherMapper;
import com.cn.web.school.po.Teacher;
import com.cn.web.school.po.TeacherExample;
import com.cn.web.school.po.TeacherExample.Criteria;
import com.cn.web.school.service.TeacherLoginService;

@Service("TeacherLoginService")
@Transactional
public class TeacherLoginServiceImpl implements TeacherLoginService{	
	@Resource
	private TeacherMapper teacherMapper;

	@Override
	public Teacher infor(String code){
		Teacher loginteacher = teacherMapper.selectByCode(code);
		return loginteacher;
	}
	
	
	@Override
	public boolean updateinfor(Teacher teacher) {
		System.out.println("更新信息--数据获取--TeacherLoginServiceImpl。updateinfor: 学校名称: "+teacher.getSchoolCode());
		// TODO Auto-generated method stub
		try {
			String code = teacher.getCode();
			String password1 = teacher.getPassword();
			String pass1 = teacherMapper.selectPasswordByCode(code);
			System.out.println("更新信息--数据获取--TeacherLoginServiceImpl。updateinfor: "+"职工号："+code+";旧版密码: "+pass1+";修改版本密码: "+password1);
			if(!password1.equals(pass1) && password1.length()>=6)
			{
				   teacherMapper.updateByCode(teacher);
				   String pass2 = teacherMapper.selectPasswordByCode(code);
				   System.out.println("更新信息--更新成功--TeacherLoginServiceImpl。updateinfor: 新密码(修改版本): "+pass2);
				   return true;

			}else{				
				   System.out.println("更新信息--更新失败--TeacherLoginServiceImpl。updateinfor: 信息错误");
				   return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新信息--SQL出错--TeacherLoginServiceImpl。updateinfor: SQL语句错误");
			e.printStackTrace();
			return false;
		}
		
	}

	
	@Override
	public boolean register(Teacher teacher){
		System.out.println("注册信息--数据获取--TeacherLoginServiceImpl。register:  学校: "+teacher.getSchoolCode());
		try {		
			String code = teacher.getCode().toString();
			Teacher loginteacher = teacherMapper.selectByCode(code);
			if(loginteacher == null)
			{
				teacherMapper.insert(teacher);
				System.out.println("注册信息--注册成功--TeacherLoginServiceImpl。register:  注册成功");
				return true;
			}else {
				System.out.println("注册信息--注册失败--TeacherLoginServiceImpl。register:  注册失败");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("注册信息--SQL出错--TeacherLoginServiceImpl。register:  注册失败");
			e.printStackTrace();
			return false;
		}	
	}
	
	
	@Override
	public boolean login(Teacher teacher) {
		// TODO Auto-generated method stub
		try {
			System.out.println("登录信息--数据获取--TeacherLoginServiceImpl。login:  职工号: "+teacher.getCode());
			TeacherExample example = new TeacherExample();
			Criteria criteria = example.createCriteria();
			criteria.andCodeEqualTo(teacher.getCode());
			criteria.andPasswordEqualTo(teacher.getPassword());
			List<Teacher> loginteacher = teacherMapper.selectByExample(example);
			if(loginteacher != null && !"".equals(loginteacher) && loginteacher.size() > 0)
			{
				return true;
			}else {			
				System.out.println("登录信息--登录失败--TeacherLoginServiceImpl。login: 输入信息类出错");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("登录信息--SQL出错--TeacherLoginServiceImpl。login: 登录失败");
			e.printStackTrace();
			return false;
		}	
	}


	@Override
	public String selectnameBycode(String codeteacher) {
		// TODO Auto-generated method stub
		return teacherMapper.selectNameBycode(codeteacher);
	}
}
