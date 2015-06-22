package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import model.memberDao;
import model.memberDto;

public class LogInCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("LogInCommand");
			boolean login;
			String member_id = req.getParameter("member_id");
			String member_pass = req.getParameter("member_pass");
			System.out.println(member_id);
			System.out.println(member_pass);
			memberDto dto = new memberDto();
			memberDao dao = new memberDao();
			
			dto = dao.getRegister(member_id);
			login = dao.LoginCheck(member_id, member_pass);
			
			if(login == true){
			
			HttpSession session = req. getSession();
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_grade", dto.getMember_grade());
        	
			return "/Main.jsp";	
			}
			else{
			req.setAttribute("loginFail", "loginFail");
			
			return "/Main.jsp";}
	}

}
