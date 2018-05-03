package controller.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.ReservationDao;
import dto.ReservationVO;
import dto.UserVO;

public class UsageDetailsAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/views/member/usageDetails.jsp";

		HttpSession session = request.getSession(true);
		UserVO uVo = (UserVO)session.getAttribute("userInfo");

		ReservationDao rDao = ReservationDao.getInstance();
		List<ReservationVO> usageList = rDao.getUsageList(uVo.getUserCarnum());

		request.setAttribute("usageList", usageList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
