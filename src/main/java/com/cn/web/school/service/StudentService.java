package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Student;

/** * @author  ���� :ZJUT Shanghq 
 * @date ����ʱ�䣺2016��1��28�� ����2:33:59
 * @version 1.0 
 */
public interface StudentService {

	boolean login(Student student);

	Student selectstuByCode(Student student);

	void addstudent(Student student);

	List<Schedule> checkclassTableByStu(String code);

	boolean updateinfor(Student student);

	List<Attendance> selectattbyinfor(Student student);

}

