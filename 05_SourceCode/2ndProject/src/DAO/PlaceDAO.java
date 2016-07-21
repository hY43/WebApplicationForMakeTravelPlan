package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.PlaceVO;

public class PlaceDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	private StringBuffer sb = new StringBuffer();

	public PlaceDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<PlaceVO> selectAll(int cityno) {
		ArrayList<PlaceVO> list = new ArrayList<PlaceVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM place ");
		sb.append("WHERE CITYNO = ? ");
		PlaceVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cityno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int placeNo = rs.getInt("placeno");
				String placeName = rs.getString("placename");
				String img = rs.getString("img");
				String info = rs.getString("info");
				float latitude = rs.getFloat("latitude");
				float longitude = rs.getFloat("longitude");
				String icon = rs.getString("icon");
				int cityNo = rs.getInt("cityno");

				vo = new PlaceVO(placeNo, placeName, img, info, latitude, longitude, icon, cityNo);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public PlaceVO selectOne(int placeNo) {
		sb.setLength(0);
		sb.append("SELECT placename, img, info, latitude, ");
		sb.append("longitude, icon, cityname ");
		sb.append("WHERE placeno = ? ");
		PlaceVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, placeNo);
			rs = pstmt.executeQuery();
			rs.next();
			String placeName = rs.getString("placename");
			String img = rs.getString("img");
			String info = rs.getString("info");
			int latitude = rs.getInt("latitude");
			int longitude = rs.getInt("longitude");
			String icon = rs.getString("icon");
			int cityNo = rs.getInt("cityno");
			vo = new PlaceVO(placeNo, placeName, img, info, latitude, longitude, icon, cityNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(PlaceVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO place ");
		sb.append("VALUES(place_placeno_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPlaceName());
			pstmt.setString(2, vo.getImg());
			pstmt.setString(3, vo.getInfo());
			pstmt.setFloat(4, vo.getLatitude());
			pstmt.setFloat(5, vo.getLongitude());
			pstmt.setString(6, vo.getIcon());
			pstmt.setInt(7, vo.getCityNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(int placeNo) {
		sb.setLength(0);
		sb.append("DELETE FROM place ");
		sb.append("WHERE placeno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, placeNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateOne(PlaceVO vo) {
		sb.setLength(0);
		sb.append("UPDATE place ");
		sb.append("SET placename = ?, img = ?, info = ?, latitude = ? ");
		sb.append("longitude = ?, icon = ?, cityname = ? ");
		sb.append("WHERE placeno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPlaceName());
			pstmt.setString(2, vo.getImg());
			pstmt.setString(3, vo.getInfo());
			pstmt.setFloat(4, vo.getLatitude());
			pstmt.setFloat(5, vo.getLongitude());
			pstmt.setString(6, vo.getIcon());
			pstmt.setInt(7, vo.getCityNo());
			pstmt.setInt(8, vo.getPlaceNo());
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
