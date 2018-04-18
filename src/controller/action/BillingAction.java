package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			money = 2000+(timePerTen*500);
		}
		request.setAttribute("time", time);
		request.setAttribute("money", money);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
