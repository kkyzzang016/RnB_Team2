package controller.action.commterTicket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dto.UserVO;
import util.MailSending;

public class PayCertificateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		UserVO currentUser = (UserVO) session.getAttribute("userInfo");
		String toUserMail = currentUser.getUserEmail();
		PrintWriter out = response.getWriter();
		MailSending mail = MailSending.getInstance();
		int rancomCode = (int)(Math.random()*100000)+1;
		String hexCode = Integer.toHexString(rancomCode);

		String codingMail = "</head>"
						+ "<body>"
						+ "<img id=\"comp-jbwwz6wrimgimage\" alt=\"\" data-type=\"image\" "
						+ "src=\"https://static.wixstatic.com/media/d9007b_e780c56b469343fcb123f07e05d3052b~mv2.png/v1/fill/w_600,h_338,al_c,usm_0.66_1.00_0.01/d9007b_e780c56b469343fcb123f07e05d3052b~mv2.png\" "
						+ "style=\"width: 300px; height: 169px; object-fit: cover;\"><br><br>"
						+ " <h3><b>RnB_Team2 주차장 서비스 결제코드</b></h3><br>"
						+ "	<table>"
						+ "	<tr>"
						+ "	<th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
						+ "	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
						+ " &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp인증코드  :  </th>"
						+ " <td>"+hexCode+"</td>"
						+ "</body>";

		mail.sendMail("RnB_Team2 결제 인증코드", codingMail, "RnB_Team2 서비스 운영팀", toUserMail);
		out.print("<input type=\"text\" name=\"code\"> <br>"
				+ "<input type=\"hidden\" name=\"codeValue\" value=\""+ hexCode+ "\"> <br>"
				+ "<input type=\"submit\" class=\"w3-button w3-blue gray w3-padding-large w3-hover-black\" onclick=\"goComplete()\" value=\"Complete\">");
	}
}
