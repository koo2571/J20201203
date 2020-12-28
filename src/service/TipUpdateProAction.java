package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.TipBoardDao;

public class TipUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String id = request.getParameter("id");
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String bd_title = request.getParameter("bd_title");
			String bd_cont = request.getParameter("bd_cont");
			Board board = new Board();
			board.setBd_title(bd_title);
			board.setBd_cont(bd_cont);
			board.setBd_num(bd_num);
			TipBoardDao tbd = TipBoardDao.getInstance();
			int result = tbd.update(board);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("id", id);
			request.setAttribute("result", result);
			request.setAttribute("bd_num", bd_num);
		} catch (Exception e) {
			System.out.println("TipUpdateProAction Exception->"+e.getMessage());
		}
		return "tipboard/tipUpdatePro.jsp";
	}

}
