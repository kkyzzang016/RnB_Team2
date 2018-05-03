package controller.action.contact;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import util.MailSending;

public class ContactAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="index.jsp";

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		String emailPlusName = name+" ("+email+")";

		MailSending mt = MailSending.getInstance();
		mt.sendMail("문의사항", message,emailPlusName,"kwangyong_kang@rnbsoft.com");

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
