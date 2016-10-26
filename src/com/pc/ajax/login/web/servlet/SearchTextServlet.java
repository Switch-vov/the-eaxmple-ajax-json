package com.pc.ajax.login.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pc.ajax.login.domain.Word;
import com.pc.ajax.login.service.WordService;

import net.sf.json.JSONArray;

/**
 * 搜索文本Servlet
 * 
 * @author Switch
 * @data 2016年10月26日
 * @version V1.0
 */
public class SearchTextServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		// 获取表单信息
		String text = request.getParameter("text");
		// System.out.println(text);
		List<Word> words = new ArrayList<>();
		try {
			if (text != null && !"".equals(text) && !text.matches("[_%]")) {
				// 在数据库中搜索，只返回前五条记录
				words = new WordService().searchText(text.trim());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 转换成JSON数组对象
		JSONArray jsonWords = JSONArray.fromObject(words);
		response.getWriter().write(jsonWords.toString());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}