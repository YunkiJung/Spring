<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container>div {
	padding: 1rem;
	background-color: white;
}
</style>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jqvmap/1.5.1/jqvmap.min.css">
	</head>
	
	<link href='/resources/admin/css/fullcalendar/main.css' rel='stylesheet' />
	<script src='/resources/admin/js/fullcalendar/main.js'></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth'
			});
			calendar.render();
		});
	</script>
	
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		// Load the Visualization API and the corechart package.
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
	
		// Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
	
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {
	
			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Topping');
			data.addColumn('number', 'Slices');
			data.addRows([ [ 'Mushrooms', 3 ], [ 'Onions', 1 ], [ 'Olives', 1 ],
					[ 'Zucchini', 1 ], [ 'Pepperoni', 2 ] ]);
	
			// Set chart options
			var options = {
				'title' : 'How Much Pizza I Ate Last Night',
				'width' : 400,
				'height' : 475
			};
	
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
	<!-- chart -->
	<script src="qunit/qunit.js"></script>
	
	<link rel="stylesheet" href="/resources/admin/css/jqvmap.css">
	
	<link rel="stylesheet"
		href="https://cdnjs.cloudflasre.com/ajax/libs/jqvmap/1.5.1/jqvmap.min.css">

</head>
<body>
	<div class="row" id="container">
		<div class="col" style="background-color: #f9fafb;">

			<div class="row">
				<div class="col-9" style="background-color: white;">
					<div id="map">
						<div id="vmap" style="margin: 0 auto; width: 80%; height: 30rem;"></div>
						<script src="https://code.jquery.com/jquery-latest.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/jqvmap/1.5.1/jquery.vmap.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/jqvmap/1.5.1/maps/jquery.vmap.world.js"></script>

						<script type="text/javascript">
							var countries = '';
							function getCountryData() {
								$.ajax({
									url : 'countries.json',
									type : 'get',
									success : function(res) {
										countries = JSON.parse(res);
									}
								});
							}
							getCountryData();
							$(document)
									.ready(
											function() {
												$("#vmap")
														.vectorMap(
						{
							map : 'world_en',
							backgroundColor : '#FFFFFF',
							borderColor : '#EC0101',
							color : '#F1F3DE',
							hoverOpacity : 0.7,
							selectedColor : '#CD0A0A',
							enableZoom : true,
							enableDrag : true,
							showTooltip : true,
							normalizeFunction : 'polynomial',
							onLabelShow : function(
									event,
									label,
									code) {
								code = code
										.toUpperCase();
								country_name = countries[code];
								label
										.html('<strong>'
												+ '123123'
												+ '</strong>');
													}
												});
											});
						</script>
					</div>
				</div>
				<div class="col-3" id="chart1">
					<div id="chart_div" style="height: 10em;"></div>
				</div>

				<div class="col-12" id="chart2">
					<div style="height: 5em;"></div>
				</div>

				<div class="col-4" id="calander" style="background-color: white; padding: 2rem;">
					<div id='calendar'></div>
				</div>
				<div class="col-4" id="weather"></div>
			</div>

			<script>
				let strongTags = document.getElementsByTagName('strong');

				for (let i = 0; i < strongTags.length; i++) {
					strongTags[i].innerHTML = '111';

				}
			</script>
		</div>
	</div>
</body>
</html>
