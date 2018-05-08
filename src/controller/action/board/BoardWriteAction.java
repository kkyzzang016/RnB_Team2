package controller.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.BoardDao;
import dto.BoardVO;

public class BoardWriteAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub

	  String url="WEB-INF/views/board/reBoardView.jsp";

      BoardVO bVo = new BoardVO();
      BoardDao bDao = BoardDao.getInstance();
      bVo.setUserID(request.getParameter("userID"));
      bVo.setUserEmail(request.getParameter("userEmail"));
      bVo.setPass(request.getParameter("pass"));
      bVo.setTitle(request.getParameter("title"));
      bVo.setContent(request.getParameter("content"));

      bDao.insertBoard(bVo);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }


}