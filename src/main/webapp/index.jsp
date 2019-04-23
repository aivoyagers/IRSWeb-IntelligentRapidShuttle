<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js'> </script>
<h2>Hello World!</h2>
<script>

console.log("I am calling solver");

var putSettings = {
		  "async": true,
		  "crossDomain": true,
		  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers/irsSolutionSolver",
		  "method": "PUT",
		  "headers": {
		    "X-KIE-ContentType": "xstream",
		    "Content-Type": "application/json",
		    "Authorization": "Basic d2JhZG1pbjp3YmFkbWlu",
		    "cache-control": "no-cache",
		    "Postman-Token": "4f49961f-8a53-49a1-b1d4-6b5b4f45f782"
		  },
		  "data": "<solver-instance>\n  <solver-config-file>com/irsspace/irs/irsSolutionSolverConfig.solver.xml</solver-config-file>\n</solver-instance>"
		}

	$.ajax(putSettings).done(function (response) {
	  console.log("output of put =====> ");
	  console.log(response);
	  
	  
	});

		
console.log("I am calling instantiated solver ");

var getSettings = {
	  "async": true,
	  "crossDomain": true,
	  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers",
	  "method": "GET",
	  "headers": {
	    "X-KIE-ContentType": "xstream",
	    "contentType": "application/xml",
	    "Authorization": "Basic d2JhZG1pbjp3YmFkbWlu",
	    "cache-control": "no-cache",
	    "Postman-Token": "c2c154ac-c89d-4872-8cea-34deddb4ed96"
	  }
	}

	$.ajax(getSettings).done(function (response) {
		 console.log("output of GET =====> " );
		 console.log(response);
	});
	
console.log("I am calling post");


	var postSettings = {
		  "async": true,
		  "crossDomain": true,
		  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers/irsSolutionSolver/state/solving",
		  "method": "POST",
		  "headers": {
		    "Content-Type": "application/xml",
		    "X-KIE-ContentType": "xstream",
		    "Authorization": "Basic d2JhZG1pbjp3YmFkbWlu",
		    "cache-control": "no-cache",
		    "Postman-Token": "b11bb9e7-f0dc-43f6-9edd-08014cc3855c"
		  },
		  "data": "<com.irsspace.irs.irsSolution>\n    <locationList>\n    \n    </locationList>\n    <studentList>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Bishan Loft</name>\n            <location>\n                <name>Bishan Loft Block 31</name>\n                <latitude>1.347593</latitude>\n                <longitude>103.852434</longitude>\n            </location>\n            <!--\n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>\n-->            \n        \n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Yew Tee</name>\n            <!-- \n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>   \n-->\n            <location>\n                <!--               \t\t-->\n                <name>Block 632 Yew Tee</name>\n                <latitude>1.396750</latitude>\n                <longitude>103.748564</longitude>\n                <!--                \t\t-->\n            \n            \n            </location>\n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Changi Airport</name>\n            <!-- \n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>   \n-->\n            <location>\n                <!--               \t\t-->\n                <name>Changi Airport</name>\n                <latitude>1.355246</latitude>\n                <longitude>103.988475</longitude>\n                <!--                \t\t-->\n            \n            \n            </location>\n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Neo Tiew Rd</name>\n            <!-- \n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>   \n-->\n            <location>\n                <!--               \t\t-->\n                <name>161 Newo Tiew Rd</name>\n                <latitude>1.430672</latitude>\n                <longitude>103.723253</longitude>\n                <!--                \t\t-->\n            \n            \n            </location>\n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Oassis Terraces</name>\n            <location>\n                <name>Oasis Terraces</name>\n                <latitude>1.402721</latitude>\n                <longitude>103.912795</longitude>\n            </location>\n            <!-- \n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>\n-->\n        \n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Bayshore</name>\n            <location>\n                <name>34 Bayshore Road</name>\n                <latitude>1.313012</latitude>\n                <longitude>103.939276</longitude>\n            </location>\n            <!--\n            <school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>\n-->            \n        \n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Clementi Ave 1</name>\n            <!-- \n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>   \n-->\n            <location>\n                <name>425 Clementi Ave 1</name>\n                <latitude>1.309749</latitude>\n                <longitude>103.771281</longitude>\n            </location>\n        </com.irsspace.irs.irsStudent>\n        <com.irsspace.irs.irsStudent>\n            <name>Student of Karissdale</name>\n            <!-- \n\t\t\t<school><name>Raffles Institution</name><latitude>1.346979</latitude><longitude>103.843417</longitude></school>   \n-->\n            <location>\n                <!--               \t\t-->\n                <name>Kerrisdale</name>\n                <latitude>1.313492</latitude>\n                <longitude>103.857975</longitude>\n                <!--                \t\t-->\n            \n            </location>\n        </com.irsspace.irs.irsStudent>\n    </studentList>\n    <vehicleList>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 1 from Bedok Mall</name>\n                <latitude>1.324944</latitude>\n                <longitude>103.929392</longitude>\n            </officeLocation>\n            <capacity>7</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 2 from Jurong JEM Mall</name>\n                <latitude>1.332787</latitude>\n                <longitude>103.743121</longitude>\n            </officeLocation>\n            <capacity>4</capacity>\n        </com.irsspace.irs.irsVehicle>\n    </vehicleList>\n</com.irsspace.irs.irsSolution>"
		}

		$.ajax(postSettings).done(function (response) {
			console.log("output of POST =====> ");
			console.log(response);
		});
	




</script>
</body>
</html>
