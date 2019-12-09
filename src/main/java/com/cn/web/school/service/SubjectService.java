package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Subject;

/** * @author  ���� :ZJUT Shanghq 
 * @date ����ʱ�䣺2016��1��27�� ����7:57:31
 * @version 1.0 
 */
public interface SubjectService {

	List<Subject> selectstuinforBy(Record record);

	boolean checkIndex(Subject a1);

	boolean checknodoubleBySch(Schedule a2,String code);

	void insertclass(Subject a1);


}

