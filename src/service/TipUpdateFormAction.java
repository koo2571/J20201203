package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.TipBoardDao;

public class TipUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				String id = request.getParameter("id");
				int bd_num = Integer.parseInt(request.getParameter("bd_num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				TipBoardDao tbd = TipBoardDao.getInstance();
				Board board = tbd.select(bd_num); 
				request.setAttribute("id", id);
				request.setAttribute("bd_num", bd_num);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("board", board);
			} catch (Exception e) {
				System.out.println("TipUpdateAction Exception->"+e.getMessage());
			}
		return "tipboard/tipUpdate.jsp";
	}

}
