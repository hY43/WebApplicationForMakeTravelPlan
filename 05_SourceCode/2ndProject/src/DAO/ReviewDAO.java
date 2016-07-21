package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.ReviewVO;

public class ReviewDAO {
	private Connection conn;
	private StringBuffer sb = new StringBuffer();
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ReviewDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<ReviewVO> selectAll() {
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		sb.setLength(0);
		sb.append("SELECT * from review ");
		ReviewVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int reviewNo = rs.getInt("reviewno");
				int enable = rs.getInt("enable");
				String regDate = rs.getString("regdate");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String userId = rs.getString("userid");
				vo = new ReviewVO(reviewNo, enable, regDate, title, contents, userId);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ReviewVO selectOne(int reviewNo) {
		sb.setLength(0);
		sb.append("SELECT enable, regdate, title, contents, userid ");
		sb.append("WHERE reviewno = ? ");
		ReviewVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, reviewNo);
			rs = pstmt.executeQuery();

			int enable = rs.getInt("enable");
			String regDate = rs.getString("regdate");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String userId = rs.getString("userid");
			vo = new ReviewVO(reviewNo, enable, regDate, title, contents, userId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(ReviewVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO review ");
		sb.append("VALUES(review_reviewno_seq.NEXTVAL, ?, sysdate, ?, ?, ? )");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getEnable());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getUserId());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(int reviewNo) {
		sb.setLength(0);
		sb.append("DELETE review ");
		sb.append("WHERE reviewno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, reviewNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateOne(ReviewVO vo) {
		sb.setLength(0);
		sb.append("UPDATE review ");
		sb.append("SET enable = ?, title = ?, ");
		sb.append("contents = ?, userid = ? ");
		sb.append("WHERE  reviewno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getEnable());			
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getUserId());
			pstmt.setInt(5, vo.getReviewNo());

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
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
