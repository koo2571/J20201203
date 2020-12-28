package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TipWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bd_num = 0;
			String id = request.getParameter("id");
			String pageNum = request.getParameter("pageNum");
			System.out.println("TipWriteAction start");
			
			request.setAttribute("bd_num", bd_num);
			request.setAttribute("id", id);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "tipboard/tipWrite.jsp";
	}

}
