<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="shortcut icon" href="<c:url value="/resources/images/football-256x256.ico" />">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.7/css/bootstrap.min.css" />">
		<script src="<c:url value="/resources/scripts/jquery_min_1_12_4.js" />"></script>
		<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js" />"></script>
		<script src="<c:url value="/resources/scripts/jquery.validate.min-1.11.1.js" />"></script>
		<style>
			html {
				position: relative;
				min-height: 100%;
				padding-bottom:50px;
			}
			/* Remove the navbar's default margin-bottom and rounded borders */
			.navbar {
				margin-bottom: 0;
				border-radius: 0;
			}
			
			/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
			.row.content {
				padding-bottom:50px;
    			height: 500px;
			}
			
			/* Set gray background color and 100% height */
			.sidenav {
				padding-top: 20px;
				background-color: #f1f1f1;
				min-height:100%;
				height: 100%;
			}
			
			/* Set black background color, white text and some padding */
			footer {
				position: absolute;
				background-color: #555;
				color: white;
				padding: 15px;
				width: 100%;
				height: 50px;
				bottom: 0;
			}
			
			/* On small screens, set height to 'auto' for sidenav and grid */
			@media screen and (max-width: 767px) {
				.sidenav {
					height: auto;
					padding: 15px;
				}
				.row.content {
					height: auto;
				}
			}
		</style>
		<title><tiles:insertAttribute name="title" ignore="true" /></title>
	</head>

	<body>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<tiles:insertAttribute name="header" />
			</div>
		</nav>

		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-2 sidenav">
					<tiles:insertAttribute name="menu" />
				</div>
				<div class="col-sm-8 text-left">
					<tiles:insertAttribute name="body" />
				</div>
				<!-- <div class="col-sm-2 sidenav">
					<div class="well">
						<p>ADS</p>
					</div>
					<div class="well">
						<p>ADS</p>
					</div>
				</div> -->
			</div>
		</div>

		<footer class="container-fluid text-center"><tiles:insertAttribute name="footer" /></footer>
	</body>
</html>