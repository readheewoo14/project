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
			<div style="margin-inline:30px;margin-top:30px;height: 800px;background-color:#d1d7ed6b;padding-top: 20px;">
				<select style="margin-inline:30px;">
					<option>주간</option>
					<option>월간</option>
				</select>
				
				<h3 style="text-align: center;">주간업무보고</h3>
				<table>
					<tr>
						<th>부서명</th>
						<td>
							<input/>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input/>
						</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>
							<input/>
						</td>
					</tr>
					<tr>
					
					</tr>
					<tr>
					
					</tr>
					<tr>
					
					</tr>
					<tr>
					
					</tr>
					
				</table>
			</div>		
		</div>	
	
		<script type="text/javascript">
			$(document).ready(function() {

				
			});
			
			
		</script>
	</body>
</html>