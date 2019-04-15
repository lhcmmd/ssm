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
	
	//������
	public Map getUser(int page, int rows);
	
	//�������ܼ�¼
	public int getCount();
	
	//��ҳģ��������
	public Map getPersonByNamePage(@Param("name")String name,@Param("start")int start,@Param("end") int end);

	//��ҳģ���������õ���ѯ��¼
	public int getCountByName(@Param("name")String name);
	
	//����id����ɾ��
	public void deletePersons(int[] id);
	
	
	//����ID��һ��,��ҳ����µ���ʾ
	public Map queryPersonById(@Param("userid")Integer userid,@Param("start")int start,@Param("end") int end);
	//����ID��һ��,��ҳ����µ���ʾ
	public int getCountById(@Param("userid")Integer userid);
	
	//ģ�����ֻ��ŷ�ҳ����µ���ʾ
	public Map queryPersonByMobile(@Param("mobile")String mobile,@Param("start")int start,@Param("end") int end);
	//ģ�����ֻ��� ������ҳ����µ���ʾ
	public int getCountByMobile(@Param("mobile")String mobile);
	
		
	
	
	
	
	
}
