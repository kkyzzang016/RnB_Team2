package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MailSending;

public class BillingAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/parking/billing.jsp";

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

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
