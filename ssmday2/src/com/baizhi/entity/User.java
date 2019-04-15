package com.baizhi.entity;

public class User {
	private Integer id;
	private String username;
	private String password;
	private String realname;
	private String imgname;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public User(Integer id, String username, String password, String realname,
			String imgname) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.imgname = imgname;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", realname=" + realname + ", imgname=" + imgname
				+ "]";
	}
	
}
