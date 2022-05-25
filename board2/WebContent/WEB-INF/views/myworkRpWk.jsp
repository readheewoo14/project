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
			<div style="margin-inline:30px;height: 80px;background-color:#d1d7ed6b;padding-top: 20px;padding-bottom: 100px;margin-top: 10px;">
				<table style="border-collapse: separate;border-spacing: 10px;">
					<tr>
						<th style="width:80px;text-align:right">제목</th>
						<td style="width:200px">
							<input id="subjectSch" style="width:150px"/>
						</td>
						<th style="width:80px;text-align:right">부서</th>
						<td style="width:200px">
							<input id="deptCdSch" style="width:80px;border-width: thin;background-color:#80808021" readonly/>
							<input id="deptNmSch" style="width:90px" />
						</td>
						<th style="width:80px;text-align:right">작성자</th>
						<td style="width:200px">
							<input id="createCdSch" style="width:80px;border-width: thin;background-color:#80808021" readonly/>
							<input id="createNmSch" style="width:90px" />
						</td>
						<th style="width:80px;text-align:right"></th>
						<td style="width:200px">
						</td>
						<td rowspan="2">
							<button type="button" class="btn btn-primary" style="margin-left:100px;width:120px" onclick="getList()">검색</button>
						</td>
					</tr>
					<tr>
						<th style="width:80px;text-align:right">금주운영<br/> 업무내용</th>
						<td style="width:200px" colspan="3">
							<input id="weekRpJobCtSch" style="width:500px"/>
						</td>
						<th style="width:80px;text-align:right">삭제여부</th>
						<td style="width:200px">
							<input type="checkbox" id="deleteYnSch" name="deleteYnSch" />
						</td>
					</tr>
				</table>
			</div>
			<div style="margin-inline: 30px;background-color:#d1d7ed6b;padding-top: 10px;padding-bottom: 80px;padding-right: 10px;padding-left: 10px;margin-top:10px">
				<div style="margin-inline:30px;margin-top:15px">
					<h4 style="font-weight: bold;"><span style="font-size:23px">주간업무</span></h4>
					<div style="margin-top:30px;">
						<span style="float: right;;font-size:20px;margin-right:3px;margin-left:10px;">total(<span id="weekTotal">0</span>)</span>
					</div>
					<div id="grid1"></div>
					<div style="float:right;margin-top:10px;margin-right:10px">
						<button type="button" class="btn btn-primary" id="weekUpdate"  style="width:100px">수정</button>
						<button type="button" class="btn btn-primary" id="weekDel"  style="width:100px">삭제</button>
					</div>
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
					el : document.getElementById('grid1'),
					data : gridData,
					bodyHeight : 500,
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
				var createId = $('#createCdSch').val();
				var deptCode = $('#deptCdSch').val();
				var subject = $('#subjectSch').val();
				var weekRpJobCt = $('#weekRpJobCtSch').val();
				var deleteYn = document.getElementById('deleteYnSch').checked === true ? 'Y' : 'N';
				
				var param = {
					subject: subject,
					deptCode: deptCode, 
					createId: createId,
					weekRpJobCt: weekRpJobCt,
					deleteYn: deleteYn,
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
						$('#weekTotal').text(gridData.length);
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