package com.game.notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {

	private Connection conn;
	
	private ResultSet rs;
	
	public NoticeDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:8080/gameSite";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";	// 데이터베이스 오류
	}
	
	// 아직 미사용
	public int getNext() {
		String SQL = "SELECT id FROM notice ORDER BY id DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;	// Long 변환해야함
			}
			return 1;	// 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	// 아직 미사용
	public int write(String title, String content, int viewCount, String types, String date) {
		
		String SQL = "INSERT INTO event VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setInt(4, viewCount);
			pstmt.setString(5, types);
			pstmt.setString(6, date);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public ArrayList<Notice> getNoticeList() {
		
		String SQL = "SELECT * FROM notice WHERE types = '공지' ORDER BY id ASC";
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setId(rs.getLong(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setViewCount(rs.getInt(4));
				notice.setTypes(rs.getString(5));
				notice.setRegDate(rs.getString(6));
				
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public ArrayList<Notice> getNoticeAfter() {
		
		String SQL = "SELECT title FROM notice WHERE types = '공지' ORDER BY id ASC LIMIT 1, 5";
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setTitle(rs.getString(1));
				
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public ArrayList<Notice> getUpdateList() {
		
		String SQL = "SELECT * FROM notice where types = '업데이트' ORDER BY id ASC";
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setId(rs.getLong(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setViewCount(rs.getInt(4));
				notice.setTypes(rs.getString(5));
				notice.setRegDate(rs.getString(6));
				
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// 아직 미사용
	public Notice getEvent(long id) {
		
		String SQL = "SELECT * FROM notice WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Notice notice = new Notice();
				
				notice.setId(rs.getLong(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setViewCount(rs.getInt(4));
				notice.setTypes(rs.getString(5));
				notice.setRegDate(getDate());
				
				return notice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	// 아직 미사용
	public int update(String title, String content, String types) {
		
		String SQL = "UPDATE notice SET title = ?, content = ?, types = ? WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, types);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
		
	}
	
	// 아직 미사용
	public int delete(long id) {
		
		String SQL = "UPDATE notice WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, id);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
		
	}
	
}
