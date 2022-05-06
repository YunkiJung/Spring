<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/member/css/mem_detail.css?ver=1">
</head>
<body>
<div class="container detailContainer">
    <div class="main-body" style="background-color: #5B7DB1; padding: 1.5em; border-radius: 1em; margin-top: 10px; width: 95%; margin: 0 auto;">
          <div class="row gutters-sm" >
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body" style="">
                	<c:choose>
                		<c:when test="${empty selectMemImg}">
		                  <div class="d-flex flex-column align-items-center text-center">
		                     <img src="/resources/member/img/profileImg.jpg" id="imgChange" class="rounded-circle" width="150" height="150">
		                    <div class="mt-3">
		                      <h4>${memDetail.memName }</h4>
		                      <p class="text-muted font-size-sm">${memDetail.memAddr }, ${memDetail.countryCode }</p>
		                    </div>
		                  </div>
                		</c:when>
                		<c:otherwise>
                			<div class="d-flex flex-column align-items-center text-center">
		                     <img src="/resources/member/img/${selectMemImg}" id="imgChange" class="rounded-circle" width="150" height="150">
		                    <div class="mt-3">
		                      <h4>${memDetail.memName }</h4>
		                      <p class="text-muted font-size-sm">${memDetail.memAddr }, ${memDetail.countryCode }</p>
		                    </div>
		                  </div>
                		</c:otherwise>
                	</c:choose>
                </div>
              </div>
            
              <div class="card mt-3" style="height: 10em;">
                <ul class="list-group list-group-flush" style="text-align: center; font-size: 1.4em;">
                  <li class="list-group-item" >
                    <h2>포인트</h2>
                  </li>
                  <li class="list-group-item" style="text-align: center; font-size: 1.3em;">
                    <span class="spanPointH3" >${memDetail.points }</span> point
                  </li>
                </ul>
              </div>
            </div>
           
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body" style="height:27.5em;">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">이름 :</h6>
                    </div>
                    <div class="col-sm-9">
                      ${memDetail.memName }
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">생년월일 :</h6>
                    </div>
                    <div class="col-sm-9">
                      ${memDetail.birthDate }
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">이메일 :</h6>
                    </div>
                    <div class="col-sm-9">
                     ${memDetail.memEmail }
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">연락처 :</h6>
                    </div>
                    <div class="col-sm-9">
                      ${memDetail.memPhone }
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">주소 :</h6>
                    </div>
                    <div class="col-sm-9">
                      ${memDetail.memAddr }, ${memDetail.countryCode }
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">성별 :</h6>
                    </div>
                    <div class="col-sm-9">
                      ${memDetail.gender }
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                    	<button type="button" class="btn btn-primary editBtn" value="수정하기" onclick="location.href='/member/memDetailEdit?memId=${sessionScope.loginInfo.memId}&sideMenuCode=${selectedSideMenu }';">수정하기</button>
                    </div>
                  </div>
                </div>
              </div>
             </div>
           </div>
         </div>
       </div>
 <script type="text/javascript" src="/resources/member/js/mem_detail.js?ver=1"></script>
</body>
</html>