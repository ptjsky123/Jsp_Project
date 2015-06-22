<%@page import="java.util.Vector"%>
<%@page import="model.freeBoardDto"%>
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
   function read(num){
      document.read.num.value = num;
      document.read.submit();
      
   }
   

   function page_freeboardPost(cmd){
   
      var f = document.freePost;
      f.action = "project";
      f.method="post";         
      f.submit();
      f.cmd.value = cmd;
   }
   
   function page_freeboardBack(cmd){
      var f = document.freePost;
      f.action = "project";
      f.method="post";         
      f.submit();
      f.cmd.value = cmd;      
      
   }
   function page_freeboardSearch(cmd){
      var f = document.freeboardsearch;
      f.action ="project";
      f.method="post";         
       f.submit();
       f.cmd.value = cmd;
   }

</script>
<body>
   <jsp:include page="Title.jsp">
      <jsp:param value="a" name="a" />
   </jsp:include>
   <br />
   <br />
   <br />

   <jsp:useBean id="dao" class="model.freeBoardDao" />
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
      <h2>���� �Խ���</h2>
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
               <form  action="project" name="freePost" method="post">
            <input type="hidden" name="cmd" value="FREEBOARDPOST" /> <input
               type="submit" class="btn" value="�۾���" />
            </form>
            </td>
         </tr>
      </table>

      <table width=80% border=0 cellspacing=0 cellpadding=3
         class="table table-striped">
         <!-- class="table table-striped" -->
         <tr>
            <td align=center colspan=2>
               <table border=0 width=100% cellpadding=2 cellspacing=0>
                  <tr>



                     <td>��ȣ</td>
                     <td>����</td>
                     <td>�̸�</td>
                     <td>���̵�</td>
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
         freeBoardDto dto = (freeBoardDto)list.get(i); 
         
        %>

                  <tr>
                     <td align="center"><%= dto.getFreeboard_no() %></td>
                     <form action="project" method="post" name="freeRead">
                        <td align="center"><a
                           href="project?cmd=FREEBOARDREAD&freeboard_no=<%=dto.getFreeboard_no()%>">
                              <%= dto.getFreeboard_subject() %></a></td>
                     </form>
                     <td align="center"><%= dto.getMember_name()%></td>
                     <td align="center"><%= dto.getMember_id() %> </td>
                     <td align="center"><%= dto.getFreeboard_regdate() %></td>
                     <td align="center"><%= dto.getFreeboard_count() %></td>

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
                        href="freeboardList.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">����</a></li>
                     <%} %>
                     <% 
               for(int i=0; i<pagePerBlock; i++){   
                  if(((nowBlock * pagePerBlock) + i) == totalPage)
                     {break;}
                  %>
                     <li><a
                        href="freeboardList.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock * pagePerBlock) %></a></li>
                     <%} %>
                     <%if(totalBlock > nowBlock+1){ %>
                     <li><a
                        href="freeboardList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">����</a></li>
                     <%} %>
                  </ul>
               </div>
            </td>
         </tr>

         <tr>

            </form>
         </tr>
      </table>


      <form action="project" name="freeboardsearch" method="post">
      <input type="hidden" name="cmd" value="FREEBOARDSEARCH">
         <table border=0 width=527 align=center cellpadding=4 cellspacing=0>
            <tr>
               <td align=center valign=bottom><select name="keyField"
                  size="1">
                     <option value="member_name" <%if(keyField.equals("member_name")){ %>
                        selected="selected" <%} %>>�̸�</option>
                     <option value="freeboard_subject" <%if(keyField.equals("freeboard_subject")){ %>
                        selected="selected" <%} %>>����</option>
                  
               </select> <input type="text" size="20" name="keyWord"> &nbsp; 
               <input type="submit" value="ã��" onClick="check()" class="btn"> 
               <input type="hidden" name="page" value="0">
               <input type="hidden" name="gongjiboard_no" /> 
               <input type="hidden" name="keyField" value="<%=keyField %>" /> 
               <input type="hidden" name="keyWord" value="<%=keyWord %>" />   
                  </td> 
            </tr>
         </table>
      </form>

   <%--    <form method="post" name="freeboardRead" action="">
         <input type="hidden" name="freeboard_no" /> <input type="hidden"
            name="keyField" value="<%=keyField %>" /> <input type="hidden"
            name="keyWord" value="<%=keyWord %>" />
      </form> --%>
   </center>
</body>
</html>