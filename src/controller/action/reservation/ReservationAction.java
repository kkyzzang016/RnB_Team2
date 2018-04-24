package controller.action.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.ParkingDao;
import dto.ParkingVO;

public class ReservationAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "/reservation/reservation.jsp";

      ParkingDao pDao = ParkingDao.getInstance();
      ParkingVO floor1 = pDao.fselect("f1");
      ParkingVO floor2 = pDao.fselect("f2");
      ParkingVO floor3 = pDao.fselect("f3");

      request.setAttribute("park1", floor1);
      request.setAttribute("park2", floor2);
      request.setAttribute("park3", floor3);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}