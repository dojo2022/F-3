
package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Chara;

public class CharaDao {

	public Chara inf(int id) {//現在育成中のキャラクターを取得

		Connection conn = null;
		Chara nana = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "select * from character left join charadata on character.char_id = charadata.char_id where character.char_id = ?;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			System.out.println("id=" + id);
			if (id != 0) {
				pStmt.setInt(1, id);
			}
			else {
				pStmt.setInt(1 , 0);
			}

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			rs.next();
			Chara a = new Chara(rs.getInt("char_id"),
						(rs.getString("name")),
						(rs.getInt("Ex_point")),
						(rs.getString("eggimg")),
						(rs.getString("charaimg1")),
						(rs.getString("charaimg2")),
						(rs.getString("charaimg3")),
						(rs.getString("charaimg4")));

			System.out.println(a);
		nana = a;
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

	public List<Chara> allchara(){//全てのキャラクターを取得

		List<Chara> inf = new ArrayList<Chara>();

		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "select * from character left join charadata on character.char_id = charadata.char_id;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Chara a = new Chara(rs.getInt("char_id"),
						(rs.getString("name")),
						(rs.getInt("Ex_point")),
						(rs.getString("eggimg")),
						(rs.getString("charaimg1")),
						(rs.getString("charaimg2")),
						(rs.getString("charaimg3")),
						(rs.getString("charaimg4")));
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

//経験値を更新するメソッドを作る
	public boolean updateExp(int num,int id) { //


		Connection conn = null;
		boolean nana = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String sql = "update character set ex_point=? where char_id=?";//char_idは任意の値にしてください(auto_incrementはずれることがあります)
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, num);
			if(id!=0){
				pStmt.setInt(2, id);
			}else{
				pStmt.setInt(2, 0);
			}

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

	//キャラを追加するメソッド
	public boolean insertChara() { //

		List<Chara> inf = new ArrayList<Chara>();
		Connection conn = null;
		boolean nana = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/F3", "sa", "");

			// SELECT文を準備する
			String select_sql = "select * from charadata left join character on character.char_id = charadata.char_id where have_flag = false";
			PreparedStatement pStmt = conn.prepareStatement(select_sql);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Chara a = new Chara(rs.getInt("char_id"),
						(rs.getString("name")),
						(rs.getInt("Ex_point")),
						(rs.getString("eggimg")),
						(rs.getString("charaimg1")),
						(rs.getString("charaimg2")),
						(rs.getString("charaimg3")),
						(rs.getString("charaimg4")));
				inf.add(a);
			}

			// シャッフルする
			Collections.shuffle(inf);

			//characterテーブルに保存する
			String insert_sql = "insert into character (char_id, ex_point) values (?, 0)";
			pStmt = conn.prepareStatement(insert_sql);

			if(!inf.isEmpty())
			{
				pStmt.setInt(1, inf.get(0).getChar_id());

				if (pStmt.executeUpdate() == 1) {
					//追加したキャラのhave_flagをtrueにする
					String update_sql = "update charadata set have_flag = true where char_id = ?";
					pStmt = conn.prepareStatement(update_sql);

					pStmt.setInt(1, inf.get(0).getChar_id());
					if(pStmt.executeUpdate() == 1)
					{
						nana=true;
					}
				}
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

