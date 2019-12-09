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
		System.out.println("������Ϣ--���ݻ�ȡ--TeacherLoginServiceImpl��updateinfor: ѧУ����: "+teacher.getSchoolCode());
		// TODO Auto-generated method stub
		try {
			String code = teacher.getCode();
			String password1 = teacher.getPassword();
			String pass1 = teacherMapper.selectPasswordByCode(code);
			System.out.println("������Ϣ--���ݻ�ȡ--TeacherLoginServiceImpl��updateinfor: "+"ְ���ţ�"+code+";�ɰ�����: "+pass1+";�޸İ汾����: "+password1);
			if(!password1.equals(pass1) && password1.length()>=6)
			{
				   teacherMapper.updateByCode(teacher);
				   String pass2 = teacherMapper.selectPasswordByCode(code);
				   System.out.println("������Ϣ--���³ɹ�--TeacherLoginServiceImpl��updateinfor: ������(�޸İ汾): "+pass2);
				   return true;

			}else{				
				   System.out.println("������Ϣ--����ʧ��--TeacherLoginServiceImpl��updateinfor: ��Ϣ����");
				   return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("������Ϣ--SQL����--TeacherLoginServiceImpl��updateinfor: SQL������");
			e.printStackTrace();
			return false;
		}
		
	}

	
	@Override
	public boolean register(Teacher teacher){
		System.out.println("ע����Ϣ--���ݻ�ȡ--TeacherLoginServiceImpl��register:  ѧУ: "+teacher.getSchoolCode());
		try {		
			String code = teacher.getCode().toString();
			Teacher loginteacher = teacherMapper.selectByCode(code);
			if(loginteacher == null)
			{
				teacherMapper.insert(teacher);
				System.out.println("ע����Ϣ--ע��ɹ�--TeacherLoginServiceImpl��register:  ע��ɹ�");
				return true;
			}else {
				System.out.println("ע����Ϣ--ע��ʧ��--TeacherLoginServiceImpl��register:  ע��ʧ��");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("ע����Ϣ--SQL����--TeacherLoginServiceImpl��register:  ע��ʧ��");
			e.printStackTrace();
			return false;
		}	
	}
	
	
	@Override
	public boolean login(Teacher teacher) {
		// TODO Auto-generated method stub
		try {
			System.out.println("��¼��Ϣ--���ݻ�ȡ--TeacherLoginServiceImpl��login:  ְ����: "+teacher.getCode());
			TeacherExample example = new TeacherExample();
			Criteria criteria = example.createCriteria();
			criteria.andCodeEqualTo(teacher.getCode());
			criteria.andPasswordEqualTo(teacher.getPassword());
			List<Teacher> loginteacher = teacherMapper.selectByExample(example);
			if(loginteacher != null && !"".equals(loginteacher) && loginteacher.size() > 0)
			{
				return true;
			}else {			
				System.out.println("��¼��Ϣ--��¼ʧ��--TeacherLoginServiceImpl��login: ������Ϣ�����");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("��¼��Ϣ--SQL����--TeacherLoginServiceImpl��login: ��¼ʧ��");
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
