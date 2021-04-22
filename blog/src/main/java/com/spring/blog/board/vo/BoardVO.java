package com.spring.blog.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
	private String title;
	private String id;
	private String content;
	private Date writeDate;
	private int contentNO;
	private int hit;
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getContentNO() {
		return contentNO;
	}
	public void setContentNO(int contentNO) {
		this.contentNO = contentNO;
	}
	
	
}
