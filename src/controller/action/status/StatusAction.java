package controller.action.status;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.ReservationDao;
import dto.UserVO;

public class StatusAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "WEB-INF/views/parking/myStatus.jsp";
		HttpSession session = request.getSession(true);
		UserVO uVo = (UserVO) session.getAttribute("userInfo");
		ReservationDao rDao = ReservationDao.getInstance();
		String floor = rDao.selectFloor(uVo.getUserCarnum());

		request.setAttribute("floor", floor);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
