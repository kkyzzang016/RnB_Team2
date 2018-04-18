package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MailSending;

public class ContactAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="reindex.jsp";

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		MailSending mt = MailSending.getInstance();
		mt.sendMail("자신에게 하고싶은말 By RnBTeam2", message,name,email);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
