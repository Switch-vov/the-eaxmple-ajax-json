package com.pc.ajax.login.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.pc.ajax.login.domain.Word;
import com.pc.ajax.login.utils.C3P0Utils;

/**
 * 文本Dao
 * 
 * @author Switch
 * @data 2016年10月26日
 * @version V1.0
 */
public class WordDao {
	/**
	 * 搜索
	 * 
	 * @param text
	 *            搜索文本
	 * @return 结果列表
	 * @throws SQLException
	 */
	public List<Word> searchText(String text) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from word where pinyin LIKE ? or word LIKE ? limit 5";
		text = "%" + text + "%";
		Object[] params = { text, text };
		return queryRunner.query(sql, new BeanListHandler<>(Word.class), params);
	}

}
