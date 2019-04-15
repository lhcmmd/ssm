package com.baizhi.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baizhi.entity.Person;
import com.baizhi.service.PersonService;

@Controller
@RequestMapping("person")
public class PersonController {
	
	@Autowired
	private PersonService personService;
	@RequestMapping("showAll")
	public @ResponseBody List<Person> showAll() throws IOException{
		List<Person> list = personService.queryAll();
		return list;
	}
	
	@RequestMapping("insertOne")
	public @ResponseBody void insertOne(Person person){// 细节1：返回void，则 把空字符串 响应ajax
		personService.insertOne(person);
	}
	
	@RequestMapping("deleteOne")
	//此处@ResponseBody // 作用：把返回值对象 自动转json，响应ajax
						// 细节1：返回void，则 把空字符串 响应ajax
	public @ResponseBody void deleteOne(Integer userid,HttpServletResponse response)throws IOException{
		personService.deleteOne(userid);		
	}
	
	@RequestMapping("queryOne")
	public @ResponseBody Person queryOne(Integer userid,HttpServletResponse response)throws IOException{
		Person e = personService.queryOneById(userid);
		return e;
	}
	
	@RequestMapping("updateOne")
	public @ResponseBody void updateOne(Person p)throws IOException{
		personService.updateEmp(p);
	}
	
	@RequestMapping("/getUser")
	public @ResponseBody Map getUser(int page,int rows){
		return personService.getUser(page,rows);
	}
	
	@RequestMapping("/getPersonByName")
	public @ResponseBody Map getPersonByName(String name,int page,int rows){
		System.out.println("name-----"+name);
		return personService.getPersonByNamePage(name,page,rows);
	}
	
	@RequestMapping("deletePersons")
	public @ResponseBody void deletePersons(int[] id){
		personService.deletePersons(id);		
	}
	
	//分页情况下查id并显示
	@RequestMapping("/getPersonByID")
	public @ResponseBody Map getPersonByID(Integer userid,int page,int rows){
		System.out.println("userid-----"+userid);
		return personService.queryPersonById(userid,page,rows);
	}
	
	
	//分页情况下查手机号并显示
	@RequestMapping("/getPersonByMobile")
	public @ResponseBody Map getPersonByMobile(String mobile,int page,int rows){
		System.out.println("userid-----"+mobile);
		return personService.queryPersonByMobile(mobile,page,rows);
	}
	
	
	
}
