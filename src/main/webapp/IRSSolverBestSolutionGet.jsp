<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js'> </script>
<h2>Hello World!</h2>
<script>

console.log("I am calling get the best solution");

var bestSettings2 = {
	  "async": true,
	  "crossDomain": true,
	  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers/irsSolutionSolver/bestsolution",
	  "method": "GET",
	  "headers": {
	    "X-KIE-ContentType": "xstream",
	    "Content-Type": "application/json",
	    "cache-control": "no-cache",
	    "Postman-Token": "fd366776-d8d2-4b91-b633-6ed017598029"
	  }
	}

	$.ajax(bestSettings2).done(function (response) {
	  console.log("output of GET best Solution 2=====> ");
	  console.log(response);
});

</script>
</body>
</html>
