package com.baizhi.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baizhi.entity.*;
public interface PersonDao {
	//ԭʼ����ҳ������
	public List<Person> queryAll();
	
	public void insertOne(Person person);
	
	public void deleteOne(Integer userid);
	//����ID��һ��
	public Person queryOneById(Integer userid);
	
	//����ID��һ��,��ҳ����µ���ʾ
	public List<Person> queryPersonById(@Param("userid")Integer userid,@Param("start")int start,@Param("end") int end);
	//����ID��һ��,��ҳ����µ���ʾ
	public int getCountById(@Param("userid")Integer userid);
	
	
	//����һ��
	public void updatePerson(Person person);
	
	//����������
	public int getCount();
	
	//��ҳ������
	public List<Person> getPersonByPage(@Param("start")int start,@Param("end") int end);
	
	//��ҳ ģ��������
	public List<Person> getPersonByNamePage(@Param("name")String name,@Param("start")int start,@Param("end") int end);
	
	//ģ�������ֵ�����
	public int getCountByName(@Param("name")String name);

	//����id����ɾ��
	public void deletePersons(int[] id);
	
	//ģ�����ֻ��ŷ�ҳ����µ���ʾ
	public List<Person> queryPersonByMobile(@Param("mobile")String mobile,@Param("start")int start,@Param("end") int end);
	//ģ�����ֻ��� ������ҳ����µ���ʾ
	public int getCountByMobile(@Param("mobile")String mobile);
	
}
