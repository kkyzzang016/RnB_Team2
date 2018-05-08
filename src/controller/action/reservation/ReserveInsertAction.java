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
import dao.ReservationDao;
import dto.ReservationVO;
import dto.UserVO;
public class ReserveInsertAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "WEB-INF/views/reservation/reserveConfirm.jsp";

      HttpSession session = request.getSession(true);
      UserVO uVo = (UserVO) session.getAttribute("userInfo");

      String floor=request.getParameter("floor");
      String userCarnum=uVo.getUserCarnum();
      String i_car_t=request.getParameter("i_car_t");

      ReservationVO rVo = new ReservationVO();
      rVo.setFloor(floor);
      rVo.setUserCarnum(userCarnum);
      rVo.setI_car_t(i_car_t);
      ReservationDao rDao = ReservationDao.getInstance();
      ParkingDao pDao = ParkingDao.getInstance();

      rDao.reservationInsert(rVo);
      pDao.pSpare(floor);

      request.setAttribute("reserveInfo", rVo);
      request.setAttribute("userName", uVo.getUserName());

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}