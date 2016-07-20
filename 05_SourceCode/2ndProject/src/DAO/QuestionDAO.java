package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.QuestionVO;

public class QuestionDAO {
	private Connection conn;
	private StringBuffer sb = new StringBuffer();
	private PreparedStatement pstmt;
	private ResultSet rs;

	public QuestionDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<QuestionVO> selectAll() {
		ArrayList<QuestionVO> list = new ArrayList<QuestionVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM question ");

		QuestionVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int questionNo = rs.getInt("questinoNo");
				String regDate = rs.getString("regDate");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String userId = rs.getString("userId");

				vo = new QuestionVO(questionNo, regDate, title, contents, userId);

				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	public QuestionVO selectOne(int questionNo) {
		sb.setLength(0);
		sb.append("SELECT regdate, title, contents, userid ");
		sb.append("FROM question ");
		sb.append("WHERE questionno = ?");
		QuestionVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, questionNo);
			rs = pstmt.executeQuery();
			rs.next();

			String regDate = rs.getString("regDate");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String userId = rs.getString("userId");

			vo = new QuestionVO(questionNo, regDate, title, contents, userId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(QuestionVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO question ");
		sb.append("VALUES(question_questionno_seq.NEXTVAL, ?, ?, ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getRegDate());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getUserId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(QuestionVO vo) {
		sb.setLength(0);
		sb.append("UPDATE question ");
		sb.append("SET regdate = ?, title = ?, contents = ?, userid = ? ");
		sb.append("WHERE questionno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, vo.getRegDate());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getUserId());
			pstmt.setInt(5, vo.getQuestionNo());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void deleteOne(int questionNo) {
		sb.setLength(0);
		sb.append("DELETE question ");
		sb.append("WHERE questionno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, questionNo);
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
