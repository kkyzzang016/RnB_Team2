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
		System.out.println(hexCode);

		mail.sendMail("RnB_Team2 결제 인증코드", hexCode, "RnB_Team2 서비스 운영팀", toUserMail);

		out.print("<input type=\"text\" name=\"code\"> <br>"
				+ "<input type=\"hidden\" name=\"codeValue\" value=\""+ hexCode+ "\"> <br>"
				+ "<input type=\"submit\" class=\"w3-button w3-blue gray w3-padding-large w3-hover-black\" onclick=\"goComplete()\" value=\"Complete\">");
	}
}
