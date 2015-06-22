<%@page import="java.util.Vector"%>
<%@page import="model.gongjiBoardDto"%>
<%@page import="model.memberDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
   function check(){
      if(document.search.keyWord.value == ""){
         alert("�˻�� �Է��ϼ���.");
         document.search.keyWord.focus();
         return;
      }
      document.search.submit();
   }
   

   function page_gongjiPost(cmd){
   
      var f = document.gongjiPost;
      f.action = "project";
      f.method="post";         
      f.submit();
      f.cmd.value = cmd;
   }
   
   function page_gongjiSearch(cmd){
      var f = document.gongjiRead;
      f.action = "project";
      f.method = "post";
      f.submit();
      f.cmd.value=cmd;
   }
   

</script>
<body>
   <jsp:include page="Title.jsp">
      <jsp:param value="a" name="a" />
   </jsp:include>
   <br />
   <br />
   <br />

   <jsp:useBean id="dao" class="model.gongjiBoardDao" />
   <%!
      int totalRecord = 0;      // ��ü ���� ����
      int numPerPage = 7;      // �� page�� ������ ���� ����
      int pagePerBlock = 3;   // �� block�� ������ ��
      int totalPage;               // ��ü ������ ��
      int totalBlock;            // ��ü �� ��
      int nowPage;               // ���� ������ ��ȣ
      int nowBlock;               // ���� �� ��ȣ      (�ѹ��� ������������ �̵��ϴ� �׼��� ������ ���)
      int beginPerPage;         // �������� ���� ��ȣ
   
      //����¡�� �ʿ��� ������

%>
   <center>
      <br>
      <h2>���� ����</h2>
      <% 

   String keyField = request.getParameter("keyField");
   String keyWord = request.getParameter("keyWord");
   
   Vector list = dao.getBoardList(keyField, keyWord);

   totalRecord = list.size();

   totalPage = (int)(Math.ceil((double)totalRecord  / numPerPage)); 

   if(request.getParameter("nowPage") != null){
   nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   if(request.getParameter("nowBlock") != null){
   nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
   }
   
   beginPerPage = nowPage * numPerPage; 
   //�������� ���� ��ȣ =���� ������ ��ȣ *�� page�� ������ ���� ����
   
   totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
   //��ü �� �� = ��ü ������ ��/�� block�� ������ ��
%>


      <table align=center border=0 width=80%>
         <tr>
            <td align=left>Total : <%=totalRecord%> Articles( <font
               color=red> <%=nowPage+1 %> / <%=totalPage%> Pages
            </font>)
            </td>
            <td align=right>
               <form  action="project" name="gongjiPost" method="post">
            <input type="hidden" name="cmd" value="GONGJIBOARDPOST" /> <input
               type="submit" class="btn" value="�۾���" />
            </form>
            </td>
         </tr>
      </table>

      <table width=80% border=0 cellspacing=0 cellpadding=3
         class="table table-striped ">
         <!-- class="table table-striped" -->
         <tr>
            <td align=center colspan=2>
               <table border=0 width=100% cellpadding=2 cellspacing=0>
                  <tr>



                     <td>��ȣ</td>
                     <td>����</td>
                     <td>�̸�</td>
                     <td>��¥</td>
                     <td>��ȸ��</td>

                  </tr>
                  <%
  
   request.setCharacterEncoding("euc-kr");

   if(keyField == null){
      keyField ="member_name";
      keyWord="";
   }
   
   
   if(list.size() == 0){ %>
                  <b>��ϵ� ���� �����ϴ�.</b>
                  <%
   }
   else{
   for(int i=beginPerPage; i< beginPerPage + numPerPage; i++){
            if(i == totalRecord){ break;}
            gongjiBoardDto dto = (gongjiBoardDto)list.get(i); 
         
        %>

                  <tr>
                     <td align="center"><%= dto.getGongji_no() %></td>
                     <form action="project" method="post" name="gongjiRead">
                        <td align="center"><a
                           href="project?cmd=GONGJIBOARDREAD&gongji_no=<%=dto.getGongji_no()%>">
                              <%= dto.getGongji_subject() %></a></td>
                     </form>
                     <td align="center"><%= dto.getMember_name()%></td>
                     <td align="center"><%= dto.getGongji_regdate() %></td>
                     <td align="center"><%= dto.getGongji_count() %></td>

                  </tr>
                  <% }}   %>

               </table>


            </td>

         </tr>

         <tr>
            <td><BR></td>
         </tr>

         <tr>

            <td align=right colspan="7">
               <div class="pagination pagination-centered pagination-large">
                  <ul>
                     <%if(0 < nowBlock){ %>
                     <li><a
                        href="gongjiboardList.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">����</a></li>
                     <%} %>
                     <% 
               for(int i=0; i<pagePerBlock; i++){   
                  if(((nowBlock * pagePerBlock) + i) == totalPage)
                     {break;}
                  %>
                     <li><a
                        href="gongjiboardList.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock * pagePerBlock) %></a></li>
                     <%} %>
                     <%if(totalBlock > nowBlock+1){ %>
                     <li><a
                        href="gongjiboardList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">����</a></li>
                     <%} %>
                  </ul>
               </div>
            </td>
         </tr>

         <tr>

            </form>
         </tr>
      </table>


      <form action="project" name="gongjisearch" method="post">   
         <input type="hidden" name="cmd" value="GONGJISEARCH"/>
         
         <table border=0 width=527 align=center cellpadding=4 cellspacing=0>
            <tr>
               <td align=center valign=bottom>
               <select name="keyField"   size="1">
                     <option value="member_name" <%if(keyField.equals("member_name")){ %>
                        selected="selected" <%} %>>�̸�</option>
                     <option value="gongji_subject" <%if(keyField.equals("gongji_subject")){ %>
                        selected="selected" <%} %>>����</option>                     
               </select> 
               <input type="text" size="20" name="keyWord"> &nbsp; 
               <input type="submit" value="ã��" onClick="check()" class="btn">                
               <input type="hidden" name="page" value="0">
               <input type="hidden" name="gongjiboard_no" /> 
               <input type="hidden" name="keyField" value="<%=keyField %>" /> 
               <input type="hidden" name="keyWord" value="<%=keyWord %>" />
         </td>
            </tr>
         </table>
      </form>

<%--       <form method="post" name="gongjiboardRead" action="">
         <input type="hidden" name="gongjiboard_no" /> 
         <input type="hidden" name="keyField" value="<%=keyField %>" /> 
         <input type="hidden" name="keyWord" value="<%=keyWord %>" />
      </form> --%>
   </center>
</body>
</html>