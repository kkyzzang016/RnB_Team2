package controller.action.status;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;

public class TimeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String begin ="2018-04-18 15:52:00";
		long now = System.currentTimeMillis();

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = dayTime.format(new Date(now));

		PrintWriter out = response.getWriter();

		try {
			Date endDate = dayTime.parse(nowTime);
			Date beginDate = dayTime.parse(begin);

			long statusTime = (endDate.getTime() - beginDate.getTime()) / 1000;

			out.print(statusTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			out.print("error!!");
		}
	}
}