package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Date;

public class DateDAO {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
	public Date select(Date param) {
		Connection conn = null;
		Date date = new Date();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");
			// SQL文を準備する
			String sql = "select datetime from date ORDER BY date_id desc limit 1";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
			rs.next();

		}

	}

}
