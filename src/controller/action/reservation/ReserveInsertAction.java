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

import controller.action.Action;
import dao.ParkingDao;
import dto.ParkingVO;
import dao.ReservationDao;
import dto.ReservationVO;
public class ReserveInsertAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "/reservation/confirm.jsp";

      String floor=request.getParameter("floor");
      String n_car="5885889";
      String i_car_t=request.getParameter("i_car_t");

        ParkingVO vo1 = new ParkingVO();
      ReservationVO vo = new ReservationVO();
      vo.setFloor(floor);
      vo.setUserCarnum(n_car);
      vo.setI_car_t(i_car_t);
      vo1.setFloor(floor);
      ReservationDao rDAO = ReservationDao.getInstance();
       ParkingDao pcDao = ParkingDao.getInstance();
         int cnt = rDAO.pinsert(vo);
         int cnt2 = pcDao.pSpare(vo1);
         request.setAttribute("rcnt", cnt);
         request.setAttribute("icnt", cnt2);
      request.setAttribute("refloor", floor);
      request.setAttribute("ren_car", n_car);
      request.setAttribute("rei_car_t", i_car_t);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}