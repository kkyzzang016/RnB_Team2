package controller.action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.UserDao;
import util.MailSending;

public class FindPassWordAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="WEB-INF/views/user/findPW.jsp";

		String userID = request.getParameter("id");
		String userEmail = request.getParameter("email");

		UserDao uDao = UserDao.getInstance();
		String result = uDao.selectUserPassWord(userID, userEmail);

		if(!result.equals("nodata")) {
			String Mail = "</head>"
					+ "<body>"
					+ "<img id=\"comp-jbwwz6wrimgimage\" alt=\"\" data-type=\"image\" "
					+ "src=\"https://static.wixstatic.com/media/d9007b_e780c56b469343fcb123f07e05d3052b~mv2.png/v1/fill/w_600,h_338,al_c,usm_0.66_1.00_0.01/d9007b_e780c56b469343fcb123f07e05d3052b~mv2.png\" "
					+ "style=\"width: 300px; height: 169px; object-fit: cover;\"><br><br>"
					+ " <h3><b>RnB_Team2 주차장 서비스 비밀번호 찾기</b></h3><br>"
					+ "	<table>"
					+ "	<tr>"
					+ "	<th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
					+ "	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
					+ " &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp비밀번호  :  </th>"
					+ " <td>"+result+"</td>"
					+ "</body>";

			MailSending mail = MailSending.getInstance();
			mail.sendMail("RnB_Team2 비밀번호 찾기", Mail, "RnB_Team2 서비스 운영팀", userEmail);
			result = "data";
		}

		request.setAttribute("result", result);
		request.setAttribute("id", userID);
		request.setAttribute("email", userEmail);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);

	}
}
