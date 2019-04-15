package com.baizhi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("checkLogin")
	public String checkLogin(String username,String password,HttpSession session){
		
		User u = userService.queryByName(username);
		if(u!=null){
			if(password.equals(u.getPassword())){
				session.setAttribute("loginflag", "ok");
				session.setAttribute("name", u.getUsername());
				session.setAttribute("userimg", u.getImgname());
				
				Object value = session.getAttribute("loginflag");
				
				System.out.println("user____"+value);
				
			}else{ session.setAttribute("loginflag", "no");}
		}else{session.setAttribute("loginflag", "no");}
		return "forward:/person/showAll";
	}
	
	@RequestMapping("insertOne")
	public String insertOne(User user,HttpSession session,MultipartFile file1) throws IllegalStateException, IOException{
		//System.out.println(user.getImgname()+"-----------");
		
		String oldName = file1.getOriginalFilename();
		System.out.println("老名字-----"+oldName);
		
		ServletContext ctx = session.getServletContext();
		String realPath = ctx.getRealPath("/upload");		
		
		
		String uuId = UUID.randomUUID().toString().replace("-", "");
		String newName = uuId+oldName;
		System.out.println("新名字"+newName);
		File file = new File(realPath+"/"+newName);
		System.out.println("realPath-----"+realPath+"/"+newName);
		file1.transferTo(file);
		user.setImgname("/"+newName);
		System.out.println("user========"+user);
		userService.insertOne(user);
		
		session.setAttribute("loginflag", "ok");
		session.setAttribute("name", user.getUsername());
		session.setAttribute("userimg", user.getImgname());
		return "forward:/person/showAll";
	}
	
}
