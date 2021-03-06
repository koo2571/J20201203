package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserInfoDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
		try {
			 
		     String id = request.getParameter("id"); 
		     String pw = request.getParameter("pw");
		     
		     UserInfoDao sbd = UserInfoDao.getInstance();
		     
		     HttpSession session = request.getSession();
		     
		     int result = sbd.selectId(id,pw);
			 if(result >0) session.setAttribute("id", id);
		     request.setAttribute("result", result);
		     
		}catch(Exception e) {
			System.out.println("LoginProAction 쪽에서 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		return "user/loginProAction.jsp";
	}

}
