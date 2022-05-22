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
	z-index: 1;
	position: absolute;
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

@media ( max-width : 768px) {
	#sidebar {
		margin-left: -250px;
	}
	#sidebar.active {
		margin-left: 0;
	}
}

@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

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

#sidebar ul li.active>a, a[aria-expanded="true"] {
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
				<h3><a href="boards">MINI-PROJECT</a></h3>
			</div>

			<ul class="list-unstyled components">
				<p>REPORT SYSTEM PROJECT</p>
				<li style="background-color:#35488b"><a href="#">업무작성</a></li>
				<li>
					<a href="#submenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내업무 보고</a>
					<ul class="collapse list" id="submenu1">
						<li><a href="boards">주/월간 업무작성</a></li>
						<li><a href="test">주요업무계획</a></li>
						<li><a href="#">업무공유</a></li>
					</ul></li>
				<li>
					<a href="#submenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">팀업무보고</a>
					<ul class="collapse list" id="submenu2">
						<li><a href="#submenu21" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">팀명1</a>
							<ul class="collapse list" id="submenu21">
								<li><a href="#">주간 업무보고</a></li>
								<li><a href="#">월간 업무보고</a></li>
								<li><a href="#">주요업무계획</a></li>
							</ul>
						</li>
						<li><a href="#submenu22" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">팀명2</a>
							<ul class="collapse list" id="submenu22">
								<li><a href="#">주간 업무보고</a></li>
								<li><a href="#">월간 업무보고</a></li>
								<li><a href="#">주요업무계획</a></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</nav>

		<!-- Page Content -->
		<div id="content"></div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</body>
</html>