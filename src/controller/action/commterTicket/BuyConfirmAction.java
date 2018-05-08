package controller.action.commterTicket;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dto.TicketVO;

public class BuyConfirmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url ="WEB-INF/views/commuteTicket/purchaseConfirm.jsp";

		String fee = request.getParameter("fee");
		String imgsrc = request.getParameter("imgsrc");
		String ticketInfo = request.getParameter("ticketInfo");

		request.setAttribute("fee", fee);
		request.setAttribute("imgsrc", imgsrc);
		request.setAttribute("ticketInfo", ticketInfo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
