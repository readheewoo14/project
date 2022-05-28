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
					<select style="margin-inline:30px;">
						<option>주간</option>
						<option>월간</option>
					</select>
					
					<div style="float:right">
						<button class="btn btn-primary">임시저장</button>
						<button class="btn btn-primary">저장</button>
					</div>
					
					<h3 style="text-align: center;">주간업무보고</h3>
					<table style="border-collapse: separate;border-spacing:10px;">
						<tr>
							<th>부서명</th>
							<td>
								<div class="search">
									<input id="createCdSch" style="width:80px;border-width: thin;background-color:#80808021" readonly/>
									<input id="createNmSch" style="width:120px" />
									<img style="width: 15px;margin-top: -3px;cursor:hand" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<div class="search">
									<input id="createCdSch" style="width:80px;border-width: thin;background-color:#80808021" readonly/>
									<input id="createNmSch" style="width:120px" />
									<img style="width: 15px;margin-top: -3px;cursor:hand" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
							</td>
						</tr>
						<tr>
							<th>작성일자</th>
							<td>
								<input style="width:205px"/>
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
								<textarea style="width:100%;height: 100%;"></textarea>
							</td>
							<td style="text-align: center;vertical-align: top;">
								<textarea style="width:100%;height: 100%;"></textarea>
							</td>
						</tr>
						<tr>
							<th style="text-align: left;vertical-align: top;">기획</th>
							<td style="text-align: center;vertical-align: top;">
								<textarea style="width:100%;height: 100%;"></textarea>
							</td>
							<td style="text-align: center;vertical-align: top;">
								<textarea style="width:100%;height: 100%;"></textarea>
							</td>
						</tr>
						<tr>
							<th style="text-align: left;vertical-align: top;">특이사항<br/>(휴가/출장/기타)</th>
							<td style="text-align: center;vertical-align: top;height: 350px;" colspan="2">
								<textarea style="width:100%;height: 100%;"></textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>	
		</div>	
	
		<script type="text/javascript">
			$(document).ready(function() {
				$('#sidebar').css('min-height', '130vh');
			});
			
			
		</script>
	</body>
</html>