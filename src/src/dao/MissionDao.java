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
	public List<Mission> select(Mission param) {
		Connection conn = null;
		List<Mission> missionList = new ArrayList<Mission>();
		List<Mission> returnList = new ArrayList<Mission>();


		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6", "sa", "");

			// SQL文を準備する
			String sql = "select mission_id, sentence from mission";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ミッションを取り出して、リストに格納
			while (rs.next()) {
				Mission mission = new Mission (
					rs.getInt("MISSION_ID"),
					rs.getString("SENTENCE")
				);
				missionList.add(mission);
			}

			// ランダムで3つ取り出す
			Collections.shuffle(missionList);
			for(int i = 0; i < 3; i++){
				returnList.add(missionList.get(i));
			}

		}
		catch (SQLException e) {
			e.printStackTrace();
			returnList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			returnList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					returnList = null;
				}
			}
		}

		// 結果を返す
		return returnList;
	}
}
