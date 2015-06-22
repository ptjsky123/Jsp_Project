<%@ page contentType="text/html; charset=EUC-KR"%>
 <jsp:useBean id="dao" class="model.favoriteDao">
</jsp:useBean>
<%		
	String del[] = request.getParameterValues("del");System.out.println("우다다다다다닫"); 
	for (int i = 0; i < del.length; i++) {     
		dao.deleteBoard(Integer.parseInt(del[i].trim()));  
		
	}   
	response.sendRedirect("Main.jsp");%>
<html>
<body>
</body>
</html>