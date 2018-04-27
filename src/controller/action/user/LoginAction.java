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

		String url = "/user/loginCheck.jsp";
		UserDao userDAO = UserDao.getInstance();
		UserVO user = new UserVO();
		HttpSession session = request.getSession();
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");

		int result = userDAO.login(userID, userPassword);

		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		if (result == 1) {
			url = "/user/loginCheck.jsp";
			session.setAttribute("userID", userID);
			session.setAttribute("userPassword", userPassword);
		} else if (result == 0) {
			url = "/user/login.jsp";

		} else if (result == -1) {
			url = "/user/login.jsp";

		} else if (result == -2) {
			url = "/user/login.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}