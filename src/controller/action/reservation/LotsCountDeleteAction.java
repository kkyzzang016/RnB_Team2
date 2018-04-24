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

public class LotsCountDeleteAction implements Action{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String url = "/reservation/confirm.jsp";

      String floor="f1";
      String n_car="5885889";
      /*if (session != null) {
         ReservationVO uvo = (ReservationVO)session.getAttribute("uvo");
         id=uvo.getN_car();
      }*/
       ParkingVO vo1 = new ParkingVO();
      ReservationVO vo = new ReservationVO();
      vo.setUserCarnum(n_car);
      vo1.setFloor(floor);
      ReservationDao rDAO =ReservationDao.getInstance();
       ParkingDao pcDao = ParkingDao.getInstance();
       int cnt2 = pcDao.mSpare(vo1);
       int cnt = rDAO.rdelete(vo);


      request.setAttribute("dcnt", cnt);
       request.setAttribute("icnt", cnt2);
       request.setAttribute("den_car", n_car);
      RequestDispatcher dispatcher =request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}