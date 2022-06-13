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

import dao.CharaDao;
import dao.DayDao;
import dao.MissionDao;
import dao.UserDao;
import model.Day;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
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

			final int loginPoint=3; //ログボでもらえるポイント

			int nowPoint;

			MissionDao mDao=new MissionDao();
			CharaDao cDao=new CharaDao();
			UserDao uDao=new UserDao();
			DayDao ddao=new DayDao();

	//ここからTポイント処理
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
			Day day1=ddao.select(new Day()); //古いデータ
			Day day2=new Day(); //新しいデータ

			String nowDate=sdf.format(new Date());
			day2.setDate(nowDate);

			if(!(day1.getDate().equals(day2.getDate()))){ //日付が違ったら
				boolean result=ddao.dateInsert(nowDate);
				System.out.println(result);
				nowPoint=uDao.updateTpoint(loginPoint);
				System.out.println("Tpoint="+nowPoint); //デバッグ用 変更後のTポイント
			}else{
				nowPoint=uDao.updateTpoint(0);
				System.out.println("TPOINT="+nowPoint);
			}

	//ここからミッション処理
	//		List<Mission> missionList =new ArrayList<Mission>();
	//		missionList=mDao.select(new Mission()); //ミッション三つ これを渡す

	//ここからキャラクター関係の処理
	//		int charId=uDao.char_id();
	//		Chara growing=cDao.inf(charId);//育成中のキャラクター

	//この辺でデータをスコープに入れる
			request.setAttribute("Tpoint",nowPoint);
	//		request.setAttribute("mission",missionList);
	//		request.setAttribute("growing", growing);


	//フォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/nakao/LoginServlet");
			return;
		}


	}

}
