<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board</title>
<style type="text/css">
.wrapper {
    display: flex;
    align-items: stretch;
}

#sidebar {
    min-width: 250px;
    max-width: 250px;
    min-height: 100vh;
}

#sidebar.active {
    margin-left: -250px;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
}

@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";


body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

#sidebar {
    /* don't forget to add all the previously mentioned styles here too */
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}
ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}
</style>
</head>
<body>
	<div class="wrapper">

	    <!-- Sidebar -->
	    <nav id="sidebar">
	        <div class="sidebar-header">
            	<h3>Bootstrap Sidebar</h3>
        	</div>
        	
	        <ul class="list-unstyled components">
	            	<p>Dummy Heading</p>
	            <li class="active">
	                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
	                <ul class="collapse list-unstyled" id="homeSubmenu">
	                    <li>
	                        <a href="boards">Home 1</a>
	                    </li>
	                    <li>
	                        <a href="#">Home 2</a>
	                    </li>
	                    <li>
	                        <a href="#">Home 3</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">About</a>
	            </li>
	            <li>
	                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
	                <ul class="collapse list-unstyled" id="pageSubmenu">
	                    <li>
	                        <a href="#">Page 1</a>
	                    </li>
	                    <li>
	                        <a href="#">Page 2</a>
	                    </li>
	                    <li>
	                        <a href="#">Page 3</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">Portfolio</a>
	            </li>
	            <li>
	                <a href="#">Contact</a>
	            </li>
	        </ul>
	    </nav>
	
	    <!-- Page Content -->
	    <div id="content" style="width: 100%">
	        <!-- We'll fill this with dummy content -->
		    <nav class="navbar navbar-expand-lg navbar-light bg-light">
		        <div class="container-fluid">
		
		            <button type="button" id="sidebarCollapse" class="btn" style="margin-top: 10px;">
		                <i class="fas fa-align-left"></i>
		                <span style="color:white">사이바 숨기기</span>
		            </button>
					<div style="margin-inline: 30px;">
						<h3>로그인 테이블 정보</h3>
						<div id="grid"></div>
					</div>	
		        </div>
		    </nav>	        
	    </div>
	
	</div>    

	<script type="text/javascript">
		$(document).ready(function() {
		    $('#sidebarCollapse').on('click', function () {
		        $('#sidebar').toggleClass('active');
		    });

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