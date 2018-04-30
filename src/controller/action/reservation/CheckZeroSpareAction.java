package controller.action.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.ParkingDao;

public class CheckZeroSpareAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		ParkingDao pDao = ParkingDao.getInstance();
	      int floor1 = pDao.floorSelect("f1");
	      int floor2 = pDao.floorSelect("f2");
	      int floor3 = pDao.floorSelect("f3");

	      String result = "{\"0\":\""+floor1+"\",\"1\":\""+floor2+"\",\"2\":\""+floor3+"\"}";
	      System.out.println(result);
	      out.print(result);
	}

}
