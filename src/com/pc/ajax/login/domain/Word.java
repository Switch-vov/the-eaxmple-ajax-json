package com.pc.ajax.login.domain;

import java.io.Serializable;

/**
 * WordBean
 * 
 * @author Switch
 * @data 2016年10月26日
 * @version V1.0
 */
public class Word implements Serializable{
	private String pid;
	private String word;
	private String pinyin;
	public Word() {
		super();
	}
	public Word(String pid, String word, String pinyin) {
		super();
		this.pid = pid;
		this.word = word;
		this.pinyin = pinyin;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getPinyin() {
		return pinyin;
	}
	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	@Override
	public String toString() {
		return "Word [pid=" + pid + ", word=" + word + ", pinyin=" + pinyin + "]";
	}
	
}
