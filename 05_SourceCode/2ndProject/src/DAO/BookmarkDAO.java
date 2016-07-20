package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.BookmarkVO;

public class BookmarkDAO {
	private Connection conn;
	private StringBuffer sb = new StringBuffer();
	private ResultSet rs;
	private PreparedStatement pstmt;

	public BookmarkDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<BookmarkVO> selectAll() {
		ArrayList<BookmarkVO> list = new ArrayList<BookmarkVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM bookmark ");
		BookmarkVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int bookmarkNo = rs.getInt("bookmarkNo");
				String url = rs.getString("url");
				String userid = rs.getString("userid");
				vo = new BookmarkVO(bookmarkNo, url, userid);
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public BookmarkVO selectOne(int bookmarkNo) {
		sb.setLength(0);
		sb.append("SELECT url, userid ");
		sb.append("WHERE bookmarkNo = ? ");
		BookmarkVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bookmarkNo);
			rs = pstmt.executeQuery();
			rs.next();
			String url = rs.getString("url");
			String userid = rs.getString("userid");
			vo = new BookmarkVO(bookmarkNo, url, userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(BookmarkVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO bookmark ");
		sb.append("VALUES(bookmark_bookmarkno_seq.NEXTVAL, ?, ?) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, vo.getUrl());
			pstmt.setString(2, vo.getUserid());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void deleteOne(int bookmarkNo) {
		sb.setLength(0);
		sb.append("DELETE bookmarkd ");
		sb.append("WHERE bookmarkno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bookmarkNo);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(BookmarkVO vo) {
		sb.setLength(0);
		sb.append("UPDATE bookmark ");
		sb.append("SET url = ?, userid = ? ");
		sb.append("WHERE bookmarkNo = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getUrl());
			pstmt.setString(2, vo.getUserid());
			pstmt.setInt(3, vo.getBookmarkNo());
			
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
