package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Teacher;

public interface TeacherLoginService {

	boolean login(Teacher teacher);

	boolean register(Teacher teacher);

	Teacher infor(String code);

	boolean updateinfor(Teacher teacher);

	String selectnameBycode(String codeteacher);
}
