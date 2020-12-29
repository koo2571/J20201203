package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TipDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bd_num = Integer.parseInt(request.getParameter("bd_num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		request.setAttribute("bd_num", bd_num);
		request.setAttribute("pageNum", pageNum);
		return "tipboard/tipDelete.jsp";
	}

}
