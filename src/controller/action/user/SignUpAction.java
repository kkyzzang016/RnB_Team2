package controller.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.UserDao;
import dto.UserVO;

public class SignUpAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/views/user/signUpComplete.jsp";

		UserVO uVo = new UserVO();
		uVo.setUserID(request.getParameter("userID"));
		uVo.setUserPassword(request.getParameter("userPassword"));
		uVo.setUserName(request.getParameter("userName"));
		uVo.setUserEmail(request.getParameter("userEmail"));
		uVo.setUserCarnum(request.getParameter("userCarnum"));
		uVo.setUserPhone(request.getParameter("userPhone"));
		UserDao uDao = UserDao.getInstance();
		uDao.addUser(uVo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
