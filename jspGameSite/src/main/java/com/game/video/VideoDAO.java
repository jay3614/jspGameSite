package com.game.video;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VideoDAO {

	private Connection conn;
	
	private ResultSet rs;
	
	public VideoDAO() {
		
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
		String SQL = "SELECT id FROM video ORDER BY id DESC";
		
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
	public int write(String title, String content, String writer, String youtubeLink, String date) {
		
		String SQL = "INSERT INTO video VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, writer);		// member의 로그인 한 id 넣도록 수정해야함
			pstmt.setString(5, youtubeLink);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setString(8, date);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	// 아직 미사용
	public ArrayList<Video> getList() {
		
		String SQL = "SELECT * FROM video ORDER BY id ASC";
		
		ArrayList<Video> list = new ArrayList<Video>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Video video = new Video();
				
				video.setId(rs.getLong(1));
				video.setTitle(rs.getString(2));
				video.setContent(rs.getString(3));
				video.setWriter(rs.getString(4));	// member타입으로 가져오도록 수정
				video.setYoutubeLink(rs.getString(5));
				video.setFavorate(rs.getInt(6));
				video.setViewCount(rs.getInt(7));
				video.setDate(getDate());
				
				list.add(video);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// 아직 미사용
	public Video getVideo(long id) {
		
		String SQL = "SELECT * FROM video WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setLong(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Video video = new Video();
				
				video.setId(rs.getLong(1));
				video.setTitle(rs.getString(2));
				video.setContent(rs.getString(3));
				video.setWriter(rs.getString(4));	// member타입으로 가져오도록 수정
				video.setYoutubeLink(rs.getString(5));
				video.setFavorate(rs.getInt(6));
				video.setViewCount(rs.getInt(7));
				video.setDate(getDate());
				
				return video;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	// 아직 미사용
	public int update(String title, String content, String youtubeLink) {
		
		String SQL = "UPDATE video SET title = ?, content = ?, youtubeLink = ? WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, youtubeLink);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
		
	}
	
	// 아직 미사용
	public int delete(long id) {
		
		String SQL = "UPDATE video WHERE id = ?";
		
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