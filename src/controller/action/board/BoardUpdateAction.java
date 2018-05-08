package controller.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.BoardDao;
import dto.BoardVO;

public class BoardUpdateAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub

	  String url = "WEB-INF/views/board/reBoardView.jsp";

      BoardVO bVo = new BoardVO();

      bVo.setNum(Integer.parseInt(request.getParameter("num")));
      bVo.setUserID(request.getParameter("userID"));
      bVo.setPass(request.getParameter("pass"));
      bVo.setUserEmail(request.getParameter("userEmail"));
      bVo.setTitle(request.getParameter("title"));
      bVo.setContent(request.getParameter("content"));
      BoardDao bDao = BoardDao.getInstance();
      bDao.updateBoard(bVo);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }


}