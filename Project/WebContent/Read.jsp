<%@page import="com.mysql.fabric.xmlrpc.base.Value"%>
<%@page import="model.replyDto"%>
<%@page import="model.businessDto"%>
<%@page import="model.busi_tableDto"%>
<%@page import="model.memberDto"%>
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
 
 <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 
 <script> 
  function initialize() { 
     bname =document.getElementById("b_name").value;
     baddr =document.getElementById("b_addr").value;
     xpos = document.getElementById("xpos").value;
     ypos = document.getElementById("ypos").value;
  var myLatlng = new google.maps.LatLng(ypos, xpos); 
  var mapOptions = { 
        zoom: 17, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
  var marker = new google.maps.Marker({ 
      
     position: myLatlng, 
      map: map, 
      title: bname 
}); 
  
//   var contentString = '<div id="content">'   
//   + '<div id="siteNotice">'   
//   + '</div>'   
//   + '<h1 id="firstHeading" class="firstHeading">'+bname+'</h1>'   
//   + '<div id="bodyContent">' 
//   + '<b>==========================================================</b>'
//   + '<p><b><h2>�ּ�</h2></b><h4>'+baddr+'</h4>'
//   + '</div>' 
//   + '</div>'; 

  var infowindow = new google.maps.InfoWindow( 
            { 
            	content: contentString
              //content: "<h1>"+bname+"</h1>", 
              //maxWidth:  
            } 
  ); 

  google.maps.event.addListener(marker, 'click', function() { 
   infowindow.open(map, marker); 
  }); 

  } 
  function reservation(){
     var f = document.f3;
       f.business_no.value= document.getElementById("business_no").value;
     f.member_name_reservation.value = document.getElementById("member_name_reservation").value;
     f.member_phone_reservation.value = document.getElementById("member_phone_reservation").value;
     f.content.value= document.getElementById("member_content").value;
     f.action = "project";
     f.method="post";
     f.submit();
     alert("����Ǿ����ϴ�.");
            
      }
  function page(){
	  history.back();
  }
  
  function favorites(){
      var fff = document.f4;
      fff.business_no_favorite.value = document.getElementById("business_no_favorite").value;
      fff.business_name_favorite.value = document.getElementById("business_name_favorite").value;
      fff.member_no_favorite.value = document.getElementById("member_no_favorite").value;
      fff.action = "project";
      fff.method = "post";
      fff.submit();
}

  
 </script>   
</head>
<!-- ��Ÿ�� -->
    <link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }
   .image{
      position:relative;
      float:left;
   }
   .image.text{
      position:absolute;
      top:80px;
      left:80px;
      width:700px;
   }
      /* ��ü ������ ���� */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* �ٽ� ������ ������ ���� ��ư */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* �μ����� ������ ���� */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>

 <body onload="initialize()">

<jsp:include page="Title.jsp">
<jsp:param value="a" name="a"/>
</jsp:include>

         
<div class="container" id="section01">
   <div class="row">
      <div class="span11">         
    <div class="container-narrow">

      <div class="masthead">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">�빮</a></li>
          <li><a href="#">�Ұ�</a></li>
          <li><a href="#">����ó</a></li>
        </ul>
        <h3 class="muted">������Ʈ��</h3>
      </div>

      <hr>
      <jsp:useBean id="dao" class="model.businessDao"/>
<jsp:useBean id="xypos" class="model.businessDto"/>


<%
	int num = Integer.parseInt(request.getParameter("num"));
   
   xypos = dao.getPos(num);
   System.out.println("num: ��"+num+","+xypos.getBusiness_xpos()+"xypos �� !!! ");
%>
      <jsp:useBean id="mdao" class="model.memberDao"/>
      <jsp:useBean id="bdao" class="model.busi_tableDao"/>
      <jsp:useBean id="bbdao" class="model.businessDao"/>
<% 
   String member_id = (String)session.getAttribute("member_id");
   System.out.println(member_id+"�ڡڡڡڡڡڡڡڡڡ�id�ڡڡڡڡڡڡڡڡڡڡ�");
   Vector list = dao.getContent(num, "read");
   memberDto dto = mdao.getMemberRead(member_id);
   businessDto bdto = bbdao.getBusinessRead(num);
%>
<%! 
	int totalRecord = 0;		// ��ü ���� ����
	int numPerPage = 5;			// �� �������� ������ ���� ����
	int pagePerBlock = 3;		// �� ���� ������ ��
	int totalPage = 0;			// ��ü ������ ��
	int totalBlock = 0;			// ��ü �� ��
	int nowPage = 0;			// ���� ������ ��ȣ
	int nowBlock = 0;			// ���� �� ��ȣ
	int beginPerPage = 0;		// �������� ���� ��ȣ
%>
<jsp:useBean id="rrrrdao" class="model.replyDao"/>
<%
	Vector rrrrlist = rrrrdao.getReplyList(member_id, num);
	
	// ����¡ ��� ����
	totalRecord = rrrrlist.size(); 
	totalPage = (int)Math.ceil(((double)totalRecord / numPerPage));
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		
	beginPerPage = nowPage * numPerPage;
		
	totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
%>
<input type="hidden" id="xpos" value="<%=xypos.getBusiness_xpos()%>"/>
 <input type="hidden" id="ypos" value="<%=xypos.getBusiness_ypos()%>"/>
 <input type="hidden" id="b_name" value="<%=xypos.getBusiness_name()%>"/>
 <input type="hidden" id="b_addr" value="<%=xypos.getBusiness_addr()%>"/>
      <div class="jumbotron">
        
        <!-- ȸ��������
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/<%= num%>.jpg" class="img" >
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item">
          <img src="img/00<%= num%>.jpg" class="img" >
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
      </div>
<jsp:useBean id="data" class="business.data"/>
      <p class="lead"> 
      <%! String data1 = ""; %>
      <%
      
      if(num == 1){
      		data1 = data.getData1();}
      else if(num == 2){
      		data1 = data.getData2();}
      else if(num == 3){
    		data1 = data.getData3();}
      else if(num == 4){
    		data1 = data.getData4();}
      else if(num == 5){
    		data1 = data.getData5();}
      else if(num == 6){
    		data1 = data.getData6();}
      else if(num == 7){
    		data1 = data.getData7();}
      
      %><%=data1 %>
       <br/> <br/> ����ó: <%=list.get(1) %>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="en-font-family">&lsaquo;</span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="en-font-family">&rsaquo;</span></a>
    </div><!-- /.carousel -->
        
      </div>

      <hr>
<div class="container">
   <div class="row" id="Section02">
      <div class="span9" > 


   <table border="1" width="600" height="10" align="center">

</table>
</div>
</div>
</div>
<script src="js/jquery-2.1.4.js"></script>
<script type="text/javascript">
	$(document).ready( function() {
		$('#Section02').load('ReadReference'+<%=num%>+'.jsp?num='+<%=num%>);
		refresh();
	});
	
	function refresh()
	{
		setInterval( function() {
			$('#Section02').load('ReadReference'+<%=num%>+'.jsp?num='+<%=num%>).fadeIn('slow');
		}, 300);	
	}
</script>
<hr>
      <div class="footer" id="section03">
        <h3>���ô� ��</h3>
       <%=xypos.getBusiness_name() %> &nbsp; <%=xypos.getBusiness_addr() %>
        <p align="right">
        <a href="http://map.naver.com/?mid=bl0115124858">ũ�Ժ���</a>|<a href="http://map.naver.com/?mid=bl0115124858&mroute=1">��ã��</a>
        </p>
      <div id="map_canvas"style="width:850px; height:500px;" align="center"/>
      </div>
    </div> <!-- /container -->
    </div>
    </div>





     <div class="span1">
     <br/><br/><br/>
<% String boardpage = request.getParameter("page");
%>
          <div class="theScrollSpy"><!-- target�� �޾Ƽ� ������ �ӽ÷� Ŭ���� �̸��� ���� ��� -->
            <ul class="nav nav-pills nav-stacked affix">
               <h5>������</h5>
               <li><a href="#ReadModal" data-toggle="modal">�����ϱ�</a></li>
               <li><a href="#ReadFavorite" data-toggle="modal">���ã�� �߰�</a></li>
               <li><a href="#section01">ó������</a></li>
               <li><a href="#section02">�ڸ�</a></li>
               <li><a href="#section03">���ô±�</a></li>
               <li><a href="javascript:page()">�ڷ� ����</a>
            </ul>
         </div>
   </div>
       </div>

   <div class="modal hide fade" id="ReadModal" style="width: 270px">
      <div class="modal-header">
         <a href="#" class="close" data-dismiss="modal">&times;</a>
         <img src="img/login.PNG" />
      </div>
      <div class="modal-body">
         <form name=f3>
         <input type="hidden" name="business_no" value=<%=num %> id="business_no" />
         <input type="hidden" name="cmd" value="reservation" />   
         <h3>����</h3>
         <input type="text"  name="member_name_reservation"  id ="member_name_reservation"  value="<%=dto.getMember_name() %>" /><br />
         <input type="text"  name="member_phone_reservation"  id="member_phone_reservation"  value="<%=dto.getMember_phone() %>"  /><br />
         <textarea rows="3" placeholder="�����Ͻǳ�¥/�ð�-�����-���� " name="content" id="member_content"></textarea>
       <br/>
         <button type="button" class="btn" onclick="reservation()">�����ϱ�</button>
         <button class="btn" data-dismiss="modal" aria-hidden="true">���</button>
       </form>
      </div>
   </div>
  <!-- ���ã��  -->

   <div class="modal hide fade" id="ReadFavorite" style="width: 270px">
      <div class="modal-header">
         <a href="#" class="close" data-dismiss="modal">&times;</a>
      </div>
      <div class="modal-body">
         <form name=f4>
            <input type="hidden" name="business_no_favorite" value=<%=num %> id="business_no_favorite" /> 
            <input type="hidden" name="member_no_favorite" value=<%=dto.getMember_no()%> id="member_no_favorite" /> 
               <input type="hidden" name="cmd" value="favorite" />
            <h3>���ã�⸦ �߰��մϴ�.</h3>
            <h4>��ü�Ͻ÷��� ���ã�� ���� ���� �����ʽÿ�.</h4>
            <br/>
             <input type="text" name="business_name_favorite" id="business_name_favorite" value="<%=bdto.getBusiness_name() %>" /><br />
            <button type="button" class="btn" onclick="favorites()">�߰��ϱ�</button>
            <button class="btn" data-dismiss="modal" aria-hidden="true">���</button>
         </form>
      </div>
   </div>
 <!-- ��۵�� -->
<center><h2>�� </h2>
<form name="post" method="post" action="reply_proc.jsp" >
	<input type="hidden" name="member_id" value="<%=member_id %>"/>
	<input type="hidden" name="business_no" value="<%=num %>"/>
	<textarea style="width:50%; height:100%;" name="reply_content" rows="2" cols="100"></textarea>
	<input type="submit" value="���" >
</form> 



<!-- ��� ��� -->
<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=left colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0 class="table table-striped">
			
	<% if(rrrrlist.size() == 0){ %>
			<b>��ϵ� ���� �����ϴ�.</b>
	<%
		}
		else{
			for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
				if(i == totalRecord)
					break;
				replyDto rrrrdto = (replyDto)rrrrlist.get(i);
	%>
			<tr >
				<td><font size="5"><%=member_id%></font>&nbsp;&nbsp;&nbsp;<%=rrrrdto.getReply_date()%></td>
			</tr>
			<tr>
				<td><%=rrrrdto.getReply_content()%></td>
			</tr>
	<%
			}
		}
	%>
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td>

		<a href="Read.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>&num=<%=num%>">���� <%=pagePerBlock%>��</a> ::: &nbsp;&nbsp;
	<%
		for(int i=0; i<pagePerBlock; i++){
			if((nowBlock * pagePerBlock)+i == totalPage)
				break;
	%>
			<a href="Read.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i%>&nowBlock=<%=nowBlock%>&num=<%=num%>">
				<%=i+1+(nowBlock * pagePerBlock)%></a>&nbsp;&nbsp;
				
	<%
		}
	%>
	<% if(totalBlock > nowBlock+1) { %>
		&nbsp;&nbsp; ::: <a href="Read.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>&num=<%=num%>">���� <%=pagePerBlock%>��</a>
	<% } %>
	</td>
</tr>
</table>



</center>
    <!-- �ڹٽ�ũ��Ʈ
    ================================================== -->
    <!-- �������� ���� �о���̵��� ���� �������� ��ġ -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>

  </body>
</html>