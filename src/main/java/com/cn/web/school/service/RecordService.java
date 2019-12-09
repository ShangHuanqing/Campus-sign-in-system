package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Record;

/** * @author  ���� :ZJUT Shanghq 
 * @date ����ʱ�䣺2016��1��26�� ����12:03:27
 * @version 1.0 
 */
public interface RecordService {

	List<Record> selectRecordByAttendancecode(String code);

	void updaterecordinfor(Record record);

	void recorddelete(Record record);

	List<Record> selectallBystu(String code);

}

