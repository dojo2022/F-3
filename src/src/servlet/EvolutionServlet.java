package servlet;

import java.io.IOException;

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
 * Servlet implementation class EvolutionServlet
 */
@WebServlet("/EvolutionServlet")
public class EvolutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/nakao/LoginServlet");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/nakao/LoginServlet");
			return;
		}

		CharaDao cDao=new CharaDao();
		UserDao uDao=new UserDao();

	//現在のキャラ情報
		int charId=uDao.char_id();
		Chara growing=cDao.inf(charId);//育成中のキャラクター
	}

}
