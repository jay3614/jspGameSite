package com.game.reply;

public class Reply {
	
    private Long rno;
	private String replyer;
	private Long target_id;
	private String comment;
	private String regDate;
	
	public Long getRno() {
		return rno;
	}
	public void setRno(Long rno) {
		this.rno = rno;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Long getTarget_id() {
		return target_id;
	}
	public void setTarget_id(Long target_id) {
		this.target_id = target_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
