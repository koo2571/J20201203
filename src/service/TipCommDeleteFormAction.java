package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TipCommDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int bd_num = Integer.parseInt(request.getParameter("bd_num"));
		int type_num = Integer.parseInt(request.getParameter("type_num"));
		int comm_num = Integer.parseInt(request.getParameter("comm_num"));
		String id = request.getParameter("id");
		String comm_id = request.getParameter("comm_id");
		int commPageNum = Integer.parseInt(request.getParameter("commPageNum"));
		
		request.setAttribute("id", id); 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("commPageNum", commPageNum);
		request.setAttribute("type_num", type_num);
		request.setAttribute("comm_id", comm_id);
		request.setAttribute("comm_num", comm_num);
		request.setAttribute("bd_num", bd_num);
		System.out.println("id "+id);
		System.out.println("pagenum " + pageNum);
		System.out.println("commpagenum "+commPageNum);
		System.out.println("type_num "+ type_num);
		System.out.println("comm_id "+comm_id);
		System.out.println("comm_num "+comm_num);
		System.out.println("bd_num "+bd_num);
		
		return "tipboard/tipCommDelete.jsp";
	}

}
