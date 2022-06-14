package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CharaDao;
import dao.UserDao;

/**
 * Servlet implementation class ResultServlet
 */
@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
			HttpSession session = request.getSession();
			if (session.getAttribute("user") == null) {
				response.sendRedirect("/nakao/LoginServlet");
				return;
			}


			CharaDao cDao=new CharaDao();
			UserDao uDao=new UserDao();

	//経験値を保存する
			String str=request.getParameter("EX");
			int exp=0;
			try{
				exp=Integer.parseInt(str);
			}catch(Exception e){
				System.out.println("exp="+str);
			}
			cDao.updateExp(exp,uDao.char_id()); //経験値を保存

//スコープに入れる
			request.setAttribute("resultChara", cDao.inf(uDao.char_id()));

	//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
			dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.invalidate();

		// ログインページにリダイレクトする
		response.sendRedirect("/nakao/MainServlet");

	}
}
