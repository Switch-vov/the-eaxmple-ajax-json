package com.pc.ajax.login.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.pc.ajax.login.domain.User;
import com.pc.ajax.login.utils.C3P0Utils;

/**
 * UserDao
 * 
 * @author Switch
 * @data 2016年10月21日
 * @version V1.0
 */
public class UserDao {

	public User getUserByUserName(String username) throws SQLException {
		QueryRunner qRunner = new QueryRunner();
		String sql = "select * from user where username = ?";
		Object[] params = { username };
		return qRunner.query(C3P0Utils.getConnection(), sql, new BeanHandler<>(User.class), params);
	}

}
