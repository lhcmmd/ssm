package com.baizhi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public User queryByName(String name) {
		User u = userDao.queryByName(name);
		return u;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public void insertOne(User user) {
		userDao.insertOne(user);
	}

}
