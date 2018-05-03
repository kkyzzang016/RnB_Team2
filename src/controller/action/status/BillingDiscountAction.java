package controller.action.status;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.ParkingDao;

public class BillingDiscountAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		ParkingDao pDao = ParkingDao.getInstance();

		String discountName = request.getParameter("billkey");
		System.out.println(discountName);
		String totalTime = request.getParameter("timekey");
		System.out.println(totalTime);
		int discountMinute = pDao.getDiscountInfo(discountName);
		System.out.println(discountMinute);
		int money=0;

		int discountTime = Integer.parseInt(totalTime) - discountMinute;

		if(discountTime<=0) {
			money = 0;
		}
		else if(discountTime<30&&discountTime>0) {
			money = 1000;
		}
		else {
			int timePerTen = (discountTime-30)/10;
			money = 1000+(timePerTen*500);

		}
		out.print(money);
	}
}
