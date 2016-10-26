package com.pc.ajax.login.service;

import java.sql.SQLException;
import java.util.List;

import com.pc.ajax.login.dao.WordDao;
import com.pc.ajax.login.domain.Word;

/**
 * 文本Service
 * 
 * @author Switch
 * @data 2016年10月26日
 * @version V1.0
 */
public class WordService {
	/**
	 * 搜索
	 * 
	 * @param text
	 *            搜索文本
	 * @return 结果列表
	 * @throws SQLException 
	 */
	public List<Word> searchText(String text) throws SQLException {
		return new WordDao().searchText(text);
	}

}
