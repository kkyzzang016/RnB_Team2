package controller.action.commterTicket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;

public class PurchaseConfirmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url ="WEB-INF/views/commuteTicket/purchaseConfirm.jsp";

		String fee = request.getParameter("fee");
		String imgsrc = request.getParameter("imgsrc");

		request.setAttribute("fee", fee);
		request.setAttribute("imgsrc", imgsrc);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
