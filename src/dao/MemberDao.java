package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDto;

public class MemberDao {
	DBConnection db = new DBConnection();
	Connection conn = db.getConnection();
	
	public void getSign(String id, String pw, String name) {
		PreparedStatement pstmt = null;
		String sql = "insert into member values(?, ?, ?, 1000)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean getLogin(String id, String pw) {
		boolean get = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id = ? and pw = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				get = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return get;
	}
	
	public MemberDto getMemberData(String id) {
		MemberDto get = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				int point = rs.getInt("point");
				get = new MemberDto(name, point);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return get;
	}
	
	public void getPoint(int point, String name) {
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET point = ? where name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, name);
			pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> getMember() {
		ArrayList<MemberDto> get = new ArrayList<MemberDto>();
		String sql = "select * from member";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				get.add(new MemberDto(name, point, id, pw));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return get;
	}
	
	public void getDelete(String id) {
		String sql = "DELETE FROM member WHERE ID = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getChange(String pw, String name, int point, String id) {
		String sql = "UPDATE member SET pw = ?,name = ?,point = ? where id = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setInt(3, point);
			pstmt.setString(4, id);
			pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
