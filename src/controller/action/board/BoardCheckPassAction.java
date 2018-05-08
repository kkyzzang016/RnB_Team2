package controller.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.BoardDao;
import dto.BoardVO;

public class BoardCheckPassAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub


      String url=null;
      String num = request.getParameter("num");
      String pass = request.getParameter("pass");

      BoardVO bVo=BoardDao.getInstance().selectOneBoardByNum(num);

      if(bVo.getPass().equals(pass)) {
         url="WEB-INF/views/board/checkSuccess.jsp";
      }else {
         url = "WEB-INF/views/board/boardCheckPass.jsp";
         request.setAttribute("message", "비밀번호가 틀렸습니다.");
      }

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }



}