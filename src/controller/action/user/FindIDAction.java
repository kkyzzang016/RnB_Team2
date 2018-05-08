package controller.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.UserDao;
import util.MailSending;

public class FindIDAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="WEB-INF/views/user/findID.jsp";

		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");

		UserDao uDao = UserDao.getInstance();
		String result = uDao.selectUserID(userName, userEmail);

		if(!result.equals("nodata")) {
			String Mail = "</head>"
					+ "<body>"
					+ "<img id=\"comp-jbwwz6wrimgimage\" alt=\"\" data-type=\"image\" "
					+ "src=\"https://static.wixstatic.com/media/d9007b_e780c56b469343fcb123f07e05d3052b~mv2.png/v1/fill/w_600,h_338,al_c,usm_0.66_1.00_0.01/d9007b_e780c56b469343fcb123f07e05d3052b~mv2.png\" "
					+ "style=\"width: 300px; height: 169px; object-fit: cover;\"><br><br>"
					+ " <h3><b>RnB_Team2 주차장 서비스 아이디 찾기</b></h3><br>"
					+ "	<table>"
					+ "	<tr>"
					+ "	<th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
					+ "	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
					+ " &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp아 이 디  :  </th>"
					+ " <td>"+result+"</td>"
					+ "</body>";

			MailSending mail = MailSending.getInstance();
			mail.sendMail("RnB_Team2 아이디 찾기", Mail, "RnB_Team2 서비스 운영팀", userEmail);
			result = "data";
		}

		request.setAttribute("result", result);
		request.setAttribute("name", userName);
		request.setAttribute("email", userEmail);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);

	}
}
