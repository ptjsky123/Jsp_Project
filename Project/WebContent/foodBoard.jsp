
<%@page import="model.businessDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" %>

<!DOCTYPE html>
<html>


<script>
   function check(){
      if(document.search.keyWord.value == ""){
         alert("�˻�� �Է��ϼ���.");
         document.search.keyWord.focus();
         return;
      }
      document.search.submit();
   }
   function read(num){
      document.read.num.value = num;
      document.read.submit();
      
   }
   
   function deleteChk(){
      
      document.deleteChk.submit();
      
   }
   function checkAll(checked){
      var all_check = document.getElementsByTagName("input");
       for(var i=0;i<all_check.length;i++){
           if(all_check[i].type == "checkbox"){
            all_check[i].checked = checked;
           }

//       if(document.getElementById("checkedAll").checked == true){
//          document.getElementsByTagName("input").checked = true;
//       }
   
       }
      
      
   }
   

   
</script>
<style>

   .img{width: 100%; height: 200px;}

</style>
<body>
<jsp:include page="/Title.jsp">
<jsp:param value="" name=""/>
</jsp:include>
<br/><br/><br/><br/>




<jsp:useBean id="dao" class="model.businessDao"/>
<%!
      int totalRecord = 0;      // ��ü ���� ����
      int numPerPage = 5;      // �� page�� ������ ���� ����
      int pagePerBlock = 3;   // �� block�� ������ ��
      int totalPage;               // ��ü ������ ��
      int totalBlock;            // ��ü �� ��
      int nowPage;               // ���� ������ ��ȣ
      int nowBlock;               // ���� �� ��ȣ      (�ѹ��� ������������ �̵��ϴ� �׼��� ������ ���)
      int beginPerPage;         // �������� ���� ��ȣ
   
      //����¡�� �ʿ��� ������

%>

<h2 align="center">�� ������?</h2>

<%

Vector list = null;
	if(session.getAttribute("cmd").equals("FOODBOARD")){
   	list = dao.getBusinessList();}
 	else if(session.getAttribute("cmd").equals("MAINSEARCH")){
// 		String search = (String)session.getAttribute("txtSearch");		
		String search = (String)session.getAttribute("txtSearch");
	if(search == "" || search == null){list = dao.getBusinessList();}
 		else{
 		list = dao.getSearchBusinessList(search);}
		} 
	
	
   totalRecord = list.size();

   totalPage = (int)(Math.ceil((double)totalRecord  / numPerPage)); 

   if(request.getParameter("nowPage") != null){
   nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   if(request.getParameter("nowBlock") != null){
   nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
   }
   
   beginPerPage = nowPage * numPerPage;
   
   totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
%>

<!-- <table class="table-hover" style="width: 100%";> -->

<tr>
   <td align=center colspan=2></td>

   <%
   //����¡ ��� ����
   request.setCharacterEncoding("euc-kr");

   
   if(list.size() == 0){ %>
      <b>��ϵ� ���� �����ϴ�.</b>
   <%
   }
   else{

for(int i=beginPerPage; i< beginPerPage + numPerPage; i++){
             if(i == totalRecord){ break;}
         businessDto dto = (businessDto)list.get(i); %>
 		<table class="table-hover" style="width: 100%";>
      <tr class="info" align="center" valign="middle">
      
         
<%--          <td align="center" style="width: 30px"><input type="checkbox" name="check" value="<%=dto.getBusiness_no()%>" id="check"/></td> --%>
         <td align="center" style="width: 60px" ><i class="icon-tags"></i></td>
         
         <td style="width: 400px; "><img src="img/<%= dto.getBusiness_no()%>.jpg" class="img" ></td>
                           <td  style="width: 150px"align="center">
            <%if(dto.getBusiness_no() >0) {%>
            
         <%} %>
         <a href="javascript:read('<%=dto.getBusiness_no()%>')"><%= dto.getBusiness_name() %></a></td>
        
         <td align="center"><marquee behavior="alternate" direction="up"><i class="icon-heart"></i><font style="color: brown; " ><%= dto.getBusiness_content()/*����*/ %></font></marquee></td>
         <td valign="middle"><%= dto.getBusiness_addr() %></td>
         <td align="center"><%= dto.getBusiness_phone() %></td>
         <td align="center"><%= dto.getBusiness_count() %></td>
          <td align="center" style="width: 60px" ><i class="icon-th-large"></i></td>
           
        
         </tr>
		</table>
		<hr/>
	
<% }}   %>   
   


<tr>

     <td align=right colspan="7">
   <div class="pagination pagination-centered pagination-large">
	<ul>
		  <%if(0 < nowBlock){ %>
		<li><a href="foodBoard.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">���� <%=pagePerBlock %>��</a></li>
		<%} %>
		<% 
      for(int i=0; i<pagePerBlock; i++){   
         if(((nowBlock * pagePerBlock) + i) == totalPage)
            {break;}
         %>
		<li><a href="foodBoard.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock * pagePerBlock) %></a></li>
 <%} %>
  <%if(totalBlock > nowBlock+1){ %>
		<li><a href="foodBoard.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">���� <%=pagePerBlock %>��</a></li>
	<%} %>
	</ul>
</div>
</td>
</tr>
<tr>
       <% if(  ((String)session.getAttribute("member_grade")).equals("������")  ){ %>
   <td align=right colspan="7">
      <a href="javascript:deleteChk()">[����]</a>
 
      <a href="Post.jsp">[�۾���]</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
      <%} %>
      
   
</tr>
</table>

<form action="List.jsp" name="search" method="post">
   <table class="table-hover" style="width: 100%">
   <tr>
<!--       <td align="center"> -->
<!--          <select name="keyField" size="1"> -->
<%--             <option value="name" <%if(keyField.equals("name")){ %>selected="selected"<%} %>> �̸�</option> --%>
<%--             <option value="subject" <%if(keyField.equals("subject")){ %>selected="selected"<%} %>> ���� --%>
<%--             <option value="content" <%if(keyField.equals("content")){ %>selected="selected"<%} %>> ���� --%>
<!--          </select> -->

<!--          <input type="text" size="16" name="keyWord" > -->
<!--          <input type="button" class="btn" value="ã��" onClick="check()"> -->
<!--          <input type="hidden" name="page" value= "0"> -->
<!--       </td> -->
   </tr>
   </table>
</form>
<form method="post" name="read" action="Read.jsp">
   <input type="hidden" name="num" />
<%--    <input type="hidden" name="keyField" value="<%=keyField %>" /> --%>
<%--    <input type="hidden" name="keyWord" value="<%=keyWord %>" /> --%>

</form>
</body>
</html>