<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_name = (String)session.getAttribute("s_name");
	//out.print(s_name);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골목식당</title>
<script type="text/javascript" src="./commons.js"></script>
	<style type="text/css">
		div#d_resList {
			border: thin dotted red;
			padding: 5px;
			text-align: left;
		}
	</style>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-FKKja8sdfgMggjEvEa5agaP6D9wBd6s"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script type="text/javascript">
		function fun(){
			alert("호출");
			$('#dial_memberList').dialog('refresh','memberList.mvc3?crud=memberList');
		}
		var c_name = null;
		function memINSERT(){
			alert("저장");
		}	
		
		function mem_select(){
			$('#dial_memberList').dialog('refresh','memberList.mvc3?crud=memberList');
		}
		function mem_insert(){
			alert("mem_insert()");
			
			cmm_window_popup('memberInsert.jsp', 400,500, '회원 등록');
			
			
		}
		function mem_update(){
			alert("mem_update()");
		}
		function mem_delete(){
			alert("mem_delete()");
		}
		function memberList(){
			/*  	$("#d_memberList").datagrid({
					url:"memberList.mvc3?crud=memberList"
				  , columns:[[
				        {field:'MEM_ID',title:'아이디',width:100},
				        {field:'MEM_NAME',title:'회원명',width:100},
				        {field:'MEM_EMAIL',title:'이메일',width:200}
				    ]]
				}); */
			 	
			 	$('#dial_memberList').dialog({
				    title: '회원 목록',
				    width: 400,
				    height: 400,
				    closed: false,
				    cache: false,
				    href: 'memberList.jsp',
				    modal: true
				    ,toolbar : toolbar
				    ,align:'center'
				    ,halign:'center'
				});
		}
		function login(){
			$("#f_login").attr("method", "get");
			$("#f_login").attr("action", "login.mvc3?crud=login");
			$("#f_login").submit();
		}
		function logout(){
			location.href="logout.jsp";
		}
		function like(u_num){
			$.ajax({
				url: 'likeAction.jsp?res_num='+u_num
				,method: 'get'
				,success: function(data){
					if(data==1){
						fetch('jsonMapList.jsp',{
							method:"post"
						}).then(res => res.text()).then(function(text){
							var imsi = text.trim();
							var resDoc = JSON.parse(imsi);
							var resList = '<table>';
							for(var i=0; i<resDoc.length; i++){
								resList += '<tr><td>';
								resList += resDoc[i].res_name+'<br>';
								resList += '<img src=like.png width=20 height=20/>'+resDoc[i].res_like;
								resList += '&nbsp;&nbsp;&nbsp;';
								//resList += '<br>';
								resList += '<img src=hate.png width=20 height=20/>'+resDoc[i].res_hate;
								resList += '</tr></td>';
							}
							resList += '</table>';
							$("#d_resList").html(resList);
						});//end of fetch
					}//오라클 서버에 반영이 되었을때.
				}//end of success
			});// end of ajax
		}// end of like
		function hate(u_num){
			$.ajax({
				url: 'hateAction.jsp?res_num='+u_num
				,method: 'get'
				,success: function(data){
					if(data==1){
						fetch('jsonMapList.jsp',{
							method:"post"
						}).then(res => res.text()).then(function(text){
							var imsi = text.trim();
							var resDoc = JSON.parse(imsi);
							var resList = '<table>';
							for(var i=0; i<resDoc.length; i++){
								resList += '<tr><td>';
								resList += resDoc[i].res_name+'<br>';
								resList += '<img src=like.png width=20 height=20/>'+resDoc[i].res_like;
								resList += '&nbsp;&nbsp;&nbsp;';
								resList += '<img src=hate.png width=20 height=20/>'+resDoc[i].res_hate;
								resList += '</tr></td>';
							}
							resList += '</table>';
							$("#d_resList").html(resList);
						});//end of fetch
					}//오라클 서버에 반영이 되었을때.
				}//end of success
			});// end of ajax
		}//end of hate
	</script>
</head>
<body>

<table border="1" align="center" width="900" height="600">
	<tr>
		<td width="700">
		<div id="d_map" style="width:700px; height:600px;"></div>
		</td>
		<td width="200" valign="top">
	<%
		if(s_name == null){
	%>		
<!--======================== 로그인 화면 시작 ======================-->		
		<div id="d_login">
			<form id="f_login">
			<input type="hidden" name="crud" value="login">
			<table width="100%" border="0" borderColor="blue">
				<tr>
					<td>
					<input id="tb_id" name="mem_id" class="easyui-textbox" prompt="아이디" data-options="iconCls:'icon-man'" style="width:120px">
					</td>
					<td rowspan="2">
					<a id="btn" href="javascript:login()" class="easyui-linkbutton">로그인</a>					
					</td>
				</tr>
				<tr>
					<td>
					<input id="tb_pw" name="mem_pw" class="easyui-passwordbox" prompt="비밀번호" iconWidth="28" style="width:120px;padding:10px">
					</td>
				</tr>
			</table>
			</form>
		</div>
<!--====================== 로그인 화면  끝  ======================-->		
	<%
		}
		else {
	%>
<!--======================== 로그아웃 화면 시작 ======================-->		
		<div id="d_logout">
			<form id="f_logout">
			<table width="100%" border="0" borderColor="blue">
				<tr>
					<td style="width:110px">
						<span id="d_logok"><%=s_name %>님 환영합니다.</span>					
					</td>
					<td>
						<a id="btn_logout" style="width:80px" href="javascript:logout()" class="easyui-linkbutton">로그아웃</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
<!--====================== 로그 아웃 화면  끝  ======================-->		
	<%
		}
	%>
	<!-- ===========================업무 목록 시작============================= -->
	 <div class="easyui-panel" style="padding:5px">
        <ul class="easyui-tree">
            <li data-options="state:'opened'">
                <span>회원관리</span>
                <ul>
                    <li>
                        <span>회원가입</span>
                    </li>
                    <li>
                        <span>정보수정</span>
                    </li>
                    <li>
                        <span>회원탈퇴</span>
                    </li>
                    <li>
                        <span><a href = "javascript:memberList();">회원목록</a></span>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
	<!-- ===========================업무 목록 끝============================= -->
<!--====================== 식당 목록 시작  ======================-->		
	<div id="d_resList">식당 목록</div>
<!--====================== 식당 목록 끝  ======================-->	
		<!-- modal 창에 필요한 코드 시작 -->
	<div id="dial_memberList"></div>
	<div id="dial_memberInsert"></div>
		<!-- <div id="d_memberList"></div> -->	
	<!-- 	<div id="tb_memberList">
			<a href="javascript:mem_select()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,text:'조회'"></a>
			<a href="javascript:mem_insert()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,text:'등록'"></a>
			<a href="javascript:mem_update()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,text:'수정'"></a>
			<a href="javascript:mem_delete()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true,text:'삭제'"></a>
	</div>	 -->
   <script type="text/javascript">
        var toolbar = [{
            text:'Add',
            iconCls:'icon-add',
            handler:function(){mem_insert()}
        },'-',{
            text:'Cut',
            iconCls:'icon-cut',
            handler:function(){mem_delete()}
        },'-',{
            text:'Edit',
            iconCls:'icon-edit',
            handler:function(){mem_update()}
        },'-',{
            text:'Search',
            iconCls:'icon-search',
            handler:function(){mem_select()}
        }];
        var tb_insert = [{
            text:'저장',
            iconCls:'icon-add',
            handler:function(){memINSERT()}
        },'-',{
            text:'Cut',
            iconCls:'icon-cut',
            handler:function(){mem_delete()}
        },'-',{
            text:'Edit',
            iconCls:'icon-edit',
            handler:function(){mem_update()}
        }];
    </script>
    		
		<!-- modal 창에 필요한 코드 끝 -->
	<script type="text/javascript">
		$(document).ready(function(){
		var map = new google.maps.Map(document.getElementById('d_map'),{
			 zoom: 14
		    ,center: new google.maps.LatLng(37.478513,126.877800)
		    ,mapTypeId: google.maps.MapTypeId.ROADMAP
		});////////////end of map
		var infowindow = new google.maps.InfoWindow();//말풍선을 클릭했을 때 열리는 창
		var marker;//5개가 출력(json으로 스캔-jsonMapList.jsp)
		var i;//마커 생성시 부여한 인덱스값 0~4
		$.ajax({
			url: 'jsonMapList.jsp'
		   ,dataType: 'json'
		   ,success:function(data){
			   //alert(data);
			   //$("#d_map").text(data);[object Object]
			   //insert here
			   var result = JSON.stringify(data);//직관적인 정보로 변환(구조체-덩어리)-알아봄.
			   //$("#d_map").text(result);
			   var jsonDoc = JSON.parse(result);//배열로 전환-다시 객체화처리됨.(배열)
			   for(var i=0;i<jsonDoc.length;i++){
				   //alert(jsonDoc[i].res_name);//배열.속성이름으로 꺼낸다.
				   marker = new google.maps.Marker({
					  id: i//0,1,2,3,4 - 마커의 인덱스 정보
					  //포지션값도 배열로 변경됨.
					 ,position: new google.maps.LatLng(jsonDoc[i].lat,jsonDoc[i].lng)
				     ,map: map//지도는 하나
				     ,title: jsonDoc[i].res_name// 마커가 5개이므로 식당이름 5개 분류
				   });////////////////end of marker
				   //마커 5개가 for문 안에서 객체 생성되니까 이벤트도 안에서 건다.
				   google.maps.event.addListener(marker, 'click',(function(marker,i){
					//addListener 함수의 리턴값이 변수가 아닌 함수임.  
					//자바스크립트에서는 값에 싱글 쿼테이션이나 더블 쿼테이션이 없으면 변수로 취급하여
					//undefine XXXX 오류 메시지 출력
					   return function() {//함수의 결과는 윈도우창을 열어줌.(click된 마커마다 다르게)
						var content = '<b>식당이름: '+jsonDoc[i].res_name+'</b>';
						content += '<br>';
						content += '<b>전화번호: '+jsonDoc[i].res_tel+'</b>';
						content += '<br>';
						content += '좋아요<a href="javascript:like('+jsonDoc[i].res_num+')"><img src=like.png width:20 height:20/></a>';
						content += '&nbsp;&nbsp;&nbsp;';
						content += '싫어요<a href="javascript:hate('+jsonDoc[i].res_num+')"><img src=hate.png width:20px height:20/></a>';
						infowindow.setContent(content);
						infowindow.open(map,marker);
					   }//end of 반환함수
				   })(marker,i));////////////end of addLitener
				   //마커를 생성했을때 click이벤트 처리하기
				   if(marker){//자바스크립트 에서는 0이 아니면 모두 true
					   marker.addListener('click', function(){
						  map.setZoom(16);//상세보기 처리(14->15)
						  map.setCenter(this.getPosition());
					   });
				   }/////////////////////////end of if
			   }///////////////end of for
		   }///////////////////end of success
		});////////////////////end of ajax
		});////////////////////end of ready
	</script>
	<!-- ========================메인 페이지 코드 끝 ================================= -->
<!-- 	<script type="text/javascript">
	$('#dial_memberList').dialog({
	    title: '회원 목록',
	    width: 400,
	    height: 200,
	    closed: true,
	    cache: false,
	    href: './memberList.jsp',
	    modal: true
	});
	</script>	 -->
	<!-- ========================메인 페이지 코드 끝 ================================= -->
</body>
</html>