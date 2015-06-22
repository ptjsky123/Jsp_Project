<%@page import="model.gongjiBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
   function list() {
      document.list.submit();
   }

   function page_gongjiboardRead(cmd) {

      var f = document.gongjiRead;
      f.action = "project";
      f.method = "post";
      f.cmd.value = cmd;
      f.submit();
      
   }
   
   function page_move(cmd){
       
       var f = document.f1;
       f.cmd.value = cmd;
       
       f.action = "project";
       f.method="post";         
       f.submit();
      
    }
   function page_move_no(cmd,gongji_no){
          var f = document.gongji_Read_button;
          
          f.cmd.value = cmd;
     
          f.gongji_no.value = gongji_no;
        
          f.action = "project";
          f.method="post";         
          f.submit();   
      
   }
   function move_no_no() {
	      alert("���� �Խñ��� �ƴմϴ�")
	   }
</script>
</head>

<body>
   <jsp:include page="Title.jsp">
      <jsp:param value="a" name="a" />
   </jsp:include>
   <br />
   <br />
   <br />
   <jsp:useBean id="dao" class="model.gongjiBoardDao"></jsp:useBean>
   <%
         
   int gongji_no = Integer.parseInt(request.getParameter("gongji_no"));
      /* System.out.println(gongji_no+"freeboard_no, read"); */
      String keyField = request.getParameter("keyField");
      String keyWord = request.getParameter("keyWord");

      gongjiBoardDto dto = dao.getBoard(gongji_no, "gongjiboardRead");
   %>
   <br>
   <br>
   
   <table align=center width=70% border=0 cellspacing=3 cellpadding=0 >
   <hr/>
      <tr><br/>
      
      </tr>
      <tr>
         <td colspan=2><%=dto.getGongji_no() %>��°�� //��ȸ�� : <%=dto.getGongji_count()%>
            <table border=1 cellpadding=3 cellspacing=0 width=100% class="table table-striped">
               <tr>
                  <td align=center bgcolor=#dddddd width=10%>�� ��</td>
                  <td bgcolor=#ffffe8><%=dto.getMember_name()%></td>
                  <td align=center bgcolor=#dddddd width=10%>��ϳ�¥</td>
                  <td bgcolor=#ffffe8><%=dto.getGongji_regdate()%></td>
               </tr>
               <tr>
                  <td align=center bgcolor=#dddddd>�� ��</td>
                  <td bgcolor=#ffffe8 colspan=3><%=dto.getGongji_subject()%></td>
               </tr> 
               <tr>
                  <td colspan=4><%=dto.getGongji_content().replace("\n", "<br/>")%></td>
               </tr>
               <hr/>
               
               <%-- <tr>
                  <td colspan=4 align=right>��ȸ�� : <%=dto.getFreeboard_count()%>
                  </td>
               </tr> --%>
            </table>
         </td>
      </tr>
   
      <tr>   
      
         <td align=center colspan=2>         
         <a href="javascript:page_move('GONGJIBOARDBACK')" >
         <input type="button" value="���" class="btn" onclick="page_move()"/></a>               
         <%-- <input type="submit" value ="�亯" class="btn" onclick="page_move_no('FREEBOARDREPLY', <%= dto.getFreeboard_no() %>)"/> --%>
          <%if((session.getAttribute("member_id")).equals(dto.getMember_id())){%>      
         <input type="submit" value ="����" class="btn" onclick="page_move_no('GONGJIBOARDUPDATE', <%= dto.getGongji_no() %>)"/>
         <input type="submit" value ="����" class="btn" onclick="page_move_no('GONGJIBOARDDELETE', <%= dto.getGongji_no() %>)"/>
         <%}      
         else{ %>
         <input type="submit" value ="����" class="btn" onclick="move_no_no()"/>
         <input type="submit" value ="����" class="btn" onclick="move_no_no()"/>
         <%} %>
         </td>
         
      </tr> 
      
   </table>
   
   <form name="gongji_Read_button">
   <input type="hidden" name="gongji_no"/>
   <input type="hidden" name="cmd"/>
   </form>
   
   <form name="gongjiBoardList" method="post" action="gongjiBoardList.jsp">
      <input type="hidden" name="keyField" value="<%=keyField%>" /> <input
         type="hidden" name="keyWord" value="<%=keyWord%>" />
   </form>
</body>
</html>	