package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.TipBoardDao;

public class TipContentFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNum = request.getParameter("pageNum");
		String id = request.getParameter("id");
		int bd_num = Integer.parseInt(request.getParameter("bd_num"));
		try {
			TipBoardDao bd = TipBoardDao.getInstance();
			bd.view(bd_num);  
			Board board = bd.select(bd_num);			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("id", id);
			request.setAttribute("bd_num", bd_num);
			request.setAttribute("board", board);
			
		} catch (Exception e) {
			System.out.println("requestPro exception ->"+e.getMessage());
		}

		return "tipboard/tipCont.jsp";
	}

}
