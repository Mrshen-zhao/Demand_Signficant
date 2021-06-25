package com.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connect {
	public static Connection getConn() {
		// 第一步：加载驱动类，如果有异常则抛出异常或者使用try..catch..语句处理
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("驱动类加载失败");
			// 这里可能报错：ClassNotFoundException
			// 错误原因：可能是驱动类的名称拼写错误，也可能是jar包没导入
		}

		// 第二步:获取连接对象
		String url = "jdbc:mysql://localhost:3306/zhengji?useSSL=true&serverTimezone=GMT";
		String username = "root";
		String password = "zzm666";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("连接对象获取失败");
		}
		// 返回一个连接对象
		return conn;
	}

	public static void close(Connection conn, Statement st, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (st != null) {
			try {
				st.close();
				st = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
