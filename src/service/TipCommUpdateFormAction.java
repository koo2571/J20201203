package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comments;
import dao.CommentsDao;

public class TipCommUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int bd_num = Integer.parseInt(request.getParameter("bd_num"));
		int type_num = Integer.parseInt(request.getParameter("type_num"));
		int comm_num = Integer.parseInt(request.getParameter("comm_num"));
		String id = request.getParameter("id");
		String comm_cont = request.getParameter("comm_cont");
		System.out.println(pageNum);
		System.out.println(bd_num);
		System.out.println(type_num);
		System.out.println(comm_num);
		System.out.println(id);
		System.out.println("너새끼지?"+comm_cont);
		CommentsDao cd = CommentsDao.getInstance();
		Comments comments = cd.select(type_num,comm_num,id); 	
		request.setAttribute("comments", comments);
		request.setAttribute("id", id);
		request.setAttribute("bd_num", bd_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("comm_cont", comm_cont);
		}catch (Exception e) {
			System.out.println("TipCommUpdateAction Exception->"+e.getMessage());
		}
		return "tipboard/tipCommUpdate.jsp";
	}

}
