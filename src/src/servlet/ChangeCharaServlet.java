
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

import dao.CharaDao;
import dao.UserDao;
import model.Chara;

/**
 * Servlet implementation class ChangeCharaServlet
 */
@WebServlet("/ChangeCharaServlet")
public class ChangeCharaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CharaDao cDao=new CharaDao();
		UserDao uDao=new UserDao();

//ここから所持キャラクターを変更する処理
		int id = 0;
		try{
			System.out.println("char_id=" + request.getParameter("char_id"));
			id=Integer.parseInt(request.getParameter("char_id"));
		}catch(Exception e){
			System.out.println(e);
		}
		boolean result=uDao.updateChara(id);
		System.out.println("charachange"+result);

//ここから育成中のキャラクターを取り出す処理
		int charId=uDao.char_id();
		Chara growing=cDao.inf(charId);//育成中のキャラクター

//ここから所持キャラクターを取り出す処理
		List<Chara> charaList=new ArrayList<Chara>();
		charaList=cDao.allchara(); //全てのキャラクターのリスト
		System.out.println(charaList);

//スコープに入れる
		request.setAttribute("charaList",charaList);
		request.setAttribute("growing",growing);

//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/chara.jsp");
		dispatcher.forward(request, response);
	}
}
