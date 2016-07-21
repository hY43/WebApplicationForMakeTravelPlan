package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.CityVO;

public class CityDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	private StringBuffer sb = new StringBuffer();

	public CityDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<CityVO> selectAll() {
		ArrayList<CityVO> list = new ArrayList<CityVO>();
		sb.append("SELECT * FROM city ");
		CityVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cityno = rs.getInt("cityno");
				String cityName = rs.getString("cityname");
				float latitude = rs.getFloat("latitude");
				float longitude = rs.getFloat("longitude");
				String info = rs.getString("info");
				String img = rs.getString("img");
				vo = new CityVO(cityno, cityName, latitude, longitude, info, img);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public CityVO selectOne(String cityName) {
		sb.setLength(0);
		sb.append("SELECT latitude, longitue, info, img ");
		sb.append("FROM city ");
		sb.append("WHERE cityname = ? ");
		CityVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, cityName);
			rs = pstmt.executeQuery();
			rs.next();
			int cityno = rs.getInt("cityno");
			int latitude = rs.getInt("latitude");
			int longitude = rs.getInt("longitude");
			String info = rs.getString("info");
			String img = rs.getString("img");
			vo = new CityVO(cityno, cityName, latitude, longitude, info, img);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(CityVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO city ");
		sb.append("VALUES( ?, ?, ?, ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getCityName());
			pstmt.setFloat(2, vo.getLatitude());
			pstmt.setFloat(3, vo.getLongitude());
			pstmt.setString(4, vo.getInfo());
			pstmt.setString(5, vo.getImg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(String cityName) {
		sb.setLength(0);
		sb.append("DELETE city ");
		sb.append("WHERE cityName = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, cityName);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateOne(CityVO vo) {
		sb.setLength(0);
		sb.append("UPDATE city ");
		sb.append("SET latitude = ?, longitude = ?, info = ?, img = ? ");
		sb.append("WHERE cityname = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setFloat(1, vo.getLatitude());
			pstmt.setFloat(2, vo.getLongitude());
			pstmt.setString(3, vo.getInfo());
			pstmt.setString(4, vo.getImg());
			pstmt.setString(5, vo.getCityName());
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
