package com.baizhi.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("file")
public class FileCon {
	@RequestMapping("fileUpload")
	public String fileUpload(HttpSession session,MultipartFile file1) throws IllegalStateException, IOException{
		//ÉÏ´«
		ServletContext ctx = session.getServletContext();
		String realPath = ctx.getRealPath("/upload");
		
		File file = new File(realPath+"/"+file1.getOriginalFilename());
		file1.transferTo(file);
		return "index";
	}
}
