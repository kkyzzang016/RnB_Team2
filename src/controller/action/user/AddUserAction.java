package controller.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.JoinDao;
import dto.UserVO;

public class AddUserAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/user/signUpComplete.jsp";

		UserVO uVo = new UserVO();
		uVo.setUserID(request.getParameter("userID"));
		uVo.setUserPassword(request.getParameter("userPassword"));
		uVo.setUserName(request.getParameter("userName"));
		uVo.setUserEmail(request.getParameter("userEmail"));
		uVo.setUserCarnum(request.getParameter("userCarnum"));
		uVo.setUserPhone(request.getParameter("userPhone"));
		JoinDao jDao = JoinDao.getInstance();
		jDao.addUser(uVo);


		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
