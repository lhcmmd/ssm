package com.baizhi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.baizhi.dao.PersonDao;

import com.baizhi.entity.Person;
@Service
@Transactional
public class PersonServiceImpl implements PersonService{
	@Autowired
	private PersonDao personDao;
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Person> queryAll() {
		List<Person> list = personDao.queryAll();
		return list;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public void insertOne(Person person) {
		personDao.insertOne(person);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public void deleteOne(Integer userid) {
		personDao.deleteOne(userid);
	}
	
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Person queryOneById(Integer userid) {
		Person e = personDao.queryOneById(userid);
		return e;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public void updateEmp(Person emp) {
		Person e = personDao.queryOneById(emp.getId());
		System.out.println("吵到的"+e);
		e.setBirthday(emp.getBirthday());
		e.setCity(emp.getCity());
		e.setEmail(emp.getEmail());
		e.setMobile(emp.getMobile());
		e.setName(emp.getName());
		e.setTelphone(emp.getTelphone());
		personDao.updatePerson(e);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public Map getUser(int page, int rows) {
	//1.获取到当前页数据
	int start=(page-1)*rows+1;
	int end = page*rows;
	List<Person> list = personDao.getPersonByPage(start,end);
	
	//2.获取到总记录数
	int total = personDao.getCount();
	
	//3.把当前页数据以及总记录数放在map中
	Map map = new HashMap();
	map.put("rows", list);
	map.put("total", total);
	
	return map;
}

	public int getCount() {

		return personDao.getCount();
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public Map getPersonByNamePage(String name, int page, int rows) {
		//1.获取到当前页数据
		int start=(page-1)*rows+1;
		int end = page*rows;
		List<Person> list = personDao.getPersonByNamePage(name,start,end);
		
		//2.获取到总记录数
		int total = personDao.getCountByName(name);
		System.out.println("total----"+total);
		System.out.println("start----"+start);
		System.out.println("end----"+end);
		if(list==null){System.out.println("list----kong");}
		else{for(Person p:list){System.out.println(p);}}
		//3.把当前页数据以及总记录数放在map中
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", total);
		
		return map;
	}

	public int getCountByName(String name) {
		
		
		return 0;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public void deletePersons(int[] id) {
		personDao.deletePersons(id);
	}

	public Map queryPersonById(Integer userid, int page, int rows) {
		//1.获取到当前页数据
				int start=(page-1)*rows+1;
				int end = page*rows;
				List<Person> list = personDao.queryPersonById(userid,start,end);
				
				//2.获取到总记录数
				int total = personDao.getCountById(userid);
				System.out.println("total----"+total);
				System.out.println("start----"+start);
				System.out.println("end----"+end);
				if(list==null){System.out.println("list----kong");}
				else{for(Person p:list){System.out.println(p);}}
				//3.把当前页数据以及总记录数放在map中
				Map map = new HashMap();
				map.put("rows", list);
				map.put("total", total);
				
				return map;
	}

	public int getCountById(Integer userid) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//查手机号分页情况下
	public Map queryPersonByMobile(String mobile, int page, int rows) {
		int start=(page-1)*rows+1;
		int end = page*rows;
		List<Person> list = personDao.queryPersonByMobile(mobile,start,end);
		
		//2.获取到总记录数
		int total = personDao.getCountByMobile(mobile);
		System.out.println("total----"+total);
		System.out.println("start----"+start);
		System.out.println("end----"+end);
		if(list==null){System.out.println("list----kong");}
		else{for(Person p:list){System.out.println(p);}}
		//3.把当前页数据以及总记录数放在map中
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", total);
		
		return map;
	}

	public int getCountByMobile(String mobile) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
