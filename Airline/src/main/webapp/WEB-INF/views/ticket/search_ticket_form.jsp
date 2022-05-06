<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-md-center" style="margin-top: 200px;">
	<div class="col-4">
		<form action="/ticket/searchMyTicket" method="post">
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-size: 1.4em;">ORDER NUMBER:</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputEmail3" name="orderCode" style="width: 100%">
		    </div>
		  </div>
		  <div class="row mb-3">
			  <button type="submit" class="btn btn-primary">Search</button>
		  </div>
		</form>
	</div>
</div>
</body>
</html>