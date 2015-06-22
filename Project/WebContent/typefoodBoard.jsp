<%@page import="model.businessDao"%>
<%@page import="model.businessDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>


<html>


<script>
   function check(){
      if(document.search.keyWord.value == ""){
         alert("검색어를 입력하세요.");
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
      int totalRecord = 0;      // 전체 글의 갯수
      int numPerPage = 5;      // 한 page당 보여질 글의 갯수
      int pagePerBlock = 3;   // 한 block당 페이지 수
      int totalPage;               // 전체 페이지 수
      int totalBlock;            // 전체 블럭 수
      int nowPage;               // 현재 페이지 번호
      int nowBlock;               // 현재 블럭 번호      (한번에 여러페이지를 이동하는 액션이 있을때 사용)
      int beginPerPage;         // 페이지당 시작 번호
   
      //페이징에 필요한 변수들

%>
<br>
<h2 class="featurette-heading">뭐 먹을래?</h2>
<% 
// String keyField = request.getParameter("keyField");
// String keyWord = request.getParameter("keyWord");
	String typefood = request.getParameter("type");
	System.out.println(typefood+" : typefood 값 페이지");
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
   //페이징 기능 구현
   request.setCharacterEncoding("euc-kr");

//    if(keyField == null){
//       keyField ="name";
//       keyWord="";
//    }
   
   
   if(list.size() == 0){ %>
      <b>등록된 글이 없습니다.</b>
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
         
         <td align="center"><marquee behavior="alternate" direction="up"><i class="icon-heart"></i><font style="color: brown; " ><%= dto.getBusiness_content()/*내용*/ %></font></marquee></td>
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
		<li><a href="foodBoard.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">이전 <%=pagePerBlock %>개</a></li>
		<%} %>
		<% 
      for(int i=0; i<pagePerBlock; i++){   
         if(((nowBlock * pagePerBlock) + i) == totalPage)
            {break;}
         %>
		<li><a href="foodBoard.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock * pagePerBlock) %></a></li>
 <%} %>
  <%if(totalBlock > nowBlock+1){ %>
		<li><a href="foodBoard.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">다음 <%=pagePerBlock %>개</a></li>
	<%} %>
	</ul>
</div>
</td>
</tr>
<tr>
   <td align=right colspan="7">
      <a href="javascript:deleteChk()">[삭제]</a>
      <a href="Post.jsp">[글쓰기]</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </td>
</tr>
</table>

<form action="List.jsp" name="search" method="post">
   <table class="table-hover" style="width: 100%">
   <tr>
      <td align="center">
         <select name="keyField" size="1">
<%--             <option value="name" <%if(keyField.equals("name")){ %>selected="selected"<%} %>> 이름</option> --%>
<%--             <option value="subject" <%if(keyField.equals("subject")){ %>selected="selected"<%} %>> 제목 --%>
<%--             <option value="content" <%if(keyField.equals("content")){ %>selected="selected"<%} %>> 내용 --%>
         </select>

         <input type="text" size="16" name="keyWord" >
         <input type="button" class="btn" value="찾기" onClick="check()">
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