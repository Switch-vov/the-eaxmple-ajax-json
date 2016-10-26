package com.pc.ajax.login.service;

import java.sql.SQLException;

import com.pc.ajax.login.dao.UserDao;
import com.pc.ajax.login.domain.User;

/**
 * 用户服务Service
 * 
 * @author Switch
 * @data 2016年10月21日
 * @version V1.0
 */
public class UserService {

	public User getUserByUserName(String username) throws SQLException {
		UserDao userDao = new UserDao();
		return userDao.getUserByUserName(username);
	}

}
