package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Student;

/** * @author  作者 :ZJUT Shanghq 
 * @date 创建时间：2016年1月28日 下午2:33:59
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

