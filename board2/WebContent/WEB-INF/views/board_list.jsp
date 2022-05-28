<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/include.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
		#main {
		    min-width: 85%;
		    max-width: 85%;
		    min-height: 80vh;
		    z-index:0;
		    float: right
		}
		</style>
		<title>MINI-PROJECT</title>
	</head>
	<body style="background-color:#c7cce76b">
		<c:import url="side_bar.jsp"></c:import>
		<c:import url="nav_top.jsp"></c:import>
		<div id="main">
			<div style="margin-inline: 30px;padding-top: 10px;padding-bottom: 20px;padding-right: 10px;padding-left: 10px;margin-top:3px">
				<h4 style="font-weight: bold;"><span style="font-size:23px">주간 업무 보고</span><span style="float:right;margin-right:10px;">total(<span id="weekTotal">0</span>)</span></h4>
				<div id="grid1"></div>
			</div>
			<div style="margin-inline: 30px;padding-top: 10px;padding-bottom: 20px;padding-right: 10px;padding-left: 10px;margin-top:3px">
				<h4 style="font-weight: bold;"><span style="font-size:23px">월간 업무 보고</span><span style="float:right;margin-right:10px;">total(<span id="monthRpTotal">0</span>)</span></h4>
				<div id="grid2"></div>
			</div>
		</div>	
	
		<script type="text/javascript">
			$(document).ready(function() {
				// 최초 그리드 생성
				drawGrid();
				// 최초 조회 
				getList();
				
				
			});
			var grid1;
			var gridData = [];
			
			//그리드 생성
			function drawGrid() {
				grid1 = new tui.Grid({
					el : document.getElementById('grid1'),
					data : gridData,
					bodyHeight : 320,
					scrollX : false,
					scrollY : false,
					rowHeaders: ['rowNum'],
					columns : [ 
						{header : '작성자'   , name : 'createId' , width: 200, align: 'center'}
						, {header : '부서'  , name : 'deptNm'   , width: 200, align: 'center'}
						, {header : '제목'  , name : 'subject', align: 'left'}
						, {header : '금주운영업무내용'  , name : 'weekRpJobCt' , align: 'left'}
					]
				});
				
				grid2 = new tui.Grid({
					el : document.getElementById('grid2'),
					data : gridData,
					bodyHeight : 320,
					scrollX : false,
					scrollY : false,
					rowHeaders: ['rowNum'],
					columns : [ 
						{header : '작성자'   , name : 'createId' , width: 200, align: 'center'}
						, {header : '부서'  , name : 'deptNm'   , width: 200, align: 'center'}
						, {header : '제목'  , name : 'subject', align: 'left'}
						, {header : '금주운영업무내용'  , name : 'weekRpJobCt' , align: 'left'}
					]
				});
			}
			
			//그리드 생성
			function getList() {
				var param = {
					email: 'test',
					password: '1111',
				};
				
				$.ajax({
					url: '${pageContext.request.contextPath}/getWeekJobList', //주소
					data: JSON.stringify(param), //전송 데이터
					type: "POST", //전송 타입
					async: true, //비동기 여부
					timeout: 5000, //타임 아웃 설정
					dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
					contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
					    			
					// [응답 확인 부분 - json 데이터를 받습니다]
					success: function(response) {
						gridData = response.boardList;
						
						grid1.resetData(gridData); 
					},
					    			
					// [에러 확인 부분]
					error: function(xhr) {
						   				
					},
					    			
					// [완료 확인 부분]
					complete:function(data,textStatus) {
						    				
					}
				});		
			}
			
		</script>
	</body>
</html>