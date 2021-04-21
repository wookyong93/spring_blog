package com.spring.blog.search.vo;

import org.springframework.stereotype.Component;

@Component("searchVO")
public class SearchVO {
	private String selector;
	private String who;
	
	
	public String getSelector() {
		return selector;
	}
	public void setSelector(String selector) {
		this.selector = selector;
	}
	public String getWho() {
		return who;
	}
	public void setWho(String who) {
		this.who = who;
	}
	
	
	
	
	
	
}
