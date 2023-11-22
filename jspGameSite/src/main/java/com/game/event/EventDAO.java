package com.game.event;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EventDAO {

	private Connection conn;
	
	private ResultSet rs;
	
	public EventDAO() {
		
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
		String SQL = "SELECT id FROM event ORDER BY id DESC";
		
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
	public int write(String title, String eventRange, String content, String image, int viewCount, String types) {
		
		String SQL = "INSERT INTO event VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, eventRange);
			pstmt.setString(4, content);
			pstmt.setString(5, image);
			pstmt.setInt(6, viewCount);
			pstmt.setString(7, types);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public ArrayList<Event> getList() {
		String SQL = "SELECT * FROM event ORDER BY id DESC";
		
		ArrayList<Event> list = new ArrayList<Event>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Event event = new Event();
				
				event.setId(rs.getLong(1));
				event.setTitle(rs.getString(2));
				event.setEventRange(rs.getString(3));
				event.setContent(rs.getString(4));
				event.setImage(rs.getString(5));
				event.setViewCount(rs.getInt(6));
				event.setTypes(rs.getString(7));
				
				list.add(event);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public ArrayList<Event> getEventList() {
		String SQL = "SELECT id, title, image, eventRange FROM event ORDER BY id DESC";
		
		ArrayList<Event> list = new ArrayList<Event>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Event event = new Event();
				
				event.setId(rs.getLong(1));
				event.setTitle(rs.getString(2));
				event.setImage(rs.getString(3));
				event.setEventRange(rs.getString(4));
				
				list.add(event);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// 이벤트 상세
	public Event getEvent(long id) {
		
		String SQL = "SELECT * FROM event WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Event event = new Event();
				
				event.setId(rs.getLong(1));
				event.setTitle(rs.getString(2));
				event.setEventRange(rs.getString(3));
				event.setContent(rs.getString(4));
				event.setImage(rs.getString(5));
				event.setViewCount(rs.getInt(6));
				
				int viewCount = rs.getInt(6);
				viewCount++;
				countUpdate(viewCount, id);
				
				return event;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	// 조회수 증가
	public int countUpdate(int viewCount, long id) {
		String SQL = "update event set viewCount = ? where id = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, viewCount);
			pstmt.setLong(2, id);
			return pstmt.executeUpdate();		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	// 아직 미사용
	public int update(String title, String eventRange, String content, String image, String types) {
		
		String SQL = "UPDATE evnet SET title = ?, eventRange = ?, content = ?, image = ?, types = ? WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, eventRange);
			pstmt.setString(3, content);
			pstmt.setString(4, image);
			pstmt.setString(5, types);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
		
	}
	
	// 아직 미사용
	public int delete(long id) {
		
		String SQL = "UPDATE event WHERE id = ?";
		
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
