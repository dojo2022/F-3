package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CharaDao;
import dao.UserDao;
import model.Chara;

/**
 * Servlet implementation class CharaServlet
 */
@WebServlet("/CharaServlet")
public class CharaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
			HttpSession session = request.getSession();
			if (session.getAttribute("id") == null) {
				response.sendRedirect("/nakao/LoginServlet");
				return;
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/nakao/LoginServlet");
			return;
		}

		CharaDao cDao=new CharaDao();
		UserDao uDao=new UserDao();

//ここから全キャラクターを取り出す処理
		List<Chara> charaList=new ArrayList<Chara>();
		charaList=cDao.allchara(); //全てのキャラクターのリスト

//ここから育成中のキャラクターを取り出す処理
		int charId=uDao.char_id();
		Chara growing=cDao.inf(charId);//育成中のキャラクター

	}
}
