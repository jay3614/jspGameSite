package com.game.reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO {

	private Connection conn;
	
	private ResultSet rs;
	
	public ReplyDAO() {
		
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
	
	// 현재 날짜 리턴
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
	
	// rno 다음번호 리턴
	public Long getNext() {
		String SQL = "SELECT rno FROM reply ORDER BY rno DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getLong(1) + 1L;
			}
			return 1L;	// 첫 번째 댓글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1L;	// 데이터베이스 오류
	}
	
	// 글 작성
	public int write(String replyer, Long target_id, String comment) {
		
		String SQL = "INSERT INTO reply VALUES (?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, getNext());
			pstmt.setString(2, replyer);
			pstmt.setLong(3, target_id);
			pstmt.setString(4, comment);
			pstmt.setString(5, getDate());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	// 댓글수 리턴
	public int getReplyCount(Long target_id) {
		
		String SQL = "SELECT count(*) FROM reply WHERE target_id = ?";
		
		int count = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, target_id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	        	count = rs.getInt(1); // SQL 결과값을 변수에 저장
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	// 댓글 전체 리턴
	public ArrayList<Reply> getReplyList(Long target_id, int commentPage) {
		
		String SQL = "SELECT * FROM reply WHERE target_id = ? ORDER BY rno DESC LIMIT ?, 10";
		
		ArrayList<Reply> list = new ArrayList<Reply>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, target_id);
			pstmt.setInt(2, (commentPage - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				
				reply.setRno(rs.getLong(1));
				reply.setReplyer(rs.getString(2));
				reply.setTarget_id(rs.getLong(3));
				reply.setComment(rs.getString(4));
				reply.setRegDate(rs.getString(5));
				
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// 댓글 삭제
	public int delete(Long rno) {
		String SQL = "DELETE FROM reply WHERE rno = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, rno);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	// rno로 로그인유저와 댓글작성자 비교
	public String compare(Long rno) {
		String SQL = "SELECT replyer FROM reply WHERE rno = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, rno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Reply reply = new Reply();
				
				reply.setReplyer(rs.getString(1));
				
				return reply.getReplyer();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	// 데이터베이스 오류
	}
}
