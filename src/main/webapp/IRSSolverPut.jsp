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

		

</script>
</body>
</html>
