package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
	public User queryByName(String name);
	public void insertOne(User user);
}
