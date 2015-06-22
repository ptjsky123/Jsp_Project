<%@page import="model.memberDao"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="ko">
 <head>
    <meta charset="euc-kr">
    <title>3조의 &middot; 프로젝트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 스타일 -->

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
    	  alert("아이디 혹은 비밀번호가 틀렸습니다.");
      	
    	  <%}%>
}); 

$(document).ready(function() { 

	  <%if(request.getAttribute("notLogin") != null){ %>
	  alert("로그인 후 이용해 주세요.");
 	
	  <%}%>
}); 

$(document).ready(function() { 
	
	<%if(request.getAttribute("idCheck") != null){ %>
	$('#theModalRegi').modal('show');
	alert("아이디가 중복됩니다.");
<%}%>

});

$(document).ready(function() { 

    	  <%if(request.getAttribute("regiComplite") != null){ %>
	alert("<%=request.getAttribute("regiId") %>" + "님 회원가입을 축하합니다.");
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



    <!-- 탐색막대
    ================================================== -->
    <div class="navbar-wrapper">
      <!-- 절대 위치를 지정한 상위 요소 안에서 중앙 정렬하도록 .navbar를 .container로 두른다. -->
      <div class="container">

        <div class="navbar navbar-inverse" style="width: 105%">
          <div class="navbar-inner">
            <!-- 유동형 탐색막대 1 단계: 반응형 탐색막대를 여는 버튼 (문서에서 다루지 않음). 반응형 CSS가 필요하다. -->
            <a type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <form name="f1">
            
            <a class="brand" href="javascript:page_move('MAIN')">오리아</a>
            <!-- 유동형 탐색막대 2 단계: .navbar-collapse.collapse 안에 숨기고 싶은 모든 탐색막대 내용을 넣는다. -->
            <div class="nav-collapse collapse">
            <ul class="nav">
               <li class="divider-vertical"></li>
               
               
               <%if(session.getAttribute("member_id") == null){%>
               <li><a href="#theModal"  data-toggle="modal"> 
               <i class="icon-user"></i>
                
                	Sign In/Register   </a></li><%}else{%>
                	              
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown"> <i class="icon-user"></i> ${member_id} 님 환영합니다.<i class="caret"></i></a>
                  <ul class="dropdown-menu"> 
                  	<li>
						<a href="#theModalRegiEdit" data-toggle="modal">  정보수정  </a>
						
	                 </li>
	                 <li>
	                 <a href="#theModalReservation" data-toggle="modal" >예약확인</a>
	                 </li>
	                 <li>
                    <a href="#theModalFavorite" data-toggle="modal" >즐겨찾기 관리</a>
                    
                     </li>
	                  <li>
	                 <a href="javascript:page_move('LOGOUT')" >LogOut</a>
	                 
					</li>           
                   
                    
                  </ul></li>       	
                 	<%}%>
               <li class="divider-vertical"></li>
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown"> 바로가기<i class="caret"></i></a>
                  <ul class="dropdown-menu"> 
                  	<li>
						<a href="javascript:page_move('FOODBOARD')">전체검색</a>
						
	                 </li>               
                      <li class="dropdown-submenu"><a href="#">지역별</a>
                        <ul class="dropdown-menu">
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','종로1가')">종로1가</a></li>
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','종로2가')">종로2가</a></li>
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','종로3가')">종로3가</a></li>
                           <li><a href="javascript:Areapage_move('AREAFOODBOARD','종로4가')">종로4가</a></li>
                        </ul></li>
                 <li class="dropdown-submenu"><a href="#">음식별</a>
                        <ul class="dropdown-menu">
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','한식')">한식</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','양식')">양식</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','중식')">중식</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','분식')">분식</a></li>
                           <li><a href="javascript:Typepage_move('TYPEFOODBOARD','푸드')">패스트푸드</a></li>
                        </ul></li>
                  </ul></li>
               <li class="divider-vertical"></li>
               <li><a href="javascript:page_move('GONGJIBOARDLIST')">공지사항</a></li>
                        
          
               <li class="divider-vertical"></li>
               <li><a href="javascript:page_move('FREEBOARDLIST')" >자유게시판</a></li>
               
               <li class="divider-vertical"></li>
               <li><a href="javascript:page_move('MADE')" >만든이</a></li>
               
            </ul>
          	  <input type="hidden" name="cmd" value=""/>
              <input type="hidden" name="area" value=""/>
         	  <input type="hidden" name="type" value=""/>
            </form>
            <form class="navbar-form pull-right form-search" name="search" method="post" action="project">
            <input type="hidden" name="cmd" value="MAINSEARCH" /> 
            <input type="text"name="txtSearch" class="search-query" placeholder="상호명 또는 주소로 검색하세요"/>
             <input type="submit" value="검색"  class="btn"/> </form>
         </div><!--/.nav-collapse -->
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->
		
      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->
    
    <!-- 로긴창 -->
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

         <button type="button" class="btn" onclick="Login()">로그인</button>
         <button type="button" class="btn" onclick="Register()">회원가입</button>
		 </form>
      </div>
   </div>
   
   
   <!--  회원가입 -->
   <div class="modal hide fade" id="theModalRegi" style="width:350px ; height: 450px;">
   <div class="modal-header">
  <h3 align="center">회원가입</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     
    	    <jsp:include page="register.jsp">
    	    <jsp:param value="" name=""/>
        </jsp:include>
		
      </div>
   </div>
   
   <!-- 회원정보 수정 -->
   <div class="modal hide fade" id="theModalRegiEdit" style="width:350px ; height: 450px;">
   <div class="modal-header">
  <h3 align="center">정보수정</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     
    	    <jsp:include page="regiEdit.jsp">
    	    <jsp:param value="" name=""/>
        </jsp:include>
		
      </div>
   </div>
   
   <!--  예약 확인 -->
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
    <!-- 즐겨찾기 관리 -->
 <div class="modal hide fade" id="theModalFavorite" style="width:350px ; height: 450px;">
   <div class="modal-header"> 
  
   <h3 align="center">즐겨찾기 관리</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     
           <jsp:include page="favorite.jsp">
                 <jsp:param value="" name=""/>
                </jsp:include>

      
      </div>
   </div>

  </body>
</html>