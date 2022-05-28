<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			
			th {
			    font-size: 18px;
			}
			
			td, th {
			    padding: 24px;
			}
		    
		    table {
				border-spacing: 30px;
		    }
		    
		</style>
		<title>MINI-PROJECT</title>
	</head>
	<body style="background-color:#c7cce76b">
		<c:import url="side_bar.jsp"></c:import>
		<c:import url="nav_top.jsp"></c:import>
		<div id="main">
			<div style="margin-inline:30px;margin-top:30px;height: 1100px;background-color:#d1d7ed6b;padding-top: 20px;">
				<div style="margin-inline:30px;">
					<select id="dropDownSj" style="margin-inline:30px;" onchange="changeTextSubject()">
						<option value="1">주간</option>
						<option value="2">월간</option>
					</select>
					
					<div style="float:right">
						<button class="btn btn-primary" onclick="setReportImsi()">임시저장</button>
						<button class="btn btn-primary" onclick="setReport()">저장</button>
						<button class="btn btn-primary" onclick="test()">테스트</button>
					</div>
					
					<h3 id="subject" style="text-align: center;">주간업무보고</h3>
					<table style="border-collapse: separate;border-spacing:10px;">
						<tr>
							<th style="text-align: left;width:150px">부서명</th>
							<td>
								<div class="search">
									<input id="deptCd" style="width:80px;border-width: thin;background-color:#80808021" readonly/>
									<input id="deptNm" style="width:120px" />
									<img style="width: 15px;margin-top: -3px;cursor:hand" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
							</td>
						</tr>
						<tr>
							<th style="text-align: left;width:150px">작성자</th>
							<td>
								<div class="search">
									<input id="createCd" style="width:80px;border-width: thin;background-color:#80808021" readonly/>
									<input id="createNm" style="width:120px" />
									<img style="width: 15px;margin-top: -3px;cursor:hand" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
							</td>
						</tr>
						<tr>
							<th style="text-align: left;width:150px">작성일자</th>
							<td>
								<input id="createDate"  style="width:205px" readonly/>
							</td>
						</tr>
					</table>
				</div>	
				<div style="margin-inline:30px;height:800px;">
					<table style="border-collapse: separate;border-spacing:10px;width:100%;height: 100%;">
						<tr>
							<th style="text-align: center;width:8%">구분</th>
							<th style="text-align: center;width:35%">금주업무내용</th>
							<th style="text-align: center;width:35%">차주업무내용</th>
						</tr>
						<tr>
							<th style="text-align: left;vertical-align: top;">운영</th>
							<td style="text-align: center;vertical-align: top;">
								<textarea id="weekRpJobCt" style="width:100%;height: 100%;"></textarea>
							</td>
							<td style="text-align: center;vertical-align: top;">
								<textarea id="nxWeekRpJobCt" style="width:100%;height: 100%;"></textarea>
							</td>
						</tr>
						<tr>
							<th style="text-align: left;vertical-align: top;">기획</th>
							<td style="text-align: center;vertical-align: top;">
								<textarea id="weekPlJobCt" style="width:100%;height: 100%;"></textarea>
							</td>
							<td style="text-align: center;vertical-align: top;">
								<textarea id="nxWeekPlJobCt" style="width:100%;height: 100%;"></textarea>
							</td>
						</tr>
						<tr>
							<th style="text-align: left;vertical-align: top;">특이사항<br/>(휴가/출장/기타)</th>
							<td style="text-align: center;vertical-align: top;height: 350px;" colspan="2">
								<textarea id="etcCt" style="width:100%;height: 100%;"></textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>	
		</div>	
	
		<script type="text/javascript">
			var changeSubject = '';
			var date = '';
		
			$(document).ready(function() {
				$('#sidebar').css('min-height', '130vh');
				var today = new Date();
				var year = today.getFullYear();
				var month = (today.getMonth() + 1).length > 1 ? today.getMonth() + 1 : '0'+ String(Number(today.getMonth()) + 1);
				var day = today.getDate();
				
				date = year + '-' + month + '-' + day;
				
				$('#createDate').val(date);
				
			});
			
			function changeTextSubject() {
				changeSubject = $('#dropDownSj').val();
				
				if(changeSubject === '1'){
					$('#subject').text('주간업무보고');
				}else{
					$('#subject').text('월간업무보고');
				}
			}
			
			//저장
			function setReport() {
				var flag = $('#dropDownSj').val();
				
				//추후 가져오는값 코드로 변경
				var deptCode = $('#deptNm').val();
				var createId = $('#createNm').val();
				
				var createDate = $('#createDate').val();
				var weekRpJobCt = $('#weekRpJobCt').val();
				var nxWeekRpJobCt = $('#nxWeekRpJobCt').val();
				var weekPlJobCt = $('#weekPlJobCt').val();
				var nxWeekPlJobCt = $('#nxWeekPlJobCt').val();
				var etcCt = $('#etcCt').val();
				var subject = flag === '1' ? '주간업무보고' : '월간업무보고';
				
				
				var param = {
					subject: subject,
					deptCode: deptCode, 
					createId: createId,
					weekRpJobCt: weekRpJobCt,
					nxWeekRpJobCt: nxWeekRpJobCt,
					weekPlJobCt: weekPlJobCt,
					nxWeekPlJobCt: nxWeekPlJobCt,
					etcCt: etcCt,
					subject: subject,
				};
				
				if (!confirm("저장하시겠습니까?")) {
					return;
		        } 
				
				$.ajax({
					url: '${pageContext.request.contextPath}/setReport', //주소
					data: JSON.stringify(param), //전송 데이터
					type: "POST", //전송 타입
					async: true, //비동기 여부
					timeout: 5000, //타임 아웃 설정
					dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
					contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
					    			
					// [응답 확인 부분 - json 데이터를 받습니다]
					success: function(response) {
						
					},
					    			
					// [에러 확인 부분]
					error: function(xhr) {
						   				
					},
					    			
					// [완료 확인 부분]
					complete:function(data,textStatus) {
						location.href='myworkRpWk'; 				
					}
				});		
			}
			
			//임시저장
			function setReportImsi() {
				var flag = $('#dropDownSj').val();
				
				//추후 가져오는값 코드로 변경
				var deptCode = $('#deptNm').val();
				var createId = $('#createNm').val();
				
				var createDate = $('#createDate').val();
				var weekRpJobCt = $('#weekRpJobCt').val();
				var nxWeekRpJobCt = $('#nxWeekRpJobCt').val();
				var weekPlJobCt = $('#weekPlJobCt').val();
				var nxWeekPlJobCt = $('#nxWeekPlJobCt').val();
				var etcCt = $('#etcCt').val();
				var subject = flag === '1' ? '주간업무보고' : '월간업무보고';
				
				
				var param = {
					subject: subject,
					deptCode: deptCode, 
					createId: createId,
					weekRpJobCt: weekRpJobCt,
				};
				
				if (!confirm("저장하시겠습니까?")) {
					return;
		        } 
				
				$.ajax({
					url: '${pageContext.request.contextPath}/setReportImsi', //주소
					data: JSON.stringify(param), //전송 데이터
					type: "POST", //전송 타입
					async: true, //비동기 여부
					timeout: 5000, //타임 아웃 설정
					dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
					contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
					    			
					// [응답 확인 부분 - json 데이터를 받습니다]
					success: function(response) {
					},
					    			
					// [에러 확인 부분]
					error: function(xhr) {
						   				
					},
					    			
					// [완료 확인 부분]
					complete:function(data,textStatus) {
						console.log('##########################');
						location.href='myworkRpWk';
					}
				});		
			}
			
			function test() {
				location.href='myworkRpWk';
			}
		</script>
	</body>
</html>