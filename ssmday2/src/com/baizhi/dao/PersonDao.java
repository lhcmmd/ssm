package com.baizhi.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baizhi.entity.*;
public interface PersonDao {
	//原始不分页查所有
	public List<Person> queryAll();
	
	public void insertOne(Person person);
	
	public void deleteOne(Integer userid);
	//根据ID查一个
	public Person queryOneById(Integer userid);
	
	//根据ID查一个,分页情况下的显示
	public List<Person> queryPersonById(@Param("userid")Integer userid,@Param("start")int start,@Param("end") int end);
	//根据ID查一个,分页情况下的显示
	public int getCountById(@Param("userid")Integer userid);
	
	
	//更新一个
	public void updatePerson(Person person);
	
	//得所有条数
	public int getCount();
	
	//分页查所有
	public List<Person> getPersonByPage(@Param("start")int start,@Param("end") int end);
	
	//分页 模糊查名字
	public List<Person> getPersonByNamePage(@Param("name")String name,@Param("start")int start,@Param("end") int end);
	
	//模糊查名字的数量
	public int getCountByName(@Param("name")String name);

	//按照id批量删除
	public void deletePersons(int[] id);
	
	//模糊查手机号分页情况下的显示
	public List<Person> queryPersonByMobile(@Param("mobile")String mobile,@Param("start")int start,@Param("end") int end);
	//模糊查手机号 数量分页情况下的显示
	public int getCountByMobile(@Param("mobile")String mobile);
	
}
