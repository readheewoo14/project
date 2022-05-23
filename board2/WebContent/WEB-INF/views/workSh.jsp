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
		<div id="main" >
			<div style="margin-inline:30px;margin-top:30px;height: 80px;background-color:#d1d7ed6b;padding-top: 20px;">
				<table>
					<tr>
						<th style="width:100px;text-align:center">작성자</th>
						<td style="width:200px">
							<input id="imsi1" style="width:150px"/>
						</td>
						<th style="width:100px;text-align:center">제목</th>
						<td style="width:200px">
							<input id="imsi2" style="width:150px"/>
						</td>
						<th style="width:100px;text-align:center">결재상태</th>
						<td style="width:200px">
							<input id="imsi3" style="width:150px"/>
						</td>
						<th style="width:100px;text-align:center"></th>
						<td style="width:200px">
						</td>
						<td>
							<button type="button" class="btn btn-primary" style="margin-left:150px">SEARCH</button>
						</td>
					</tr>
				</table>
			</div>		
			<div style="margin-inline: 30px;background-color:#d1d7ed6b;padding-top: 10px;padding-bottom: 80px;padding-right: 10px;padding-left: 10px;margin-top:30px">
				<div style="margin-inline:30px;margin-top:40px;">
					<h4 style="font-weight: bold;"><span style="font-size:23px">업무공유</span><span style="float:right;margin-right:10px;">total(<span id="total">0</span>)</span></h4>
					<div id="grid"></div>
				</div>
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
					el : document.getElementById('grid'),
					data : gridData,
					bodyHeight : 500,
					scrollX : false,
					scrollY : false,
					rowHeaders: ['rowNum'],
					columns : [ 
						{header : '작성자'  , name : 'email' }
						, {header : '제목' 	, name : 'password'}
						, {header : '내용'    , name : 'password'}
						, {header : '결재상태' , name : 'password'}
					]
				});
				
			}
			
			//그리드 생성
			function getList() {
				var param = {
				
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
						
						grid1.resetData(gridData);
						$('#total').text(gridData.length);
						
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