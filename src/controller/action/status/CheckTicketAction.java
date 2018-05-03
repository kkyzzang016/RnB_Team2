package controller.action.status;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.UserDao;
import dto.UserVO;

public class CheckTicketAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String result=null;

		HttpSession session = request.getSession(true);
		UserVO uVo = (UserVO) session.getAttribute("userInfo");

		UserDao uDao = UserDao.getInstance();
		String [] date = uDao.checkTicket(uVo.getUserCarnum());

		long now = System.currentTimeMillis();

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd");
		String nowTime = dayTime.format(new Date(now));

		if(date[0].equals("nodata")) {
			result="noticket";
		}else {
			for(int i=0;i<2;i++) {
				//date[i]=date[i].substring(0, 10);
				date[i]=date[i].replaceAll("\\s", "");
				date[i]=date[i].replaceAll("\\:", "");
				date[i]=date[i].replaceAll("\\-", "");
				date[i]=date[i].substring(0, 8);
			}
			long startDate = Long.parseLong(date[0]);
			long endDate = Long.parseLong(date[1]);
			long nowDate = Long.parseLong(nowTime);

			if(nowDate<=endDate && nowDate>=startDate) {
				result="0";
			}else {
				System.out.println(startDate);
				System.out.println(endDate);
				System.out.println(nowDate);
				result="neednewticket";
			}
		}
		System.out.println(result);
		out.print(result);
	}
}
