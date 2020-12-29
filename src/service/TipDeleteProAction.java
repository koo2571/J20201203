package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TipBoardDao;

public class TipDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			TipBoardDao tbd = TipBoardDao.getInstance();
			int result = tbd.delete(bd_num);
			request.setAttribute("bd_num", bd_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println("TipDeleteProAction Exception->"+e.getMessage());
		}
		return "tipboard/tipDeletePro.jsp";
	}

}
