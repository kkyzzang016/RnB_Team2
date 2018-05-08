package controller.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import dao.BoardDao;
import dto.BoardVO;

public class BoardListAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub

      String url = "WEB-INF/views/board/boardList.jsp";

      BoardDao bDao = BoardDao.getInstance();
      List<BoardVO> boardList = bDao.selectAllBoards();

      request.setAttribute("boardList", boardList);

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }


}