/*package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.ReservationVO;
import test.ReservationDao;
public class InsertAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "/confirm.jsp";

      String floor=request.getParameter("floor");
      String n_car="5875f7";
      String i_car_t=request.getParameter("i_car_t");
      System.out.println("값 :"+floor);

      System.out.println("값 :"+i_car_t);

      ReservationVO vo =new ReservationVO();
      vo.setFloor(floor);
      vo.setN_car(n_car);
      vo.setI_car_t(i_car_t);

      ReservationDao rDAO = ReservationDao.getInstance();

         int cnt = rDAO.pinsert(vo);
         request.setAttribute("rcnt", cnt);
      request.setAttribute("refloor", floor);
      request.setAttribute("ren_car", n_car);
      request.setAttribute("rei_car_t", i_car_t);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}*/
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