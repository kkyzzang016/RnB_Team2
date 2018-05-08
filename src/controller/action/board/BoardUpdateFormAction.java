package controller.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.BoardDao;
import dto.BoardVO;

public class BoardUpdateFormAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub

      String url = "WEB-INF/views/board/boardUpdate.jsp";
      String num =request.getParameter("num");
      BoardDao bDao = BoardDao.getInstance();
      bDao.updateReadCount(num);
      BoardVO bVo = bDao.selectOneBoardByNum(num);
      request.setAttribute("board", bVo);
      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }


}