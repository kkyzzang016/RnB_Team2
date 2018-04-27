package controller.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.JoinDao;

public class ConfirmIdAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url="/user/confirmId.jsp";

		String userId=request.getParameter("userID");
		String id = request.getParameter("userID");
		JoinDao jDao = JoinDao.getInstance();
		String result = jDao.confirmId(userId);
		System.out.println(result);
		System.out.println(id);

		request.setAttribute("id", id);
		request.setAttribute("result", result);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);

	}

}