package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.AnswerVO;

public class AnswerDAO {
	private Connection conn;
	private StringBuffer sb = new StringBuffer();
	private ResultSet rs;
	private PreparedStatement pstmt;

	public AnswerDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<AnswerVO> selectAll() {
		ArrayList<AnswerVO> list = new ArrayList<AnswerVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM answer ");
		AnswerVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int answerNo = rs.getInt("answerno");
				String contents = rs.getString("contents");
				int questionNo = rs.getInt("questionno");
				String userId = rs.getString("userid");
				vo = new AnswerVO(answerNo, contents, questionNo, userId);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public AnswerVO selectOne(int answerNo) {
		sb.setLength(0);
		sb.append("SELECT contents, questionno, userid ");
		sb.append("FROM answer ");
		sb.append("WHERE answerno = ? ");
		AnswerVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, answerNo);
			rs = pstmt.executeQuery();
			rs.next();
			String contents = rs.getString("contents");
			int questionNo = rs.getInt("questionno");
			String userId = rs.getString("userid");
			vo = new AnswerVO(answerNo, contents, questionNo, userId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(AnswerVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO answer ");
		sb.append("VALUES (answer_answerno.NEXTVAL, ?, ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getContents());
			pstmt.setInt(2, vo.getQuestionNo());
			pstmt.setString(3, vo.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(AnswerVO vo) {
		sb.setLength(0);
		sb.append("UPDATE answer ");
		sb.append("SET (contents = ?, questionno = ?, userid = ? ");
		sb.append("WHERE answerno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getContents());
			pstmt.setInt(2, vo.getQuestionNo());
			pstmt.setString(3, vo.getUserId());
			pstmt.setInt(4, vo.getAnswerNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(int answerNo) {
		sb.setLength(0);
		sb.append("DELETE answer ");
		sb.append("WHERE answerno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, answerNo);
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
