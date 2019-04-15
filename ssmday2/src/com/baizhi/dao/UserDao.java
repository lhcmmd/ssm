package com.baizhi.dao;

import com.baizhi.entity.User;

public interface UserDao {
	public User queryByName(String name);
	
	public void insertOne(User user);
}
