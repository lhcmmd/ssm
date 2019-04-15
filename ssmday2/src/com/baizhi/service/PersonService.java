package com.baizhi.service;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baizhi.entity.*;
public interface PersonService {
	public List<Person> queryAll();
	
	public void insertOne(Person person);
	
	public void deleteOne(Integer userid);
	
	public Person queryOneById(Integer userid);
	
	public void updateEmp(Person person);
	
	//查所有
	public Map getUser(int page, int rows);
	
	//查所有总记录
	public int getCount();
	
	//分页模糊查姓名
	public Map getPersonByNamePage(@Param("name")String name,@Param("start")int start,@Param("end") int end);

	//分页模糊查姓名得到查询记录
	public int getCountByName(@Param("name")String name);
	
	//按照id批量删除
	public void deletePersons(int[] id);
	
	
	//根据ID查一个,分页情况下的显示
	public Map queryPersonById(@Param("userid")Integer userid,@Param("start")int start,@Param("end") int end);
	//根据ID查一个,分页情况下的显示
	public int getCountById(@Param("userid")Integer userid);
	
	//模糊查手机号分页情况下的显示
	public Map queryPersonByMobile(@Param("mobile")String mobile,@Param("start")int start,@Param("end") int end);
	//模糊查手机号 数量分页情况下的显示
	public int getCountByMobile(@Param("mobile")String mobile);
	
		
	
	
	
	
	
}
