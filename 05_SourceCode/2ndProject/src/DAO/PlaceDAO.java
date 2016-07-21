package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.CityVO;
import VO.PlaceVO;

public class PlaceDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	private StringBuffer sb = new StringBuffer();

	public PlaceDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<PlaceVO> selectAll() {
		ArrayList<PlaceVO> list = new ArrayList<PlaceVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM place ");
		PlaceVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int placeNo = rs.getInt("placeno");
				String placeName = rs.getString("placename");
				String img = rs.getString("img");
				String info = rs.getString("info");
				int latitude = rs.getInt("latitude");
				int longitude = rs.getInt("longitude");
				String icon = rs.getString("icon");
				String cityName = rs.getString("cityname");

				vo = new PlaceVO(placeNo, placeName, img, info, latitude, longitude, icon, cityName);
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
			String cityName = rs.getString("cityname");
			vo = new PlaceVO(placeNo, placeName, img, info, latitude, longitude, icon, cityName);
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
			pstmt.setInt(4, vo.getLatitude());
			pstmt.setInt(5, vo.getLongitude());
			pstmt.setString(6, vo.getIcon());
			pstmt.setString(7, vo.getCityName());
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
			pstmt.setInt(4, vo.getLatitude());
			pstmt.setInt(5, vo.getLongitude());
			pstmt.setString(6, vo.getIcon());
			pstmt.setString(7, vo.getCityName());
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

	public ArrayList<CityVO> selectCityAll() {
		ArrayList<CityVO> list = new ArrayList<CityVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM city ");
		CityVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cityNo = rs.getInt("cityno");
				String cityName = rs.getString("cityname");
				int latitude = rs.getInt("latitude");
				int longitude = rs.getInt("longitude");
				String info = rs.getString("info");
				String img = rs.getString("img");
				vo = new CityVO(cityNo, cityName, latitude, longitude, info, img);
				list.add(vo);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
