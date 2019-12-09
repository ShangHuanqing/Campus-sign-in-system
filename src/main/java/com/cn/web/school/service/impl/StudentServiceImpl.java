package com.cn.web.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.web.school.dao.StudentMapper;
import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Student;
import com.cn.web.school.po.StudentExample;
import com.cn.web.school.po.Teacher;
import com.cn.web.school.po.TeacherExample;
import com.cn.web.school.po.StudentExample.Criteria;
import com.cn.web.school.service.StudentService;

/** * @author  作者 :ZJUT Shanghq 
 * @date 创建时间：2016年1月28日 下午2:35:21
 * @version 1.0 
 */
@Service("StudentService")
@Transactional
public class StudentServiceImpl implements StudentService{

	@Resource
	private StudentMapper studentMapper;

	@Override
	public boolean login(Student student) {
		// TODO Auto-generated method stub
				
		try {
			StudentExample example = new StudentExample();
			Criteria criteria = example.createCriteria();
			criteria.andCodeEqualTo(student.getCode());
			criteria.andPasswordEqualTo(student.getPassword());
			criteria.andSchoolCodeEqualTo(student.getSchoolCode());
			List<Student> loginstudent = studentMapper.selectByExample(example);
			if(loginstudent != null && !"".equals(loginstudent) && loginstudent.size() > 0)
			{
				return true;
			}else {			
				System.out.println("登录信息--登录失败--StudentLoginServiceImpl。login: 输入信息类出错");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Student selectstuByCode(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.selectstuByCode(student);	
	}

	@Override
	public void addstudent(Student student) {
		
		studentMapper.insert(student);
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Schedule> checkclassTableByStu(String code) {
		// TODO Auto-generated method stub
		return studentMapper.selectclassBycode(code);
	}

	@Override
	public boolean updateinfor(Student student) {
		// TODO Auto-generated method stub
		studentMapper.updatepasswd(student);
		return true;
	}

	@Override
	public List<Attendance> selectattbyinfor(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.selectattbyinfor(student);
	}
}

