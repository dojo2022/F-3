
package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class MissionClearServlet
 */
@WebServlet("/MissionClearServlet")
public class MissionClearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection con = null;
		try {
			// データベースとの接続の確立
			Class.forName("org.h2.Driver");
			String url = "jdbc:h2:file:C:/dojo6_data/F3";
			con = DriverManager.getConnection(url, "sa", "");
			//SQL文のテンプレート作成
			String num = request.getParameter("btn");

			String sql =
					"update missionclear set cleared = true where mission_id = ?";
			//SQLインジェクション対策
			PreparedStatement prepStmt = con.prepareStatement(sql);
			//SQL文"?"の箇所に値を埋める
			prepStmt.setString(1, num);
			//DBに対しQuery実行。
			prepStmt.executeUpdate();
		}
		//DBのクローズ
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (con != null) {
				try {
					con.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
