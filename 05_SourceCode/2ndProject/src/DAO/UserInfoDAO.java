package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.UserInfoVO;

public class UserInfoDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	private StringBuffer sb = new StringBuffer();

	public UserInfoDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<UserInfoVO> selectAll() {
		ArrayList<UserInfoVO> list = new ArrayList<UserInfoVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM userinfo ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			UserInfoVO vo = null;
			while (rs.next()) {
				String userId = rs.getString("userID");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				String backgroundImg = rs.getString("backgroundImg");
				String admin = rs.getString("admin");
				vo = new UserInfoVO(userId, password, name, tel, email, backgroundImg, admin);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public UserInfoVO selectOne(String userId) {
		sb.setLength(0);
		sb.append("SELECT password, name, tel, email, backgroundImg, admin ");
		sb.append("FROM userinfo ");
		sb.append("WHERE userId = ? ");
		System.out.println(sb);
		UserInfoVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			rs.next();
			String password = rs.getString("password");
			String name = rs.getString("name");
			String tel = rs.getString("tel");
			String email = rs.getString("email");
			String backgroundImg = rs.getString("backgroundImg");
			String admin = rs.getString("admin");
			vo = new UserInfoVO(userId, password, name, tel, email, backgroundImg, admin);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(UserInfoVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO userinfo ");
		sb.append("VALUES( ?, ?, ?, ?, ?, ?, ? ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getBackgroundImg());
			pstmt.setString(7, vo.getAdmin());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void deleteOne(String userId) {
		sb.setLength(0);
		sb.append("DELETE userinfo ");
		sb.append("WHERE userid = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(UserInfoVO vo) {
		sb.setLength(0);
		sb.append("UPDATE userinfo ");
		sb.append("SET name = ?, password = ?, tel = ? ");
		sb.append("email = ?, backgroundImg = ?, admin = ? ");
		sb.append("WHERE userId = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getBackgroundImg());
			pstmt.setString(6, vo.getAdmin());
			pstmt.setString(7, vo.getUserId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}