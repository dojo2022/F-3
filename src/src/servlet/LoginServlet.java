package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DayDao;
import dao.UserDao;
import model.Day;
import model.User;

//なかおっち
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
			return;
		}

		DayDao ddao=new DayDao();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		Day day1=ddao.select(new Day()); //古いデータ
		Day day2=new Day(); //新しいデータ
System.out.println(day1+","+day2);
		String nowDate=sdf.format(new Date());
		day2.setDate(nowDate);

		if(day1.getDate().equals(day2.getDate())){//同じなら
			response.sendRedirect("/nakao/MainServlet");
		}else{//違ったら

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				boolean piyo=true;
				String name = request.getParameter("user_name");
				String pw = request.getParameter("user_pass");//jsp側の人々と連携
				int id = 1;//userは増やさないから1固定

				// ログイン処理を行う
				UserDao uDao = new UserDao();
				User user=new User(id,name,pw,0,0);
				if (uDao.isLoginOK(user)) {	// ログイン成功
					// セッションスコープにIDを格納する
					HttpSession session = request.getSession();
					session.setAttribute("user", user); //何らかの処理(後で訊く)
					System.out.println("ログイン成功");
					// メニューサーブレットにリダイレクトする
					response.sendRedirect("/nakao/MainServlet"); //パスは適当なので間違ってたら直してください

				}
				else {						// ログイン失敗
					piyo=false;
					request.setAttribute("flag",piyo);
					System.out.println("ログイン失敗");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
					dispatcher.forward(request, response);
				}
	}
}


