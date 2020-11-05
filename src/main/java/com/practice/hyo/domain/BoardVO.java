package com.practice.hyo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private Long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getbtitle() {
		return btitle;
	}
	public void setbtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getbcontent() {
		return bcontent;
	}
	public void setbcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getbwriter() {
		return bwriter;
	}
	public void setbwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter=" + bwriter + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + "]";
	}
	
}
