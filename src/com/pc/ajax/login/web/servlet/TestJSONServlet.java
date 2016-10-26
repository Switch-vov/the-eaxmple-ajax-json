package com.pc.ajax.login.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pc.ajax.login.domain.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

/**
 * 测试JSON
 * 
 * @author Switch
 * @data 2016年10月21日
 * @version V1.0
 */
public class TestJSONServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// 对象或map————>JSON
		User user = new User();
		user.setUid("u01");
		user.setUsername("switch");
		String jsonObject = JSONObject.fromObject(user).toString();
		// 输出结果：{"uid":"u01","username":"switch"}
		System.out.println(jsonObject);
		
		Map<String, String> maps = new LinkedHashMap<>();
		maps.put("username", "switch");
		maps.put("password", "123456");
		String jsonMap = JSONObject.fromObject(maps).toString();
		// 输出结果：{"username":"switch","password":"123456"}
		System.out.println(jsonMap);
		
		// 数组或List对象————>JSON
		String[] strings = {"switch", "kity"};
		String jsonArray = JSONArray.fromObject(strings).toString();
		// 输出结果：["switch","kity"]
		System.out.println(jsonArray);
		
		List<String> lists = new ArrayList<>();
		lists.add("switch");
		lists.add("kity");
		String jsonList = JSONArray.fromObject(lists).toString();
		// 输出结果：["switch","kity"]
		System.out.println(jsonList);
		
		// 综合案例
		User user1 = new User();
		user1.setUid("uid1");
		user1.setUsername("switch");
		User user2 = new User();
		user2.setUid("uid2");
		user2.setUsername("kity");
		List<User> users = new ArrayList<>();
		users.add(user1);
		users.add(user2);
		String jsonComplex = JSONArray.fromObject(users).toString();
		// 输出结果：[{"uid":"uid1","username":"switch"},{"uid":"uid2","username":"kity"}]
		System.out.println(jsonComplex);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
