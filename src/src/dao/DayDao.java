
package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Day;

public class DayDao {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
	public Day select(Day day) {
		Connection conn = null;
		//day = new Day();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SQL文を準備する
			String sql = "select datetime from date ORDER BY date_id desc limit 1";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			//
			rs.next();
			day.setDate(rs.getString("DATETIME"));
		}
		catch (SQLException e) {
			e.printStackTrace();
			day = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			day = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					day = null;
				}
			}
		}

		// 結果を返す
		return day;
	}
	//日付insertくんを作ろう
	public boolean dateInsert(String date) {
		Connection conn = null;
		boolean insertResult = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// insert文を準備する
			String sql = "insert into date (datetime) values(?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, date);

			// insert文を実行し、結果表を取得する
			int rs = pStmt.executeUpdate();

			if (rs == 1) {
				insertResult = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return insertResult;
	}
}