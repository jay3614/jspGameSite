package com.game.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	private Connection conn;
	
	private PreparedStatement pstmt;
	
	private ResultSet rs;
	
	public MemberDAO() {
		
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
	
	public int login(String id, String password) {
		
		String SQL = "SELECT password FROM member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// ID가 있는 경우
				if(rs.getString(1).equals(password)) {
					return 1;	// 로그인 성공
				}else {
					return 0;	// 비밀번호 불일치
				}
			}
			
			return -1;	// 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;	// 데이터베이스 오류
	}
	
	public int join(Member member) {
		
		String SQL = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, 0)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getPhoneNumber());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getSsn());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;	// 데이터베이스 오류
	}
}
