package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDao {

	public boolean isLoginOK(User user) {
		Connection conn = null;
		boolean loginResult = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "select count(*) from user where user_id = ? and user_pass = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, user.getUser_id());
			pStmt.setString(2,user.getUser_pass());

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}




	public int tpoint() {
		List<Integer> point = new ArrayList<Integer>();

		Connection conn = null;
		int nana = 0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "select point from user";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				int a= rs.getInt("point");
				point.add(a);
			}
		nana = point.get(0);
		}
		catch (SQLException e) {
			e.printStackTrace();
			nana = 0;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			nana = 0;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				 nana = 0;
				}
			}
		}

		// 結果を返す
		return nana;

	}

	
	//char_idを取得する
	public int char_id() {

		List<Integer> char_id = new ArrayList<Integer>();

		Connection conn = null;
		int nana = 0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "select char_id from user";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				int a= rs.getInt("char_id");
				char_id.add(a);
			}
		nana = char_id.get(0);
		}
		catch (SQLException e) {
			e.printStackTrace();
			nana = 0;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			nana = 0;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				 nana = 0;
				}
			}
		}

		// 結果を返す
		return nana;


	}
	public int updateTpoint(int num) { //tポイント変更

		//引数の数だけポイントを増減します
		//返り値は現在のポイント
		//ポイントを減らしたい時はマイナス値を設定する

		Connection conn = null;
		int nana = 0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "update user set point=point+? where user_id=1";//user_idは任意の値にしてください(auto_incrementはずれることがあります)
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, num);

			if (pStmt.executeUpdate() == 1) {
				 nana=tpoint();
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
		return nana;

	}
	public boolean updateChara(int num) { //キャラクター変更 更新できたかどうかを返す

		Connection conn = null;
		boolean nana = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "update user set char_id=? where user_id=1";//user_idは任意の値にしてください(auto_incrementはずれることがあります)
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, num);

			if (pStmt.executeUpdate() == 1) {
				 nana=true;
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
		return nana;

	}
}

