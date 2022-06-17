package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Mission;

public class MissionDao {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
	public List<Mission> select() {
		Connection conn = null;
		List<Mission> missionList = new ArrayList<Mission>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SQL文を準備する
			String sql = "select * from mission";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ミッションを取り出して、リストに格納
			while (rs.next()) {
				Mission mission = new Mission (
					rs.getInt("MISSION_ID"),
					rs.getString("SENTENCE"),
					false
				);
				missionList.add(mission);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			missionList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			missionList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					missionList = null;
				}
			}
		}

		// 結果を返す
		return missionList;
	}

	public void todayMission(List<Mission> missionList){
		Connection conn = null;
		List<Mission> returnList = new ArrayList<Mission>();
		try {
			// ランダムで3つ取り出す
			Collections.shuffle(missionList);
			for(int i = 0; i < 3; i++){
				returnList.add(missionList.get(i));
			}

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SQL文を準備する
			for(int i = 0; i < 3; i++) {
			String sql = "update missionclear set sentence = ?, cleared = ? where mission_id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, returnList.get(i).getMission());
			pStmt.setBoolean(2, false);
			pStmt.setInt(3, (i + 1));
			pStmt.executeUpdate();
			}
		}
		catch (SQLException e) {
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

	}

	public List<Mission> returnMission() {
		Connection conn = null;
		List<Mission> returnList = new ArrayList<Mission>();
		try {
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SQL文を準備する
			String sql = "select * from missionclear";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ミッションを取り出して、リストに格納
			while (rs.next()) {
				Mission mission = new Mission (
					rs.getInt("MISSION_ID"),
					rs.getString("SENTENCE"),
					rs.getBoolean("CLEARED")
				);
				returnList.add(mission);
			}
		}
		catch (SQLException e) {
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
		return returnList;
	}
}
