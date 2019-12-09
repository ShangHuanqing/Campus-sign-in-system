package com.cn.web.school.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.web.school.dao.ScheduleMapper;
import com.cn.web.school.dao.SubjectMapper;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Student;
import com.cn.web.school.po.StudentExample;
import com.cn.web.school.po.Subject;
import com.cn.web.school.po.SubjectExample.Criteria;
import com.cn.web.school.po.SubjectExample;
import com.cn.web.school.service.SubjectService;

/** * @author  作者 :ZJUT Shanghq 
 * @date 创建时间：2016年1月27日 上午7:58:10
 * @version 1.0 
 */
@Service("SubjectService")
@Transactional
public class SubjectServiceImpl implements SubjectService {

	@Resource
	private SubjectMapper subjectMapper;
	@Resource
	private ScheduleMapper scheduleMapper;

	@Override
	public List<Subject> selectstuinforBy(Record record) {
		// TODO Auto-generated method stub
		System.out.println("SubjectServiceImplBUG   "+record.getAttendcode()+" "+record.getSchedulCode());
		return subjectMapper.selectstuinfoByCode(record);
	}

	@Override
	public boolean checkIndex(Subject a1) {
		// TODO Auto-generated method stub
		
		SubjectExample example = new SubjectExample();
		Criteria criteria = example.createCriteria();
		criteria.andScheduleCodeEqualTo(a1.getScheduleCode());
		criteria.andStudentCodeEqualTo(a1.getStudentCode());
		List<Subject> loginstudent = subjectMapper.selectByExample(example);
		if(loginstudent != null && !"".equals(loginstudent) && loginstudent.size() > 0)
		{
			return true;
		}else {			
			System.out.println("查询重复课程信息--登录失败--SubjectServiceImpl。login: 没有重复课程");
			return false;
		}
	}

	@Override
	public boolean checknodoubleBySch(Schedule a2, String code) {
		// TODO Auto-generated method stub
		List<String> A1 = scheduleMapper.selectclasscodeByall(a2);//本校所有有冲突的课程
	    List<String> A2 = subjectMapper.selectcodeBycode(code);  //已经选了的课程
	    List<String> result = new ArrayList<String>();
	    
		for (String integer : A2) {//遍历list1
			if (A1.contains(integer)) {//如果存在这个数
				result.add(integer);//放进一个list里面，这个list就是交集
			}
		}
		
		if(result.size() == 0){ 
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public void insertclass(Subject a1) {
		// TODO Auto-generated method stub
		subjectMapper.insert(a1);
	}


}

