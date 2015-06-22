
<%@page import="model.businessDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>3���� &middot; ������Ʈ</title>
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <meta name="description" content=""> -->
<!--     <meta name="author" content=""> -->


    <!-- ��Ÿ�� -->
   
<!--    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/> -->
   <script src="bootstrap/js/bootstrap.min.js"></script>
   <script>
   function Mainread(num){
	   
	      document.Mainread.num.value = num;
	      document.Mainread.submit();
	      
	   }
   
</script>
</head>
 <body>
<jsp:include page="Title.jsp">
<jsp:param value="" name=""/>
</jsp:include>

<jsp:useBean id="dao" class="model.businessDao"/>

<%
Vector list = dao.getBusinessMain();
businessDto dto = (businessDto)list.get(0); 
businessDto dto1 = (businessDto)list.get(1);
businessDto dto2 = (businessDto)list.get(2);
%>
<br/><br/><br/>
<hr/>
    <!-- ȸ��������
    ================================================== -->
    
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/b12.jpg" alt="">
          <div class="container">

          </div>
        </div>
        
        <div class="item">
          <img src="img/b01.jpg" alt="">
          <div class="container">

          </div>
        </div>
        
        <div class="item">
          <img src="img/b21.jpg" alt="">
          <div class="container">

          </div>
        </div>
        
        <div class="item">
          <img src="img/b15.jpg"alt="">
          <div class="container">

          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="en-font-family">&lsaquo;</span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="en-font-family">&rsaquo;</span></a>
    </div><!-- /.carousel -->



    <!-- ������ ������ Ư��
    ================================================== -->
    <!-- ��� ������ �߾� �����ϱ����� ������ �������� �ٸ� container�� �θ���. -->

    <div class="container marketing">     

      <!-- Ư�� ���� -->

      <hr class="featurette-divider">

      <div class="featurette">
        <img class="featurette-image pull-right" src="img/<%=dto.getBusiness_no()%>.jpg" style="width: 400px; height: 400px">
        <h2 class="featurette-heading">BEST 1<br/> <span class="muted">
        
        <% if( session.getAttribute("member_id") != null){ %>
        <a href="javascript:Mainread('<%=dto.getBusiness_no()%>')"><%=dto.getBusiness_name() %></a>
        <%}else{ %>
        <%=dto.getBusiness_name() %>
        <%} %>
        </span></h2>
        <p class="lead"><%=dto.getBusiness_content()%></p>
      </div>
      
	  <hr class="featurette-divider">
	  
	   <div class="featurette">
        <img class="featurette-image pull-left" src="img/<%= dto1.getBusiness_no()%>.jpg" style="width:400px; height:400px">
        <h2 class="featurette-heading">BEST 2<br><span class="muted">
        
        <% if( session.getAttribute("member_id") != null){ %>
        <a href="javascript:Mainread('<%=dto1.getBusiness_no()%>')"><%=dto1.getBusiness_name() %></a>
        <%}else{ %>
        <%=dto1.getBusiness_name() %>
        <%} %>
        
        </span></h2>
        <p class="lead"><%=dto1.getBusiness_content()%></p>
      </div>
      <hr class="featurette-divider">
       <div class="featurette">
        <img class="featurette-image pull-right" src="img/<%=dto2.getBusiness_no()%>.jpg" style="width: 400px; height: 400px">
        <h2 class="featurette-heading">BEST 3<br/> <span class="muted">
        
               <% if( session.getAttribute("member_id") != null){ %>
        <a href="javascript:Mainread('<%=dto2.getBusiness_no()%>')"><%=dto2.getBusiness_name() %></a>
        <%}else{ %>
        <%=dto2.getBusiness_name() %>
        <%} %>
        
        </span></h2>
        <p class="lead"><%=dto2.getBusiness_content()%></p>
      </div>
      
      
      <hr class="featurette-divider">

      <!-- Ư�� /�� -->
<form method="post" name="Mainread" action="Read.jsp">
   <input type="hidden" name="num" />
<%--    <input type="hidden" name="keyField" value="<%=keyField %>" /> --%>
<%--    <input type="hidden" name="keyWord" value="<%=keyWord %>" /> --%>

</form>

      <!-- ������ -->
      <footer>
        <p class="pull-right"><a href="#">���� ����</a></p>
        <p>&copy; 2015 ȸ��. &middot; <a href="#">����������޹�ħ</a> &middot; <a href="#">�̿���</a></p>
      </footer>

    </div><!-- /.container -->

  </body>
</html>