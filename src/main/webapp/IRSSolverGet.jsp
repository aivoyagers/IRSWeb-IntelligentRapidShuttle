<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js'> </script>
<h2>Hello World!</h2>
<script>

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
	


</script>
</body>
</html>
