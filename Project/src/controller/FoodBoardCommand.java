package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import model.memberDao;
import model.memberDto;

public class FoodBoardCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
			//DB ¿˙¿Â
//		   if(req.getMethod().equals("GET")){
//				return "/WEB-INF/views/notUrl.jsp";
//		   }
		
		
		
		if(req.getSession().getAttribute("member_id") == null){
			req.setAttribute("notLogin", "notLogin");
			return "/Main.jsp";
		}
		
		
		req.getSession().setAttribute("cmd", req.getParameter("cmd"));
		

		return "/foodBoard.jsp";
	}

}
