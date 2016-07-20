package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.PlanDetailVO;

public class PlanDetailDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	private StringBuffer sb = new StringBuffer();

	public PlanDetailDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<PlanDetailVO> selectAll() {
		ArrayList<PlanDetailVO> list = new ArrayList<PlanDetailVO>();
		sb.setLength(0);
		sb.append("SELECT * from plandetail ");
		PlanDetailVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int plandetailNo = rs.getInt("plandetailno");
				int planOrder = rs.getInt("planorder");
				int day = rs.getInt("day");
				String moveTime = rs.getString("movetime");
				String planComment = rs.getString("plancomment");
				int planNo = rs.getInt("planno");
				int placeNo = rs.getInt("placeno");
				vo = new PlanDetailVO(plandetailNo, planOrder, day, moveTime, planComment, planNo, placeNo);
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public PlanDetailVO selectOne(int plandetailNo) {
		sb.setLength(0);
		sb.append("SELECT planorder, day, movetime, plancomment, planno, placeno");
		sb.append("WHERE plandetailno = ? ");
		PlanDetailVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, plandetailNo);
			rs = pstmt.executeQuery();
			rs.next();
			int planOrder = rs.getInt("planorder");
			int day = rs.getInt("day");
			String moveTime = rs.getString("movetime");
			String planComment = rs.getString("plancomment");
			int planNo = rs.getInt("planno");
			int placeNo = rs.getInt("placeno");
			vo = new PlanDetailVO(plandetailNo, planOrder, day, moveTime, planComment, planNo, placeNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOnt(PlanDetailVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO plandetail ");
		sb.append("VALUES(plandetail_plandetailno_seq.NEXTVAL, ");
		sb.append("?, ?, ?, ?, ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPlanOrder());
			pstmt.setInt(2, vo.getDay());
			pstmt.setString(3, vo.getMoveTime());
			pstmt.setString(4, vo.getPlanComment());
			pstmt.setInt(5, vo.getPlanNo());
			pstmt.setInt(6, vo.getPlaceNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(int plandetailNo) {
		sb.setLength(0);
		sb.append("DELETE placedetail ");
		sb.append("WHERE plandetailno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, plandetailNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(PlanDetailVO vo) {
		sb.setLength(0);
		sb.append("UPDATE placedetail ");
		sb.append("SET planorder = ?, day = ?, movetime = ?, ");
		sb.append("plancomment = ?, planno = ?, placeno = ? ");
		sb.append("WHERE plandetailno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPlanOrder());
			pstmt.setInt(2, vo.getDay());
			pstmt.setString(3, vo.getMoveTime());
			pstmt.setString(4, vo.getPlanComment());
			pstmt.setInt(5, vo.getPlanNo());
			pstmt.setInt(6, vo.getPlaceNo());
			pstmt.setInt(7, vo.getPlandetailNo());
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
