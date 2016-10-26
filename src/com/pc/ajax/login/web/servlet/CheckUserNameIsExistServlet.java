package com.pc.ajax.login.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pc.ajax.login.domain.User;
import com.pc.ajax.login.service.UserService;

/**
 * 检测用户名是否存在Servlet
 * 
 * @author Switch
 * @data 2016年10月21日
 * @version V1.0
 */
public class CheckUserNameIsExistServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		// 获取用户名参数
		String username = request.getParameter("username");
		
		// 查询用户
		try {
			User user = new UserService().getUserByUserName(username);
			if (user == null) {
				response.getWriter().write("<span class='label label-success'>用户名可用</span>");
			} else {
				response.getWriter().write("<span class='label label-danger'>用户名不可用</span>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}