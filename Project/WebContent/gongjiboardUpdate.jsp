<%@page import="java.util.Vector"%>
<%@page import="model.gongjiBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
   function page_gongjiboardUpdate(cmd) {

      var f = document.gongjiupdate;
      f.action = "project";
      f.method = "post";
      f.submit();
      f.cmd.value = cmd;
   }
   
   function page_move_upok(cmd,gongji_no){
          var f = document.gongjigongji;
        
          f.gongji_subject.value = document.getElementById("subject").value;
          f.gongji_content.value = document.getElementById("content").value;
          f.cmd.value = cmd;
          f.gongji_no.value = gongji_no;

          f.action = "project";
          f.method="post";         
          f.submit();   
      
   }
</script>
<body>
   <jsp:include page="Title.jsp">
      <jsp:param value="a" name="a" />
   </jsp:include>
   <br />
   <br />
   <br />
   <%
      request.setCharacterEncoding("euc-kr");
   %>
   <jsp:useBean id="dao" class="model.gongjiBoardDao" />

   <%
      int gongji_no = Integer.parseInt(request.getParameter("gongji_no"));
      System.out.println(gongji_no+"freeboard");
      
      
      gongjiBoardDto dto = dao.getBoard(gongji_no, "update");
   %>
   <center>
      <br> <br>
      <h4>�����ϱ�</h4>
      <table align=center width=70% border=0 cellspacing=3 cellpadding=0>
         <hr />
         <tr>
            <br />

         </tr>
         <form method="post" action="project" name="gongjigongji">
         <input type="hidden" name="cmd"/>
         <input type="hidden" name="gongji_no"/>
         <input type="hidden" name="gongji_subject"/>
         <input type="hidden" name="gongji_content"/>
         <tr>
            <td colspan=2>��ȸ�� : <%=dto.getGongji_count()%>
               <table border=1 cellpadding=3 cellspacing=0 width=100%
                  class="table table-striped">
                  <tr>
                     <td align=center bgcolor=#dddddd width=10%>�� ��</td>
                     <td bgcolor=#ffffe8><%=dto.getMember_name()%></td>
                     <td align=center bgcolor=#dddddd width=10%>��ϳ�¥</td>
                     <td bgcolor=#ffffe8><%=dto.getGongji_regdate()%></td>
                  </tr>
                  <tr>
                     <td align=center bgcolor=#dddddd>�� ��</td>
                     <td bgcolor=#ffffe8 colspan=3>
                     <input type=text name=subject id="subject"
                        size=50 maxlength=500 value="<%=dto.getGongji_subject()%>">
                     </td>
                  </tr>
                  <tr>
                     <td colspan=4>
                     <textarea style="width: 98%;" name=content id="content"   rows=10 cols=50>
                        <%=dto.getGongji_content()%></textarea></td>
                  </tr>

               </table>
            </td>
         </tr>
         </form>
         <tr>
            
         </tr>
      </table>
            <td colspan=4>
            
            <input type="submit" value ="�����Ϸ�" class="btn" onclick="page_move_upok('GONGJIBORADUPDATEPROC', <%= dto.getGongji_no() %>)"/>            
            <input type=reset value="�ٽü���" class="btn"> 
            <input type=button value="�ڷ�" class="btn" onClick="history.back()"></td>
   </center>
</body>
</html>