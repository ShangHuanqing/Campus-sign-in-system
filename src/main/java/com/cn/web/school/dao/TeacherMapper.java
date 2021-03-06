package com.cn.web.school.dao;

import com.cn.web.school.po.Teacher;
import com.cn.web.school.po.TeacherExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int countByExample(TeacherExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int deleteByExample(TeacherExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int insert(Teacher record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int insertSelective(Teacher record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    List<Teacher> selectByExample(TeacherExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    Teacher selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    Teacher selectByCode(String code);
    
    void updateByCode(Teacher teacher);
    
    String selectPasswordByCode(String code);
    
    int updateByExampleSelective(@Param("record") Teacher record, @Param("example") TeacherExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int updateByExample(@Param("record") Teacher record, @Param("example") TeacherExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int updateByPrimaryKeySelective(Teacher record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Sat Jan 16 21:51:42 CST 2016
     */
    int updateByPrimaryKey(Teacher record);

	String selectNameBycode(String codeteacher);

	


}