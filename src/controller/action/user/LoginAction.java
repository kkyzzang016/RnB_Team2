package controller.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.UserDao;
import dto.UserVO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "WEB-INF/views/user/loginCheck.jsp";
		UserDao userDAO = UserDao.getInstance();
		UserVO user = new UserVO();
		HttpSession session = request.getSession();
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");

		int result = userDAO.login(userID, userPassword);

		if (result == 1) {
			url = "/user/loginCheck.jsp";
			user = userDAO.getUserInfo(userID, userPassword);
			session.setAttribute("userInfo", user);
		} else if (result == 0) {
			url = "/user/login.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");

		} else if (result == -1) {
			url = "/user/login.jsp";
			request.setAttribute("message", "ID가 존재하지 않습니다.");

		} else if (result == -2) {
			url = "/user/login.jsp";
			request.setAttribute("message", "시스템 오류입니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}