
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
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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

			//卵を追加する
			if(cDao.insertChara())
			{
				System.out.println("購入成功");

				//Tポイントを減らす
				System.out.println(uDao.updateTpoint(-5));

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/buy.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				request.setAttribute("cant_buy", false);
				System.out.println("購入失敗");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/buy.jsp");
				dispatcher.forward(request, response);
			}
	}
}
