package com.game.video;

//import com.game.member.Member;

public class Video {
	
	private int id;
	private String title;
	private String content;
	private String writer;
	private String youtubeLink;	// 링크를 삽입하면 자동으로 가장 마지막에 있는 / 의 뒷부분만 잘라서 db에 저장시키기
	private int favorate;
	private int viewCount;
	private String date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getYoutubeLink() {
		return youtubeLink;
	}
	public void setYoutubeLink(String youtubeLink) {
		this.youtubeLink = youtubeLink;
	}
	public int getFavorate() {
		return favorate;
	}
	public void setFavorate(int favorate) {
		this.favorate = favorate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
