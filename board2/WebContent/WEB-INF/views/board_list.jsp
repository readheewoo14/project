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
		    min-width: 70%;
		    max-width: 70%;
		    min-height: 100vh;
		    z-index:0;
		    float: right
		}
		</style>
		<title>Board</title>
	</head>
	<body>
		<c:import url="side_bar.jsp"></c:import>
		<c:import url="nav_top.jsp"></c:import>
		<div id="main">
			<div style="margin-inline: 30px;">
				<h3>로그인 테이블 정보</h3>
				<div id="grid"></div>
			</div>
		</div>	
	
		<script type="text/javascript">
			$(document).ready(function() {
				// 최초 그리드 생성
				drawGrid();
				// 최초 조회 
				getList();
				
				
			});
			var grid;
			var gridData = [];
			
			//그리드 생성
			function drawGrid() {
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : gridData,
					scrollX : false,
					scrollY : false,
					columns : [ {
						header : 'EMAIL',
						name : 'email'
					}, {
						header : 'PASSWORD',
						name : 'password'
					}]
				});
			}
			
			//그리드 생성
			function getList() {
				var param = {
					email: 'test',
					password: '1111',
				};
				
				$.ajax({
					url: '${pageContext.request.contextPath}/getBoardList', //주소
					data: JSON.stringify(param), //전송 데이터
					type: "POST", //전송 타입
					async: true, //비동기 여부
					timeout: 5000, //타임 아웃 설정
					dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
					contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
					    			
					// [응답 확인 부분 - json 데이터를 받습니다]
					success: function(response) {
						gridData = response.boardList;
						grid.resetData(gridData); 
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