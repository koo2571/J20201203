package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TipBoardDao;

public class TipLikeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String id = request.getParameter("id");
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			TipBoardDao tbd = TipBoardDao.getInstance();
			tbd.like(bd_num);
			request.setAttribute("bd_num", bd_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("id", id);
		} catch (Exception e) {
			System.out.println("TipLikeAction Exception ->"+e.getMessage());
		}
		return "tipboard/tipLikePro.jsp";
	}

}
