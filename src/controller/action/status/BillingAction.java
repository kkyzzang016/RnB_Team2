package controller.action.status;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dto.UserVO;
import util.MailSending;

public class BillingAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="WEB-INF/views/parking/billing.jsp";
		String floor = request.getParameter("floor");
		HttpSession session = request.getSession(true);
		UserVO uVo = (UserVO) session.getAttribute("userInfo");
		int time = Integer.parseInt(request.getParameter("time"))/60;
		int money;

		if(time<30) {
			money = 1000;
		}
		else {
			int timePerTen = (time-30)/10;
			money = 1000+(timePerTen*500);

		}
		/*MailSending mt = MailSending.getInstance();
		mt.sendMail("싱글턴", "하이루", "고객님", "kwangyong_kang@rnbsoft.com");
		String mailTitle = "시험용 메일입니다.";
		String mailContents = "메일 내용입니다.";
		String toName="강광용";
		String toEmail="kwangyong_kang@rnbsoft.com";


		mt.sendMail(mailTitle, mailContents,toName,toEmail);*/
		request.setAttribute("time", time);
		request.setAttribute("money", money);
		request.setAttribute("userInfo", uVo);
		request.setAttribute("floor", floor);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
