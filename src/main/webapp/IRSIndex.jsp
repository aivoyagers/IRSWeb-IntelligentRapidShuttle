<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Intelligent Rapid Shuttle</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
	  	  
      #map {
        height: 400px;
		width: 1400px;
		align: center;
		padding: 100px;
      }
      #directions-panel {
        margin-top: 10px;
        background-color: #FFEE77;
        padding: 10px;
        overflow: scroll;
        height: 174px;
      }
    </style>
  </head>
  <body>
  
  <div class="container">
  <div class="row">
    <div class="col-md-9">
		 <header class="main-page-header">
			<div align='center'><h1>Intelligent Rapid Shuttle</h1></div>
		</header>
		<div align='center'>
		<h1>Pick up students of different schools with a few vehicles in the shortest route possible.</h1>
			<form>
		    <!--<label for="studentcount">Enter No. of Students:</label>
		    <input type="text" id="studentcount" name="student_count" value="8">
		    <label for="schoolcount">Enter No. of Schools:</label>
		    <input type="text" id="schoolcount" name="school_count" value="3" disabled>
		    <label for="vehiclecount">Enter No. of Vehicle:</label>
			<input type="text" id="vehiclecount" name="vehicle_count" value="2">
			<input id="clickMe" type="button" value="submit" onclick="Plot()" />-->
			
			<input type="radio" name="DataSet" value="DataSet1">DataSet1(8 Students, 3 Schools, 2 Vehicles) <br>
			<input type="radio" name="DataSet" value="DataSet2">DataSet2(9 Students, 2 Schools, 2 Vehicles)<br>
			<input type="radio" name="DataSet" value="DataSet2">DataSet3(5 Students, 2 Schools, 1 Vehicles) <br>
			<input id="clickMe" type="button" value="submit" onclick="Plot()">
			</form>
		 </div>
		 <br>
		
    </div>
  </div>
</div>
	
    <div id="map" align="center"></div>
	<br>
	<div  align='center'>
		
	<!--TODO: Enable after loading map-->
		<button id="solveButton" class="btn btn-default" type="submit" onclick="solve()" >Solve Shuttle planning problem</button>
		<input type="text" id="score" name="score" value="0">
		<input type="text" id="response" name="response" value="">

		
  </div>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"> </script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB_N432H-hh9lmZ7dCARevj40vlPzR_jeE&sensor=false&callback=initMap">
	</script>
	<script type="text/javascript">
		var postalCodeArray=[];
		var studentLocations=[];
		var schoolLocations=[];
		var vehicleLocations=[];
		var studentPostalCodes=[];
		var vehiclePostalCodes=[];
		var schoolPostalCodes=[];
		console.log("the postal code array is initiated "+postalCodeArray.length);
		var studentsArray=[];
		var vehiclelocationpostalCodeArray=[];
		console.log("the postal code array is initiated "+studentsArray.length);
		var promises = [];
		var coordinatesArray=[];
		var map;
		
		window.onload = regiserKIESolvers();
		
		function Plot(){
			schoolPostalCodes =["575954,singapore","129956,singapore","545083,singapore"];
			studentPostalCodes =["579819,singapore","680634,singapore","819664,singapore","718813,singapore","828688,singapore","469976,singapore","129580,singapore"," 207853,singapore"];
			vehiclePostalCodes = ["467360,singapore","608549, singapore"];
			initMap(studentPostalCodes,schoolPostalCodes,vehiclePostalCodes);
			console.log("ending now");	
			
		}
		
		function initMap(studentsArray,schoolArray,vehicleArray) {
		
			
			//Initialise the map
			var mapcenter = {lat: 1.356521, lng: 103.83077700000001};
			map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 12,
			  center: mapcenter
	        });
	
			var goldStar = {
				path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
				fillColor: 'yellow',
				fillOpacity: 0.8,
				scale: 0.1,
				strokeColor: 'black',
				strokeWeight: 1
			};
	
			var geocoder = new google.maps.Geocoder();
			
			//TODO: Datset has to be changed
			var student1 = new google.maps.LatLng(1.347593,103.852434);
			var student2 = new google.maps.LatLng(1.396750,103.748564);
			var student3 = new google.maps.LatLng(1.355246,103.988475);
			var student4 = new google.maps.LatLng(1.430672,103.723253);
			var student5 = new google.maps.LatLng(1.402721,103.899726);
			var student6 = new google.maps.LatLng(1.313012,103.939276);
			var student7 = new google.maps.LatLng(1.309749,103.771281);
			var student8 = new google.maps.LatLng(1.313492,103.857975);
              
			  
			marker = new google.maps.Marker({position: student1, map: map});
			marker = new google.maps.Marker({position: student2, map: map});
			marker = new google.maps.Marker({position: student3, map: map});
			marker = new google.maps.Marker({position: student4, map: map});
			marker = new google.maps.Marker({position: student5, map: map});
			marker = new google.maps.Marker({position: student6, map: map});
			marker = new google.maps.Marker({position: student7, map: map});
			marker = new google.maps.Marker({position: student8, map: map});
			
			var vehicle1 = new google.maps.LatLng(1.346979,103.843417);
			var vehicle2 = new google.maps.LatLng(1.308489,103.768901);
			
			marker = new google.maps.Marker({position: vehicle1, icon: {
							path: google.maps.SymbolPath.CIRCLE,scale:5},map: map});
			marker = new google.maps.Marker({position: vehicle2, icon: {
							path: google.maps.SymbolPath.CIRCLE,scale:5},map: map});
						
		
			var school1 = new google.maps.LatLng(1.346979,103.843417);
			var school2 = new google.maps.LatLng(1.308489, 103.768901);
			var school3 = new google.maps.LatLng(1.396588,103.899726);
			
			
			marker = new google.maps.Marker({position: school1,icon: goldStar, map: map});
			marker = new google.maps.Marker({position: school2,icon: goldStar, map: map});
			marker = new google.maps.Marker({position: school3,icon: goldStar, map: map});
			
	
		  }
		function  coordinateUser(coordinates) {
			console.log("coordinates", coordinates);
		}
		
		async function solve(){
			console.log("Inside solve");
			//registerIRSSolverPost();
			//await new Promise((resolve, reject) => setTimeout(resolve, 5000));
			//registerIRSSolverBestSolutionGet();
			console.log("value"+document.getElementById("response").value);
			
			
			
			//resolveDirections();
		}
		
		function regiserKIESolvers(){
			console.log("Inside regiserKIESolvers");
			//registerIRSSolverPut();
			//registerIRSSolverGet();
		}
		
		
		
		function resolveDirections() {
			console.log("Inside resolveDirections");
			var waypts = [];
	        
	
			var latlng1 = new google.maps.LatLng(1.332787, 103.743121);
			var latlng2 = new google.maps.LatLng(1.430672, 103.723253);
			var latlng3 = new google.maps.LatLng(1.39675, 103.748564);
			var latlng4 = new google.maps.LatLng(1.402721, 103.912795);
			var latlng5 = new google.maps.LatLng(1.308489, 103.768901);
		
			waypts.push(latlng1);
			waypts.push(latlng2);
			waypts.push(latlng3);
			waypts.push(latlng4);
			waypts.push(latlng5);
			waypts.push(latlng1);
		
			var line = new google.maps.Polyline({
				path: waypts,
				geodesic: true,
				strokeColor: 'black',
				strokeOpacity: 0.8,
				strokeWeight: 4
			});
			line.setMap(map);
			
			
			var latlng1 = new google.maps.LatLng(1.324944, 103.929392);
			var latlng2 = new google.maps.LatLng(1.313012, 103.939276);
			var latlng3 = new google.maps.LatLng(1.355246, 103.988475);
			var latlng4 = new google.maps.LatLng(1.402721, 103.912795);
			var latlng5 = new google.maps.LatLng(1.396588, 103.899726);
			var latlng6 = new google.maps.LatLng(1.347593, 103.852434);
			var latlng7 = new google.maps.LatLng(1.347593, 103.852434);
			var latlng8 = new google.maps.LatLng(1.313492, 103.857975);
			var latlng9 = new google.maps.LatLng(1.309749, 103.771281);
			var latlng10 = new google.maps.LatLng(1.346979, 103.843417);
			
			waypts = [];
			waypts.push(latlng1);
			waypts.push(latlng2);
			waypts.push(latlng3);
			waypts.push(latlng4);
			waypts.push(latlng5);
			waypts.push(latlng6);
			waypts.push(latlng7);
			waypts.push(latlng8);
			waypts.push(latlng9);
			waypts.push(latlng10);
			waypts.push(latlng1);
			
			var line1 = new google.maps.Polyline({
				path: waypts,
				geodesic: true,
				strokeColor: 'red',
				strokeOpacity: 0.8,
				strokeWeight: 4
			});
			line1.setMap(map);
	        document.getElementById("score").value='0hard/-811soft';
			
	       }
		</script>
   

  </body>
</html>

</body>
</html>