package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import model.memberDao;
import model.memberDto;

public class RegisterEditCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		memberDao dao = new memberDao();
		memberDto dto = new memberDto();
		dto.setMember_name(req.getParameter("member_edit_name"));
		dto.setMember_pass(req.getParameter("member_edit_pass"));
		dto.setMember_email(req.getParameter("member_edit_email"));
		dto.setMember_phone(req.getParameter("member_edit_phone"));
		dto.setMember_gender(req.getParameter("member_edit_gender"));
		
		dao.setUpdateRegister(dto, (String)req.getSession().getAttribute("member_id"));
        	return "/Main.jsp";	

	}

}
