<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<style type="text/css">
html, body{
	height: 100%;
}
#infoMenu {
	text-align: right;
}
.containerT{
	height: 100%;
}
.pageBodyT{
	text-align: right;
	height: 100%;
	width: 100%;
}
.mainBodyT{
	height: 100%;
	padding: 0;
	
}
.sideMenuT{
	background-color: #251d3a;
	position: fixed;
	height: 100%;
	padding: 0 !important;
}
</style>
<!-- bootstrap css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- bootstrap js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- BootStrap  -->
<link rel="stylesheet"
	href="/resources/common/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Validation  -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>	
</head>
<body>
	<div class="container-fluid containerT">
		<div class="row">
			<div class="col-2">
				<div class="row">
					<div class="col-2 sideMenuT">
				<tiles:insertAttribute name="side" />
					</div>
					<div class="col-12">
					</div>
				</div>
			</div>
			<div class="col pageBodyT">
				<div class="row">
					<div class="col-12" id=" infoMenu" style="border-bottom: 2px solid #eeeeee;">
						<tiles:insertAttribute name="menu" />
					</div>
					<div class="col mainBodyT">
						<tiles:insertAttribute name="body" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>