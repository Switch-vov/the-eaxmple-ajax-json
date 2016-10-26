package com.pc.ajax.login.domain;

/**
 * UserBean
 * 
 * @author Switch
 * @data 2016年10月21日
 * @version V1.0
 */
public class User {
	private String uid;
	private String username;

	public User() {

	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + "]";
	}

}
