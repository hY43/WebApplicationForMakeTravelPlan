package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MakeConnection {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.42:1521:orcl";
	private String user = "scott";
	private String password = "tiger";
	private Connection conn;

	private static MakeConnection mc = new MakeConnection();

	private MakeConnection() {

	}

	public static MakeConnection getInstance() {
		return mc;
	}

	public Connection getConnection() {
		if (conn == null) {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				System.out.println("driver 로딩 실패");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("db 연동 실패");
				e.printStackTrace();
			}

		}
		return conn;
	}
}
