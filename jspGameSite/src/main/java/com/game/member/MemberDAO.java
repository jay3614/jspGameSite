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
	
	// 사용자 정보 불러오기
	public Member getMember(String id) {
		String SQL = "SELECT * FROM member WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Member member = new Member();
				
				member.setId(rs.getString(1));
				member.setNickname(rs.getString(2));
				member.setPassword(rs.getString(3));
				member.setName(rs.getString(4));
				member.setPassword(rs.getString(5));
				member.setGender(rs.getString(6));
				member.setCash(rs.getInt(7));
				
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
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
	
	public int register(Member member) {
		
		String SQL = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getPhoneNumber());
			pstmt.setString(6, member.getGender());
			pstmt.setInt(7, 0);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;	// 데이터베이스 오류
	}
}
