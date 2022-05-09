<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH Airline</title>
<link rel="stylesheet" href="/resources/ticket/css/search.css">
<style>
.btn-group>.btn:not(:first-child):not(:last-child):not(.dropdown-toggle){
	border-bottom-left-radius: 0.5em;
	border-top-left-radius: 0.5em;
}

#map_ma {
	width:100%; 
	height:400px; 
	clear:both; 
	border:solid 1px black;
}
.gps-container{
}
</style>
</head>
<body>
 <div class="tm-section tm-bg-img" id="tm-section-1">
     <div class="tm-bg-white ie-container-width-fix-2">
         <div class="container ie-h-align-center-fix">
             <div class="row">
                 <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                     <form action="/ticket/searchAirSchedule" method="post" class="tm-search-form tm-section-pad-2" id="searchForm">
                         <div class="form-row tm-search-form-row">
                             <div class="form-group tm-form-element tm-form-element-100">
                                 <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                 <input type="text" class="form-control" id="fromCity" placeholder="출발지" list="fromPortList" name="departurePortCode" autocomplete="none">
								 <datalist id="fromPortList">
								 </datalist>
                             </div>
                             <div class="form-group tm-form-element tm-form-element-100">
                                 <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                 <input type="text" class="form-control" id="toCity" placeholder="도착지" list="toPortList" name="arrivalPortCode"  autocomplete="none">
                                 <datalist id="toPortList">
    
								 </datalist>
                             </div>
                             <div class="tm-form-element tm-form-element-2">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="hasReturn" id="oneway" autocomplete="off" value="N"> 
                         <label class="btn btn-outline-secondary trvRadio" for="oneway" style="width: 8em; font-size: 0.8em; padding-top: 1em;"><span style="font-size: 1.4em;">편도</span></label >
                    <input type="radio" class="btn-check" name="hasReturn" id="return"autocomplete="off" value="Y" checked>
                 <label class="btn btn-outline-secondary trvRadio" for="return" style="width: 8em; font-size: 0.8em; padding-top: 1em;"><span style="font-size: 1.4em;">왕복</span></label>
              </div>
           </div>
                 </div>
                 <div class="form-row tm-search-form-row">
                      <div class="form-group tm-form-element tm-form-element-50">
                         <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                         <input type="date" class="form-control" value="${firstDefaultDate }" placeholder="mm/yy" name="departureDate">
                     </div>
                     <div class="form-group tm-form-element tm-form-element-50">
                         <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                         <input type="date" class="form-control" value="${secondDefaultDate }" placeholder="도착" id="returnDate" name="returnDate">
                     </div>
                     <div class="form-group tm-form-element tm-form-element-2">                                            
                         <select name="count" class="form-control tm-select" id="count">
                             <option value="">Adult</option>
                             <option value="1">1</option>
                             <option value="2">2</option>
                             <option value="3">3</option>
                             <option value="4">4</option>
                             <option value="5">5</option>
                             <option value="6">6</option>
                             <option value="7">7</option>
                             <option value="8">8</option>
                             <option value="9">9</option>
                         </select>
                         <i class="fa fa-2x fa-user tm-form-element-icon"></i>
                     </div>
                     <div class="form-group tm-form-element tm-form-element-2">
                         <button type="button" class="btn btn-primary tm-btn-search" style="margin-left: 30em; " id="searchBtn">Search</button>
                            </div>
                          </div>
                          <div class="form-row clearfix pl-2 pr-2 tm-fx-col-xs">
                              <a href="#" class="ie-10-ml-auto ml-auto mt-1 tm-font-semibold tm-color-primary">Need Help?</a>
                          </div>
                    </form>
                </div>                        
            </div>      
        </div>
    </div>                  
</div>

<div class="gps-container" style="margin: 1em; margin-top: 2em; margin-bottom: 3em; ">
	<div class="row justify-content-md-center">
		<div class="col-12" style="text-align: center;">
			<h1 style="font-weight: bold;">지도 확인</h1>
		</div>
		<div class="col-4" >
			<div id="map" style="width:500px;height:400px;border: 1px solid black;"></div>
		</div>
		<div class="col-2" >
			<div class="row justify-content-md-center">
				<div class="col-12">
					<div id="cityName" style="font-size: 3em; text-align: center;"></div>
				</div>
				<div class="col-12">
					<div class="col-4" id="weather"></div>
				</div>
				<div class="col-12">
					<div id="temp"></div>
				</div>
			</div>
		</div>
	</div>
</div>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=deb391ab5fc0c25217fcd7653ba8fcf6"></script>        
<script type="text/javascript" src="/resources/ticket/js/search.js?ver=36"></script>
</body>
</html>