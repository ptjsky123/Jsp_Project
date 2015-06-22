<%@page import="model.businessDao"%>
<%@page import="model.businessDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>


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
<jsp:param value="a" name="a"/>
</jsp:include>
<br/><br/><br/>
<hr/>



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
<br>
<h2 class="featurette-heading">�� ������?</h2>
<% 
// String keyField = request.getParameter("keyField");
// String keyWord = request.getParameter("keyWord");
	String typefood = request.getParameter("type");
	System.out.println(typefood+" : typefood �� ������");
	businessDao bdao = new businessDao();
			

   Vector list = bdao.getBusinessTypeList(typefood);

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

<!-- <form method="post" action="deleteChk.jsp" name="deleteChk"> -->
<!-- <table class="table"> -->
<!-- <tr> -->
<%--    <td align=left>Total :  <%=totalRecord%> Articles( --%>
<%--       <font color=red>  <%=nowPage+1 %> / <%=totalPage%> Pages </font>) --%>
<!--    </td> -->
<!-- </tr> -->
<!-- </table> -->

<!-- <table class="table-hover" style="width: 80%; margin-left: 10%;"> -->

<tr>
   <td align=center colspan=2></td>

   <%
   //����¡ ��� ����
   request.setCharacterEncoding("euc-kr");

//    if(keyField == null){
//       keyField ="name";
//       keyWord="";
//    }
   
   
   if(list.size() == 0){ %>
      <b>��ϵ� ���� �����ϴ�.</b>
   <%
   }
   else{

for(int i=beginPerPage; i< beginPerPage + numPerPage; i++){
             if(i == totalRecord){ break;}
         businessDto dto = (businessDto)list.get(i); %>
   <table class="table-hover" style="width: 100%";>
      <tr class="success" align="center" valign="middle">
      
         
<%--          <td align="center" style="width: 30px"><input type="checkbox" name="check" value="<%=dto.getBusiness_no()%>" id="check"/></td> --%>
        
         
         <td style="width: 500px; "><img src="img/<%= dto.getBusiness_no()%>.jpg" class="img" ></td>
                           <td  style="width: 150px"align="center">
            <%if(dto.getBusiness_no() >0) {%>
            
         <%} %>
         <a href="javascript:read('<%=dto.getBusiness_no()%>')"><%= dto.getBusiness_name() %></a></td>
         
         <td align="center"><marquee behavior="alternate" direction="up"><i class="icon-heart"></i><font style="color: brown; " ><%= dto.getBusiness_content()/*����*/ %></font></marquee></td>
         <td valign="middle"><%= dto.getBusiness_addr() %></td>
         <td align="center"><%= dto.getBusiness_phone() %></td>
         <td align="center"><%= dto.getBusiness_count() %></td>
          
         
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
   <td align=right colspan="7">
      <a href="javascript:deleteChk()">[����]</a>
      <a href="Post.jsp">[�۾���]</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </td>
</tr>
</table>

<form action="List.jsp" name="search" method="post">
   <table class="table-hover" style="width: 100%">
   <tr>
      <td align="center">
         <select name="keyField" size="1">
<%--             <option value="name" <%if(keyField.equals("name")){ %>selected="selected"<%} %>> �̸�</option> --%>
<%--             <option value="subject" <%if(keyField.equals("subject")){ %>selected="selected"<%} %>> ���� --%>
<%--             <option value="content" <%if(keyField.equals("content")){ %>selected="selected"<%} %>> ���� --%>
         </select>

         <input type="text" size="16" name="keyWord" >
         <input type="button" class="btn" value="ã��" onClick="check()">
         <input type="hidden" name="page" value= "0">
      </td>
   </tr>
   </table>
</form>
<form method="post" name="read" action="Read.jsp">
   <input type="hidden" name="num" />
    <input type="hidden" name="page" value="typefoodBoard.jsp" />
<%--    <input type="hidden" name="keyField" value="<%=keyField %>" /> --%>
<%--    <input type="hidden" name="keyWord" value="<%=keyWord %>" /> --%>

</form>
</body>
</html>