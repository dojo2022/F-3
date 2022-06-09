package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Chara;

public class CharaDao {

	public Chara inf(int id) {
		List<Chara> inf = new ArrayList<Chara>();

		Connection conn = null;
		Chara nana = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(/*保留*/);

			// SELECT文を準備する
			String sql = "select * from character where char_id = ? ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			if (id != 0) {
				pStmt.setInt(1, id);
			}
			else {
				pStmt.setInt(1 , 0);
			}

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Chara a= new Chara(rs.getInt("char_id"),
						(rs.getString("name")),
						(rs.getInt("Ex_point")),
						(rs.getString("file_pass")));
				inf.add(a);
			}
		nana = inf.get(0);
		}
		catch (SQLException e) {
			e.printStackTrace();
			nana = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			nana = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				 nana = null;
				}
			}
		}

		// 結果を返す
		return nana;

	}

	public List<Chara> allchara(){

		List<Chara> inf = new ArrayList<Chara>();

		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(/*保留*/);

			// SELECT文を準備する
			String sql = "select * from character";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Chara a= new Chara(rs.getInt("char_id"),
						(rs.getString("name")),
						(rs.getInt("ex_point")),
						(rs.getString("file_pass")));
				inf.add(a);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			inf = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			inf = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				 inf = null;
				}
			}
		}

		// 結果を返す
		return inf;
	}




}

