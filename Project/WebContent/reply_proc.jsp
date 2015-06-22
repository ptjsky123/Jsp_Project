<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="rrrdao" class="model.replyDao" />
<jsp:useBean id="rrrdto" class="model.replyDto" />
<jsp:setProperty name="rrrdto" property="*" />
<%
	int member_no = rrrdao.searchMem(rrrdto.getMember_id());
	rrrdto.setMember_no(member_no);

	rrrdao.getReplyList(rrrdto.getMember_id(), rrrdto.getBusiness_no());
	rrrdao.insertReply(rrrdto);
	response.sendRedirect("Read.jsp?num="+rrrdto.getBusiness_no());
%>