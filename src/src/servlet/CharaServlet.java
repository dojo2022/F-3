package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
			if (session.getAttribute("user") == null) {
				response.sendRedirect("/nakao/LoginServlet");
				return;
			}

			CharaDao cDao=new CharaDao();
			UserDao uDao=new UserDao();

	//ここから所持キャラクターを取り出す処理
			List<Chara> charaList=new ArrayList<Chara>();
			charaList=cDao.havingChara(); //全てのキャラクターのリスト
			System.out.println(charaList);

	//ここから育成中のキャラクターを取り出す処理
			int charId=uDao.char_id();
			Chara growing=cDao.inf(charId);//育成中のキャラクター
	//スコープに入れる

			request.setAttribute("charaList",charaList);
			request.setAttribute("growing",growing);

	//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/chara.jsp");
			dispatcher.forward(request, response);

	}

	/*
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/nakao/LoginServlet");
			return;
		}

		UserDao uDao=new UserDao();

		if (request.getParameter("SUBMIT").equals("変更")) {
			String str=request.getParameter("charId");
			int id=0;
			try{
				id=Integer.parseInt(str);
			}catch(Exception e){
				System.out.println(e);
			}
			boolean result=uDao.updateChara(id);
			System.out.println("charachange"+result);
		}else if(request.getParameter("SUBMIT").equals("戻る")){ //
			response.sendRedirect("/nakao/MainServlet");
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/chara.jsp");
		dispatcher.forward(request, response);
	}
}
//if (request.getParameter("SUBMIT").equals("更新")) {
