package controller.action.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dto.ReservationVO;
import dto.UserVO;
import dao.ParkingDao;
import dao.ReservationDao;
public class ReserveConfirmAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "WEB-INF/views/reservation/reserveConfirm.jsp";

      HttpSession session = request.getSession(true);
      UserVO uVo = (UserVO) session.getAttribute("userInfo");

      if(uVo==null) {
    	  request.setAttribute("message", "xxxx");
      }
      else {
    	  ReservationDao rDao = ReservationDao.getInstance();

          ReservationVO rVo = rDao.rselectone(uVo.getUserCarnum());

          request.setAttribute("reserveInfo", rVo);
          request.setAttribute("userName", uVo.getUserName());
          if(uVo.getUserName()==null || rVo.getUserCarnum()==null) {
          request.setAttribute("message", "xxxx");
          }
      }


      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}