<%@page import="model.memberDao"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="ko">
 <head>
    <meta charset="euc-kr">
    <title>3���� &middot; ������Ʈ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- ��Ÿ�� -->

    <link href="bootstrap/css/bootstrap-ko.css" rel="stylesheet">
           <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

    <script src="bootstrap/js/jquery-2.1.4.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   
  
   <link href="style.css" rel="stylesheet" type="text/css">
    <script>
      function Register(){
    	  $('#theModal').modal('hide');
    	  $('#theModalRegi').modal('show');
    	  
      
      }
      function Login(){
    	  var f = document.f2;

      	 
      	  	  f.action = "project";
        	  f.method="post";    	  
        	  f.submit();
      	
      	 }

      
function page_move(cmd){
    	  
    	  var f = document.f1;
    	  f.cmd.value = cmd;
    	  
    	  f.action = "project";
    	  f.method="post";    	  
    	  f.submit();
    	 
      }
      
$(document).ready(function() { 

    	  <%if(request.getAttribute("loginFail") != null){ %>
    	  $('#theModal').modal('show');
    	  alert("���̵� Ȥ�� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
      	
    	  <%}%>
}); 

$(document).ready(function() { 

	  <%if(request.getAttribute("notLogin") != null){ %>
	  alert("�α��� �� �̿��� �ּ���.");
 	
	  <%}%>
}); 

$(document).ready(function() { 
	
	<%if(request.getAttribute("idCheck") != null){ %>
	$('#theModalRegi').modal('show');
	alert("���̵� �ߺ��˴ϴ�.");
<%}%>

});

$(document).ready(function() { 

    	  <%if(request.getAttribute("regiComplite") != null){ %>
	alert("<%=request.getAttribute("regiId") %>" + "�� ȸ�������� �����մϴ�.");
<%}%>
});

function Areapage_move(cmd, area){
    var f = document.f1;
    f.cmd.value = cmd;
    f.area.value = area;
    
    f.action = "project";
    f.method="post";         
    f.submit();
    
}


function Typepage_move(cmd, type){
   
    var f = document.f1;
    f.cmd.value = cmd;
    f.type.value = type;
    
    f.action = "project";
    f.method="post";         
    f.submit();
}       
   
   
   </script>
  </head>

  <body>



    <!-- Ž������
    ================================================== -->
    <div class="navbar-wrapper">
      <!-- ���� ��ġ�� ������ ���� ��� �ȿ��� �߾� �����ϵ��� .navbar�� .container�� �θ���. -->
      <div class="container">

        <div class="navbar navbar-inverse" style="width: 105%">
          <div class="navbar-inner">
            <!-- ������ Ž������ 1 �ܰ�: ������ Ž�����븦 ���� ��ư (�������� �ٷ��� ����). ������ CSS�� �ʿ��ϴ�. -->
            <a type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <form name="f1">
            
            <a class="brand" href="javascript:page_move('MAIN')">������</a>
            <!-- ������ Ž������ 2 �ܰ�: .navbar-collapse.collapse �ȿ� ����� ���� ��� Ž������ ������ �ִ´�. -->
            <div class="nav-collapse collapse">
            <ul class="nav">
               <li class="divider-vertical"></li>
               
               
               <%if(session.getAttribute("member_id") == null){%>
               <li><a href="#theModal"  data-toggle="modal"> 
               <i class="icon-user"></i>
                
                	Sign In/Register   </a></li><%}else{%>
                	              
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown"> <i class="icon-user"></i> ${member_id} �� ȯ���մϴ�.<i class="caret"></i></a>
                  <ul class="dropdown-menu"> 
                  	<li>
						<a href="#theModalRegiEdit" data-toggle="modal">  ��������  </a>
						
	                 </li>
	                 <li>
	                 <a href="#theModalReservation" data-toggle="modal" >����Ȯ��</a>
	                 </li>
	                 <li>
                    <a href="#theModalFavorite" data-toggle="modal" >���ã�� ����</a>
                    
                     </li>
	                  <li>
	                 <a href="javascript:page_move('LOGOUT')" >LogOut</a>
	                 
					</li>           
                   
                    
                  </ul></li>       	
                 	<%}%>
               <li class="divider-vertical"></li>
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown"> �ٷΰ���<i class="caret"></i></a>
                  <ul class="dropdown-menu"> 
                  	<li>
						<a href="javascript:page_move('FOODBOARD')">��ü�˻�</a>
						
	                 </li>               
                      <li class="dropdown-submenu"><a href="#">������</a>
                        <ul class="dropdown-menu">
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','����1��')">����1��</a></li>
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','����2��')">����2��</a></li>
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','����3��')">����3��</a></li>
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','����4��')">����4��</a></li>
                        </ul></li>
                 <li class="dropdown-submenu"><a href="#">���ĺ�</a>
                        <ul class="dropdown-menu">
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','�ѽ�')">�ѽ�</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','���')">���</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','�߽�')">�߽�</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','�н�')">�н�</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','Ǫ��')">�н�ƮǪ��</a></li>
                        </ul></li>
                  </ul></li>
               <li class="divider-vertical"></li>
               <li><a href="javascript:page_move('GONGJIBOARDLIST')">��������</a></li>
                        
          
               <li class="divider-vertical"></li>
               <li><a href="javascript:page_move('FREEBOARDLIST')" >�����Խ���</a></li>
               
               <li class="divider-vertical"></li>
               <li><a href="javascript:page_move('MADE')" >������</a></li>
               
            </ul>
          	  <input type="hidden" name="cmd" value=""/>
              <input type="hidden" name="area" value=""/>
         	  <input type="hidden" name="type" value=""/>
            </form>
            <form class="navbar-form pull-right form-search" name="search" method="post" action="project">
            <input type="hidden" name="cmd" value="MAINSEARCH" /> 
            <input type="text"name="txtSearch" class="search-query" placeholder="��ȣ�� �Ǵ� �ּҷ� �˻��ϼ���"/>
             <input type="submit" value="�˻�"  class="btn"/> </form>
         </div><!--/.nav-collapse -->
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->
		
      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->
    
    <!-- �α�â -->
   <div class="modal hide fade" id="theModal" style="width: 260px">
      <div class="modal-header">
         <a href="#" class="close" data-dismiss="modal">&times;</a>
         <img src="img/login.PNG" />
      </div>
      <div class="modal-body">
         <form name=f2>
         <input type="text" placeholder="id" name="member_id"/><br />
         <input type="password" placeholder="password" name="member_pass" /><br />
		 <input type="hidden" name="cmd" value="LOGIN" />	

         <button type="button" class="btn" onclick="Login()">�α���</button>
         <button type="button" class="btn" onclick="Register()">ȸ������</button>
		 </form>
      </div>
   </div>
   
   
   <!--  ȸ������ -->
   <div class="modal hide fade" id="theModalRegi" style="width:350px ; height: 450px;">
   <div class="modal-header">
  <h3 align="center">ȸ������</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     
    	    <jsp:include page="register.jsp">
    	    <jsp:param value="" name=""/>
        </jsp:include>
		
      </div>
   </div>
   
   <!-- ȸ������ ���� -->
   <div class="modal hide fade" id="theModalRegiEdit" style="width:350px ; height: 450px;">
   <div class="modal-header">
  <h3 align="center">��������</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     
    	    <jsp:include page="regiEdit.jsp">
    	    <jsp:param value="" name=""/>
        </jsp:include>
		
      </div>
   </div>
   
   <!--  ���� Ȯ�� -->
      <div class="modal hide fade" id="theModalReservation" style="width:350px ; height: 450px;">
   <div class="modal-header"> 
  <h3 align="center">	<img src="img/reserved.png" /></h3>
  
   </div>
      <div class="modal-body" style="height: 500px;">
         	    <jsp:include page="reservation.jsp">
    			    <jsp:param value="" name=""/>
      			 </jsp:include>
     	
		
      </div>
   </div>
    <!-- ���ã�� ���� -->
 <div class="modal hide fade" id="theModalFavorite" style="width:350px ; height: 450px;">
   <div class="modal-header"> 
  
   <h3 align="center">���ã�� ����</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     
           <jsp:include page="favorite.jsp">
                 <jsp:param value="" name=""/>
                </jsp:include>

      
      </div>
   </div>

  </body>
</html>