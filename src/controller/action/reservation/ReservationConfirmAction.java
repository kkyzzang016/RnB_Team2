package controller.action.reservation;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.ParkingDao;
import dto.ParkingVO;
import dao.ReservationDao;
import dto.ReservationVO;

public class ReservationConfirmAction implements Action{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  String url = "WEB-INF/views/reservation/reserveConfirm.jsp";

      String userCarnum = request.getParameter("userCarnum");

      long now = System.currentTimeMillis();

	  SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  String o_car_t = dayTime.format(new Date(now));

      String floor = request.getParameter("floor");
      ReservationDao rDao =ReservationDao.getInstance();
      ParkingDao pDao = ParkingDao.getInstance();
      pDao.mSpare(floor);
      rDao.updateReserveCancel(userCarnum, o_car_t);

      request.setAttribute("message", "xxxx");
      RequestDispatcher dispatcher =request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}