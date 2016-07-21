package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.PlanVO;

public class PlanDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	private StringBuffer sb = new StringBuffer();

	public PlanDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<PlanVO> selectAll() {
		ArrayList<PlanVO> list = new ArrayList<PlanVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM plan ");
		PlanVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int planNo = rs.getInt("planno");
				String title = rs.getString("title");
				String regdate = rs.getString("regdate");
				int period = rs.getInt("period");
				String userId = rs.getString("userid");
				vo = new PlanVO(planNo, title, regdate, period, userId);
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public PlanVO selectOne(int planNo) {
		sb.setLength(0);
		sb.append("SELECT title, regdate, period, userid ");
		sb.append("WHERE planno = ? ");
		PlanVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, planNo);
			rs = pstmt.executeQuery();
			rs.next();
			String title = rs.getString("title");
			String regdate = rs.getString("regdate");
			int period = rs.getInt("period");
			String userId = rs.getString("userid");
			vo = new PlanVO(planNo, title, regdate, period, userId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(PlanVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO plan ");
		sb.append("VALUES (plan_planno_seq.NEXTVAL, ?, ?, ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getRegDate());
			pstmt.setInt(3, vo.getPeriod());
			pstmt.setString(4, vo.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(int planNo) {
		sb.setLength(0);
		sb.append("DELETE plan ");
		sb.append("WHERE planno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, planNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(PlanVO vo) {
		sb.setLength(0);
		sb.append("UPDATE plan ");
		sb.append("SET title = ?, regdate = ?, period = ?, ");
		sb.append("userid = ? WHERE planno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getRegDate());
			pstmt.setInt(3, vo.getPeriod());
			pstmt.setString(4, vo.getUserId());
			pstmt.setInt(5, vo.getPlanNo());
			pstmt.executeUpdate();
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

	public ArrayList<PlanVO> selectUserPlan(String userId) {
		ArrayList<PlanVO> list = new ArrayList<PlanVO>();
		sb.setLength(0);
		sb.append("SELECT planno, title, regdate, period ");
		sb.append("FROM plan WHERE userid = ? ");
		PlanVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int planNo = rs.getInt("planno");
				String title = rs.getString("title");
				String regdate = rs.getString("regdate");
				int period = rs.getInt("period");
				vo = new PlanVO(planNo, title, regdate, period, userId);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
