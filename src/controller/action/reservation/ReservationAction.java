package controller.action.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.ParkingDao;
import dto.ParkingVO;
import dto.UserVO;

public class ReservationAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "WEB-INF/views/reservation/reservation.jsp";

      HttpSession session = request.getSession(true);
      ParkingDao pDao = ParkingDao.getInstance();
      String result=null;
      if(session.getAttribute("userInfo")!=null) {
      UserVO uVo = (UserVO) session.getAttribute("userInfo");
      result = pDao.userReserveInfo(uVo.getUserCarnum());
      request.setAttribute("result", result);
      }
      else {
    	  request.setAttribute("result", null);
      }
      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}