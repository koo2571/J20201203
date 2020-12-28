package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.TipBoardDao;

public class TipWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pageNum = request.getParameter("pageNum");
		int bd_num = Integer.parseInt(request.getParameter("bd_num"));
		int type_num = Integer.parseInt(request.getParameter("type_num"));
		try {			
			Board board = new Board();
			board.setId(id);
			board.setBd_title(request.getParameter("bd_title"));
			board.setBd_cont(request.getParameter("bd_cont"));
			board.setBd_num(bd_num);
			board.setType_num(type_num);
			TipBoardDao bd = TipBoardDao.getInstance();
			int result = bd.insert(board);
			request.setAttribute("id", board.getId());
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("bd_num", board.getBd_num());
			request.setAttribute("type_num", board.getType_num());
			System.out.println("id->"+id);
			System.out.println("result->"+result);
			System.out.println("pageNum->"+pageNum);
			System.out.println("bd_num->"+board.getBd_num());
			System.out.println("type_num->"+board.getType_num());
		} catch (Exception e) {
			System.out.println("TipWriteProAction Exception ->"+e.getMessage());
		}
		return "tipboard/tipWrirePro.jsp";
	}

}
