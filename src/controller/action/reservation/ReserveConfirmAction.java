package controller.action.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dto.ReservationVO;
import dao.ParkingDao;
import dao.ReservationDao;
public class ReserveConfirmAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "/reservation/reserveConfirm.jsp";


      //예약 조회

      ReservationDao rDao =ReservationDao.getInstance();
      ReservationVO floor1 = rDao.rselectone("587557");


      request.setAttribute("res1", floor1);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}