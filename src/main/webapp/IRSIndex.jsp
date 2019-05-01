<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
		<h1>AI powered Shuttle Service -The fastest way to reach School at an affordable price </h1>
			<form>
		    <input type="radio" name="DataSet" value="DataSet 1">DataSet1(8 Students, 3 Schools, 2 Vehicles) <br>
			<input type="radio" name="DataSet" checked="checked" value="DataSet 2">DataSet2(18 Students, 5 Schools, 3 Vehicles)<br>
			<input type="radio" name="DataSet" value="DataSet 3">DataSet3(26 Students, 8 Schools, 3 Vehicles)<br>
			<input type="radio" name="DataSet" value="DataSet 4">DataSet4(Same as Dataset3 + 1 Vehicle)<br>
			<input id="clickMe" type="button" value="Show on Map" onclick="Plot()">
			</form>
		 </div>
		 <br>
		
    </div>
  </div>
</div>
	
	<div  id="aboveMap" align='center'>  </div>
    <div id="map" align="center"></div>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"> </script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB_N432H-hh9lmZ7dCARevj40vlPzR_jeE&sensor=false&callback=initMap">
	</script>
	<script type="text/javascript">
		var datasetValues= ["<com.irsspace.irs.irsSolution>\n\t<locationMatrixList>\n\t\t<com.irsspace.irs.irsLocationMatrix>\n\t\t\t<startLocation>\n\t\t\t\t\t<name>Bishan Loft Block 31</name>\n\t\t\t</startLocation>\n\t\t\t<toLocation>\n\t\t\t\t\t<name>Raffles Institution</name>\n\t\t\t</toLocation>\n\t\t\t<distance>15000</distance>\n\t\t</com.irsspace.irs.irsLocationMatrix>\t\n\t</locationMatrixList>\n    <schoolList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Raffles Institution</name>\n            <location>\n                <name>Raffles Institution</name>\n                <latitude>1.346979</latitude>\n                <longitude>103.843417</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Nan Hua High School</name>\n            <location>\n                <name>Nan Hua High School</name>\n                <latitude>1.308489</latitude>\n                <longitude>103.768901</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Compassvale Secondary School</name>\n            <location>\n                <name>Compassvale Secondary School</name>\n                <latitude>1.396588</latitude>\n                <longitude>103.899726</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n    </schoolList>\n    <studentList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bishan Loft</name>\n            <location>\n                <name>Bishan Loft Block 31</name>\n                <latitude>1.347593</latitude>\n                <longitude>103.852434</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Yew Tee</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>Block 632 Yew Tee</name>\n                <latitude>1.396750</latitude>\n                <longitude>103.748564</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Changi Airport</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Changi Airport</name>\n                <latitude>1.355246</latitude>\n                <longitude>103.988475</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Neo Tiew Rd</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>161 Newo Tiew Rd</name>\n                <latitude>1.430672</latitude>\n                <longitude>103.723253</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Oassis Terraces</name>\n            <location>\n                <name>Oasis Terraces</name>\n                <latitude>1.402721</latitude>\n                <longitude>103.912795</longitude>\n            </location>\n            <dropoffLocationName>Compassvale Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bayshore</name>\n            <location>\n                <name>34 Bayshore Road</name>\n                <latitude>1.313012</latitude>\n                <longitude>103.939276</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Clementi Ave 1</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>425 Clementi Ave 1</name>\n                <latitude>1.309749</latitude>\n                <longitude>103.771281</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Karissdale</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Kerrisdale</name>\n                <latitude>1.313492</latitude>\n                <longitude>103.857975</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n    </studentList>\n    <vehicleList>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 1 from Bedok Mall</name>\n                <latitude>1.324944</latitude>\n                <longitude>103.929392</longitude>\n            </officeLocation>\n            <capacity>10</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 2 from Jurong JEM Mall</name>\n                <latitude>1.332787</latitude>\n                <longitude>103.743121</longitude>\n            </officeLocation>\n            <capacity>4</capacity>\n        </com.irsspace.irs.irsVehicle>\n    </vehicleList>\n</com.irsspace.irs.irsSolution>",
			"<com.irsspace.irs.irsSolution>\n\t<locationMatrixList>\n\t\t<com.irsspace.irs.irsLocationMatrix>\n\t\t\t<startLocation>\n\t\t\t\t\t<name>Bishan Loft Block 31</name>\n\t\t\t</startLocation>\n\t\t\t<toLocation>\n\t\t\t\t\t<name>Changkat Changi Secondary School</name>\n\t\t\t</toLocation>\n\t\t\t<distance>15000</distance>\n\t\t</com.irsspace.irs.irsLocationMatrix>\t\n\t</locationMatrixList>\n    <schoolList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Changkat Changi Secondary School</name>\n            <location>\n                <name>Changkat Changi Secondary School</name>\n                <latitude>1.340171</latitude>\n                <longitude>103.951992</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Punggol Secondary School</name>\n            <location>\n                <name>Punggol Secondary School</name>\n                <latitude>1.407663</latitude>\n                <longitude>103.908624</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Jurong Secondary School</name>\n            <location>\n                <name>Jurong Secondary School</name>\n                <latitude>1.330515</latitude>\n                <longitude>103.724258</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n\t\t<com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Juying Secondary School</name>\n            <location>\n                <name>Juying Secondary School</name>\n                <latitude>1.339888</latitude>\n                <longitude>103.687205</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n\t\t<com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Riverside Secondary School</name>\n            <location>\n                <name>Riverside Secondary School</name>\n                <latitude>1.443531</latitude>\n                <longitude>103.788624</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Raffles Institution</name>\n            <location>\n                <name>Raffles Institution</name>\n                <latitude>1.346979</latitude>\n                <longitude>103.843417</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n    </schoolList>\n    <studentList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 1</name>\n            <location>\n                <name>Student 1</name>\n                <latitude>1.330096</latitude>\n                <longitude>103.714467</longitude>\n            </location>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 2</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 2</name>\n                <latitude>1.372813</latitude>\n                <longitude>103.943608</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 3</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 3</name>\n                <latitude>1.455203</latitude>\n                <longitude>103.830688</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 4</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 4</name>\n                <latitude>1.346571</latitude>\n                <longitude>103.767343</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 5</name>\n            <location>\n                <name>Student 5</name>\n                <latitude>1.293414</latitude>\n                <longitude>103.629989</longitude>\n            </location>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 6</name>\n            <location>\n                <name>Student 6</name>\n                <latitude>1.428945</latitude>\n                <longitude>103.756524</longitude>\n            </location>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 7</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 7</name>\n                <latitude>1.372813</latitude>\n                <longitude>103.943608</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 8</name>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 8</name>\n                <latitude>1.384903</latitude>\n                <longitude>103.766444</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 9</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 9</name>\n                <latitude>1.321344</latitude>\n                <longitude>103.781071</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 10</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 10</name>\n                <latitude>1.416759</latitude>\n                <longitude>103.833433</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 11</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 11</name>\n                <latitude>1.387071</latitude>\n                <longitude>103.752745</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 12</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 12</name>\n                <latitude>1.323326</latitude>\n                <longitude>103.949737</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 13</name>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 13</name>\n                <latitude>1.384903</latitude>\n                <longitude>103.766444</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 14</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 14</name>\n                <latitude>1.323326</latitude>\n                <longitude>103.949737</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 15</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 15</name>\n                <latitude>1.331640</latitude>\n                <longitude>103.701591</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 16</name>\n            <dropoffLocationName>Changkat Changi Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 16</name>\n                <latitude>1.305639</latitude>\n                <longitude>103.907903</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 17</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 17</name>\n                <latitude>1.300406</latitude>\n                <longitude>103.788796</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 18</name>\n            <location>\n                <name>Student 18</name>\n                <latitude>1.269622</latitude>\n                <longitude>103.827993</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n    </studentList>\n    <vehicleList>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 1 from Downtown</name>\n                <latitude>1.380828</latitude>\n                <longitude>103.954016</longitude>\n            </officeLocation>\n            <capacity>15</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 2 from Jurong JEM Mall</name>\n                <latitude>1.332787</latitude>\n                <longitude>103.743121</longitude>\n            </officeLocation>\n            <capacity>12</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 3 from Causeway Point</name>\n                <latitude>1.436213</latitude>\n                <longitude>103.785994</longitude>\n            </officeLocation>\n            <capacity>10</capacity>\n        </com.irsspace.irs.irsVehicle>\t\t\n    </vehicleList>\n</com.irsspace.irs.irsSolution>",
			"<com.irsspace.irs.irsSolution>\n\t<locationMatrixList>\n\t\t<com.irsspace.irs.irsLocationMatrix>\n\t\t\t<startLocation>\n\t\t\t\t\t<name>Bishan Loft Block 31</name>\n\t\t\t</startLocation>\n\t\t\t<toLocation>\n\t\t\t\t\t<name>Changkat Changi Secondary School</name>\n\t\t\t</toLocation>\n\t\t\t<distance>15000</distance>\n\t\t</com.irsspace.irs.irsLocationMatrix>\t\n\t</locationMatrixList>\n    <schoolList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Changkat Changi Secondary School</name>\n            <location>\n                <name>Changkat Changi Secondary School</name>\n                <latitude>1.340171</latitude>\n                <longitude>103.951992</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Punggol Secondary School</name>\n            <location>\n                <name>Punggol Secondary School</name>\n                <latitude>1.407663</latitude>\n                <longitude>103.908624</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Jurong Secondary School</name>\n            <location>\n                <name>Jurong Secondary School</name>\n                <latitude>1.330515</latitude>\n                <longitude>103.724258</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n\t\t<com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Juying Secondary School</name>\n            <location>\n                <name>Juying Secondary School</name>\n                <latitude>1.339888</latitude>\n                <longitude>103.687205</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n\t\t<com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Riverside Secondary School</name>\n            <location>\n                <name>Riverside Secondary School</name>\n                <latitude>1.443531</latitude>\n                <longitude>103.788624</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Raffles Institution</name>\n            <location>\n                <name>Raffles Institution</name>\n                <latitude>1.346979</latitude>\n                <longitude>103.843417</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Nan Hua High School</name>\n            <location>\n                <name>Nan Hua High School</name>\n                <latitude>1.308489</latitude>\n                <longitude>103.768901</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Compassvale Secondary School</name>\n            <location>\n                <name>Compassvale Secondary School</name>\n                <latitude>1.396588</latitude>\n                <longitude>103.899726</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n    </schoolList>\n    <studentList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 1</name>\n            <location>\n                <name>Student 1</name>\n                <latitude>1.330096</latitude>\n                <longitude>103.714467</longitude>\n            </location>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 2</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 2</name>\n                <latitude>1.372813</latitude>\n                <longitude>103.943608</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 3</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 3</name>\n                <latitude>1.455203</latitude>\n                <longitude>103.830688</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 4</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 4</name>\n                <latitude>1.346571</latitude>\n                <longitude>103.767343</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 5</name>\n            <location>\n                <name>Student 5</name>\n                <latitude>1.293414</latitude>\n                <longitude>103.629989</longitude>\n            </location>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 6</name>\n            <location>\n                <name>Student 6</name>\n                <latitude>1.428945</latitude>\n                <longitude>103.756524</longitude>\n            </location>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 8</name>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 8</name>\n                <latitude>1.384903</latitude>\n                <longitude>103.766444</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 9</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 9</name>\n                <latitude>1.321344</latitude>\n                <longitude>103.781071</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 10</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 10</name>\n                <latitude>1.416759</latitude>\n                <longitude>103.833433</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 11</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 11</name>\n                <latitude>1.387071</latitude>\n                <longitude>103.752745</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 14</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 14</name>\n                <latitude>1.323326</latitude>\n                <longitude>103.949737</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 15</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 15</name>\n                <latitude>1.331640</latitude>\n                <longitude>103.701591</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 16</name>\n            <dropoffLocationName>Changkat Changi Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 16</name>\n                <latitude>1.305639</latitude>\n                <longitude>103.907903</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 17</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 17</name>\n                <latitude>1.300406</latitude>\n                <longitude>103.788796</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 18</name>\n            <location>\n                <name>Student 18</name>\n                <latitude>1.269622</latitude>\n                <longitude>103.827993</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bishan Loft</name>\n            <location>\n                <name>Bishan Loft Block 31</name>\n                <latitude>1.347593</latitude>\n                <longitude>103.852434</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Yew Tee</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>Block 632 Yew Tee</name>\n                <latitude>1.396750</latitude>\n                <longitude>103.748564</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Changi Airport</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Changi Airport</name>\n                <latitude>1.355246</latitude>\n                <longitude>103.988475</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Neo Tiew Rd</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>161 Newo Tiew Rd</name>\n                <latitude>1.430672</latitude>\n                <longitude>103.723253</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Oassis Terraces</name>\n            <location>\n                <name>Oasis Terraces</name>\n                <latitude>1.402721</latitude>\n                <longitude>103.912795</longitude>\n            </location>\n            <dropoffLocationName>Compassvale Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bayshore</name>\n            <location>\n                <name>34 Bayshore Road</name>\n                <latitude>1.313012</latitude>\n                <longitude>103.939276</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Clementi Ave 1</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>425 Clementi Ave 1</name>\n                <latitude>1.309749</latitude>\n                <longitude>103.771281</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Karissdale</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Kerrisdale</name>\n                <latitude>1.313492</latitude>\n                <longitude>103.857975</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>        \n    </studentList>\n    <vehicleList>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 1 from Downtown</name>\n                <latitude>1.380828</latitude>\n                <longitude>103.954016</longitude>\n            </officeLocation>\n            <capacity>15</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 2 from Jurong JEM Mall</name>\n                <latitude>1.332787</latitude>\n                <longitude>103.743121</longitude>\n            </officeLocation>\n            <capacity>12</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 3 from Causeway Point</name>\n                <latitude>1.436213</latitude>\n                <longitude>103.785994</longitude>\n            </officeLocation>\n            <capacity>10</capacity>\n        </com.irsspace.irs.irsVehicle>\t\t\n    </vehicleList>\n</com.irsspace.irs.irsSolution>",
			"<com.irsspace.irs.irsSolution>\n\t<locationMatrixList>\n\t\t<com.irsspace.irs.irsLocationMatrix>\n\t\t\t<startLocation>\n\t\t\t\t\t<name>Bishan Loft Block 31</name>\n\t\t\t</startLocation>\n\t\t\t<toLocation>\n\t\t\t\t\t<name>Changkat Changi Secondary School</name>\n\t\t\t</toLocation>\n\t\t\t<distance>15000</distance>\n\t\t</com.irsspace.irs.irsLocationMatrix>\t\n\t</locationMatrixList>\n    <schoolList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Changkat Changi Secondary School</name>\n            <location>\n                <name>Changkat Changi Secondary School</name>\n                <latitude>1.340171</latitude>\n                <longitude>103.951992</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Punggol Secondary School</name>\n            <location>\n                <name>Punggol Secondary School</name>\n                <latitude>1.407663</latitude>\n                <longitude>103.908624</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Jurong Secondary School</name>\n            <location>\n                <name>Jurong Secondary School</name>\n                <latitude>1.330515</latitude>\n                <longitude>103.724258</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n\t\t<com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Juying Secondary School</name>\n            <location>\n                <name>Juying Secondary School</name>\n                <latitude>1.339888</latitude>\n                <longitude>103.687205</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n\t\t<com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Riverside Secondary School</name>\n            <location>\n                <name>Riverside Secondary School</name>\n                <latitude>1.443531</latitude>\n                <longitude>103.788624</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Raffles Institution</name>\n            <location>\n                <name>Raffles Institution</name>\n                <latitude>1.346979</latitude>\n                <longitude>103.843417</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Nan Hua High School</name>\n            <location>\n                <name>Nan Hua High School</name>\n                <latitude>1.308489</latitude>\n                <longitude>103.768901</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Compassvale Secondary School</name>\n            <location>\n                <name>Compassvale Secondary School</name>\n                <latitude>1.396588</latitude>\n                <longitude>103.899726</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n    </schoolList>\n    <studentList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 1</name>\n            <location>\n                <name>Student 1</name>\n                <latitude>1.330096</latitude>\n                <longitude>103.714467</longitude>\n            </location>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 2</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 2</name>\n                <latitude>1.372813</latitude>\n                <longitude>103.943608</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 3</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 3</name>\n                <latitude>1.455203</latitude>\n                <longitude>103.830688</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 4</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 4</name>\n                <latitude>1.346571</latitude>\n                <longitude>103.767343</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 5</name>\n            <location>\n                <name>Student 5</name>\n                <latitude>1.293414</latitude>\n                <longitude>103.629989</longitude>\n            </location>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 6</name>\n            <location>\n                <name>Student 6</name>\n                <latitude>1.428945</latitude>\n                <longitude>103.756524</longitude>\n            </location>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 8</name>\n            <dropoffLocationName>Juying Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 8</name>\n                <latitude>1.384903</latitude>\n                <longitude>103.766444</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 9</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 9</name>\n                <latitude>1.321344</latitude>\n                <longitude>103.781071</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 10</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 10</name>\n                <latitude>1.416759</latitude>\n                <longitude>103.833433</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 11</name>\n            <dropoffLocationName>Riverside Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 11</name>\n                <latitude>1.387071</latitude>\n                <longitude>103.752745</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 14</name>\n            <dropoffLocationName>Punggol Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 14</name>\n                <latitude>1.323326</latitude>\n                <longitude>103.949737</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 15</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 15</name>\n                <latitude>1.331640</latitude>\n                <longitude>103.701591</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 16</name>\n            <dropoffLocationName>Changkat Changi Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 16</name>\n                <latitude>1.305639</latitude>\n                <longitude>103.907903</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 17</name>\n            <dropoffLocationName>Jurong Secondary School</dropoffLocationName>\n            <location>\n                <name>Student 17</name>\n                <latitude>1.300406</latitude>\n                <longitude>103.788796</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\t\t\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student 18</name>\n            <location>\n                <name>Student 18</name>\n                <latitude>1.269622</latitude>\n                <longitude>103.827993</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bishan Loft</name>\n            <location>\n                <name>Bishan Loft Block 31</name>\n                <latitude>1.347593</latitude>\n                <longitude>103.852434</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Yew Tee</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>Block 632 Yew Tee</name>\n                <latitude>1.396750</latitude>\n                <longitude>103.748564</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Changi Airport</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Changi Airport</name>\n                <latitude>1.355246</latitude>\n                <longitude>103.988475</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Neo Tiew Rd</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>161 Newo Tiew Rd</name>\n                <latitude>1.430672</latitude>\n                <longitude>103.723253</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Oassis Terraces</name>\n            <location>\n                <name>Oasis Terraces</name>\n                <latitude>1.402721</latitude>\n                <longitude>103.912795</longitude>\n            </location>\n            <dropoffLocationName>Compassvale Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bayshore</name>\n            <location>\n                <name>34 Bayshore Road</name>\n                <latitude>1.313012</latitude>\n                <longitude>103.939276</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Clementi Ave 1</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>425 Clementi Ave 1</name>\n                <latitude>1.309749</latitude>\n                <longitude>103.771281</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Karissdale</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Kerrisdale</name>\n                <latitude>1.313492</latitude>\n                <longitude>103.857975</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>        \n    </studentList>\n    <vehicleList>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 1 from Downtown</name>\n                <latitude>1.380828</latitude>\n                <longitude>103.954016</longitude>\n            </officeLocation>\n            <capacity>15</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 2 from Jurong JEM Mall</name>\n                <latitude>1.332787</latitude>\n                <longitude>103.743121</longitude>\n            </officeLocation>\n            <capacity>12</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 3 from Causeway Point</name>\n                <latitude>1.436213</latitude>\n                <longitude>103.785994</longitude>\n            </officeLocation>\n            <capacity>10</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 4 from Paya Lebar Square</name>\n                <latitude>1.319312</latitude>\n                <longitude>103.892462</longitude>\n            </officeLocation>\n            <capacity>10</capacity>\n        </com.irsspace.irs.irsVehicle>\n    </vehicleList>\n</com.irsspace.irs.irsSolution>"];
		var choosenDataSet = 0;
		var promises = [];
		var coordinatesArray=[];
		var map;
		var colorCodes = ['black','blue','red','green','yellow'];
		
		window.onload = regiserKIESolvers();
		
		function Plot(){

			var aboveMap = document.getElementById("aboveMap");
            aboveMap.innerHTML =document.write= '' +
            	'<button id="solveButton" class="btn btn-default" type="submit" onclick="solve()" >Find Best Route for the Students</button>' + 
            	'<input type="text" id="score" name="score" value="0">' +
            	'<br><b>Mouse over or Click <img src="student.png" width="20" height="20"> Student, <img src="school.png" width="20" height="20">School or  <img src="redBus.png" width="20" height="20">Vehicle for information</b>';
        					
			var radios = document.getElementsByName('DataSet');

			for (var i = 0, length = radios.length; i < length; i++)
			{
			 if (radios[i].checked)
			 {
			  choosenDataSet = i;
			  break;
			 }
			}
			initMap();
			
			console.log("ending now");	
			
		}
		
		function initMap() {
			
			var postData  = datasetValues[choosenDataSet];
			var marker ;
			var cnt =0;
			
			//Initialise the map
			 var mapcenter = {lat: 1.356521, lng: 103.83077700000001};
			 map = new google.maps.Map(document.getElementById('map'), {
		          zoom: 12,
				  center: mapcenter
		     });
			 
			 //Plot the student
			  
			  var studentArray = $(postData).find('studentList').children();
			   for( cnt =0;cnt<studentArray.length;cnt++){
				  console.log(" Plotting studentArray" +cnt);
				  var dropoffLoc = $(studentArray[cnt]).find('dropoffLocationName').text();		
			  	  $(studentArray[cnt]).find('location').each(function(){
			  		  var name = $(this).find('name').text();	  		  
			  	 	  var latitude = $(this).find('latitude').text();
					  var longitude = $(this).find('longitude').text();
					  var student = new google.maps.LatLng(latitude,longitude);
					  var iconInfo = {url : 'student.png'};    // , scaledSize: new google.maps.Size(64, 64) 
					  createMarker(latitude, longitude, iconInfo, name, name + "; School Name : " + dropoffLoc );
					  // marker = new google.maps.Marker({position: student, map: map});
					
			  	 });
			  }
			
	
			  //Plot the vehicle
			
			 var vehicleArray = $(postData).find('vehicleList').children();
			 for( cnt =0;cnt<vehicleArray.length;cnt++){
				  console.log("Plotting vehicleArray " +cnt);
			  	  $(vehicleArray[cnt]).find('officeLocation').each(function(){
			  		 console.log("vehicleArray" +cnt);
			  		  var name = $(this).find('name').text();
			  	 	  var latitude = $(this).find('latitude').text();
					  var longitude = $(this).find('longitude').text();
					  console.log("vehicleArray" +latitude+"-"+latitude);
					  createMarker(latitude, longitude, {url: "redBus.png", scaledSize: new google.maps.Size(35, 35)}, name, "Starting Location : " + name);
					
			  	 });
			  }
			
			//Plot the vehicle
					
			  var schoolArray = $(postData).find('schoolList').children();
				 for( cnt =0;cnt<schoolArray.length;cnt++){
					  console.log("Plotting schoolArray" +cnt);
				  	  $(schoolArray[cnt]).find('location').each(function(){
				  		  var name = $(this).find('name').text();
				  	 	  var latitude = $(this).find('latitude').text();
						  var longitude = $(this).find('longitude').text();
						  var school  = new google.maps.LatLng(latitude,longitude);
						  createMarker(latitude, longitude, {url: "school.png", scaledSize: new google.maps.Size(35, 35)}, name, "School Name : " + name );
						  
						  // marker = new google.maps.Marker({position: school, icon: goldStar ,map: map});
						  
						
				  	 });
				  }
			
						
		
			
		  }
		
		function createMarker(lat, lng, iconInfo, titleName, infoData){ 
			console.log("IconInfo path : " + iconInfo );
			let marker = new google.maps.Marker({
			       map: map,
			       position: new google.maps.LatLng(lat, lng),
			       icon: iconInfo,
			       title: titleName
			    });
			    let infowindow = new google.maps.InfoWindow({
			        content: infoData
			    });
			    google.maps.event.addListener(marker, 'click', function() {
			        infowindow.open(map,marker);
			    });
			
/* 			var vehicle  = new google.maps.LatLng(latitude,longitude);
		  	marker = new google.maps.Marker({position: vehicle, 
			  			icon: {path: google.maps.SymbolPath.CIRCLE,scale:5},
			  			map: map,
		  				title: name
		  			   });
		  	var infowindow = new google.maps.InfoWindow({
		  	content: "Starting Location" + name
		  	});
		  	google.maps.event.addListener(marker, 'click', function() {
		    infowindow.open(map,marker);
		  	});  */
		}
		  
		  
		function  coordinateUser(coordinates) {
			console.log("coordinates", coordinates);
		}
		
		async function solve(){
			console.log("Inside solve function");
			registerIRSSolverPost();
			await new Promise((resolve, reject) => setTimeout(resolve, 1000));
			registerIRSSolverBestSolutionGet();
			await new Promise((resolve, reject) => setTimeout(resolve, 1000));
			
			console.log("end solve function");
		}
		
		function regiserKIESolvers(){
			console.log("Inside regiserKIESolvers");
			registerIRSSolverPut();
			registerIRSSolverGet();
			
			
		}
		
		function retrieveLatLongPoints(response) {
		  	
		  var vehicleListArray = $(response).find('vehicleList').children();
		  var cnt =0;
		  for( cnt =0;cnt<vehicleListArray.length;cnt++){
			  	  console.log("vehicle" +cnt);
			  	  var index =0;
			  	  var dropoffpoints=[[]];
			  	  var pickupDropoffName=[];
				  var officepoints=[[]];
				  var mappoints= [[]];
			 	  $(vehicleListArray[cnt]).find('location').each(function(){
			 		  pickupDropoffName[index] = $(this).find('name').text();
			  	 	  var latitude = $(this).find('latitude').text();
					  var longitude = $(this).find('longitude').text();
					  dropoffpoints[index] = [latitude,longitude];
					  index++;
					  //console.log(latitude,longitude);
			  	 });
			 	 $(vehicleListArray[cnt]).find('officeLocation').each(function(){
				  	  console.log("officeLocation" +cnt);
				  	pickupDropoffName[index] = $(this).find('name').text();
					  var latitude = $(this).find('latitude').text();
					  var longitude = $(this).find('longitude').text();
					  officepoints= [latitude,longitude];
				 	  //console.log(latitude,longitude);
				  });
			 
				  //Reverse the point for mapping order points()
				  mappoints.push(officepoints);
				  index=dropoffpoints.length-1;
				  for( index =dropoffpoints.length-1;index>=0;index--){
					  mappoints.push(dropoffpoints[index]);
				  }
				  mappoints.push(officepoints);
				  /*console.log();
				   index=0;
				  for( index =0;index<mappoints.length;index++){
					  console.log("mappoints[]"+mappoints[index]);
				  }*/
				  console.log("Calling drawDirections function ");
				  drawDirections(mappoints,colorCodes[cnt]);
				  
		  }
		  console.log("retrieveScore in retrieveLatLongPoints");
		  retrieveScore(response);
		}
		  

		
		
		
		function drawDirections(mappoints,color) {
			var waypts = [];
	        
			var drawindex=1;
			for( drawindex =1;drawindex<mappoints.length;drawindex++){
				var latlng = new google.maps.LatLng(mappoints[drawindex][0],mappoints[drawindex][1]);
				waypts.push(latlng);
			}
			console.log("Starting Polyline");
			
			var lineSymbol = {
			          path: google.maps.SymbolPath.CIRCLE,
			          scale: 8,
			          strokeColor: '#393'
			        };
			
			var line = new google.maps.Polyline({
				path: waypts,
				icons: [{
		            icon: lineSymbol,
		            offset: '100%'
		          }],
				geodesic: true,
				strokeColor: color,
				strokeOpacity: 0.8,
				strokeWeight: 4
			});
			line.setMap(map);
			
			console.log("Polyline drawn. Going to Animate...");
			animateCircle(line);
	       }
		
		// Use the DOM setInterval() function to change the offset of the symbol
	      // at fixed intervals.
	      function animateCircle(line) {
	          var count = 0;
	          window.setInterval(function() {
	            count = (count + 1) % 220;
				// console.log("Inside animation..");
	            var icons = line.get('icons');
	            icons[0].offset = (count / 2) + '%';
	            line.set('icons', icons);
	        }, 70);
		}
		
		function retrieveScore(response){
			console.log("retrieveScore  ");
			var bestsolution = response.find('best-solution').children();
			// var score = $(bestsolution).find('score').text();
			console.log(bestsolution);
			var scoreTemp = $(response).find('score').text();
			var score = "Score : " + scoreTemp.split("soft",1) + "soft"
			console.log("score " +score);
			document.getElementById("score").value=score;
		}
		
		function registerIRSSolverPut(){
			
			console.log("I am calling instantiated solver by put reqeust ");
			var putSettings = {
				  "async": true,
				  "crossDomain": true,
				  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers/irsSolutionSolver2",
				  "method": "PUT",
				  "headers": {
				    "X-KIE-ContentType": "xstream",
				    "Content-Type": "application/xml",
				    "Authorization": "Basic d2JhZG1pbjp3YmFkbWlu",
				    "cache-control": "no-cache",
				    "Postman-Token": "4e618ace-fac3-477b-8d27-a0f20284727c"
				  },
				  "data": "<solver-instance>\n  <solver-config-file>com/irsspace/irs/irsSolutionSolverConfig.solver.xml</solver-config-file>\n</solver-instance>"
				}

				$.ajax(putSettings).done(function (response) {
					console.log("get output");
				  	console.log(response);
				});
		}
		
		function registerIRSSolverGet(){
			console.log("I am calling get solver ");

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
					    "Postman-Token": "187ca8f2-5ea3-41fd-9ae1-6d6a5b3a7185"
					  }
					}

					$.ajax(getSettings).done(function (response) {
					  console.log("put output");
					  console.log(response);
					});
		}
		
		function registerIRSSolverPost(){
			console.log("I am calling post solver ");
			//console.log("datset1"+dataset1);
			var postSettings = {
				  "async": true,
				  "crossDomain": true,
				  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers/irsSolutionSolver2/state/solving",
				  "method": "POST",
				  "headers": {
				    "Content-Type": "application/xml",
				    "X-KIE-ContentType": "xstream",
				    "Authorization": "Basic d2JhZG1pbjp3YmFkbWlu",
				    "cache-control": "no-cache",
				    "Postman-Token": "e9800123-993f-4543-8d41-b62e913d3645"
				  },
				  //"data": "<com.irsspace.irs.irsSolution>\n\t<locationMatrixList>\n\t\t<com.irsspace.irs.irsLocationMatrix>\n\t\t\t<startLocation>\n\t\t\t\t\t<name>Bishan Loft Block 31</name>\n\t\t\t</startLocation>\n\t\t\t<toLocation>\n\t\t\t\t\t<name>Raffles Institution</name>\n\t\t\t</toLocation>\n\t\t\t<distance>15000</distance>\n\t\t</com.irsspace.irs.irsLocationMatrix>\t\n\t</locationMatrixList>\n    <schoolList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Raffles Institution</name>\n            <location>\n                <name>Raffles Institution</name>\n                <latitude>1.346979</latitude>\n                <longitude>103.843417</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Nan Hua High School</name>\n            <location>\n                <name>Nan Hua High School</name>\n                <latitude>1.308489</latitude>\n                <longitude>103.768901</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Compassvale Secondary School</name>\n            <location>\n                <name>Compassvale Secondary School</name>\n                <latitude>1.396588</latitude>\n                <longitude>103.899726</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n    </schoolList>\n    <studentList>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bishan Loft</name>\n            <location>\n                <name>Bishan Loft Block 31</name>\n                <latitude>1.347593</latitude>\n                <longitude>103.852434</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Yew Tee</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>Block 632 Yew Tee</name>\n                <latitude>1.396750</latitude>\n                <longitude>103.748564</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Changi Airport</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Changi Airport</name>\n                <latitude>1.355246</latitude>\n                <longitude>103.988475</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Neo Tiew Rd</name>\n            <dropoffLocationName>Nan Hua High School</dropoffLocationName>\n            <location>\n                <name>161 Newo Tiew Rd</name>\n                <latitude>1.430672</latitude>\n                <longitude>103.723253</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Oassis Terraces</name>\n            <location>\n                <name>Oasis Terraces</name>\n                <latitude>1.402721</latitude>\n                <longitude>103.912795</longitude>\n            </location>\n            <dropoffLocationName>Compassvale Secondary School</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Bayshore</name>\n            <location>\n                <name>34 Bayshore Road</name>\n                <latitude>1.313012</latitude>\n                <longitude>103.939276</longitude>\n            </location>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Clementi Ave 1</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>425 Clementi Ave 1</name>\n                <latitude>1.309749</latitude>\n                <longitude>103.771281</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n        <com.irsspace.irs.irsPickupDropoffParticulars>\n            <name>Student of Karissdale</name>\n            <dropoffLocationName>Raffles Institution</dropoffLocationName>\n            <location>\n                <name>Kerrisdale</name>\n                <latitude>1.313492</latitude>\n                <longitude>103.857975</longitude>\n            </location>\n        </com.irsspace.irs.irsPickupDropoffParticulars>\n    </studentList>\n    <vehicleList>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 1 from Bedok Mall</name>\n                <latitude>1.324944</latitude>\n                <longitude>103.929392</longitude>\n            </officeLocation>\n            <capacity>10</capacity>\n        </com.irsspace.irs.irsVehicle>\n        <com.irsspace.irs.irsVehicle>\n            <officeLocation>\n                <name>Vehicle 2 from Jurong JEM Mall</name>\n                <latitude>1.332787</latitude>\n                <longitude>103.743121</longitude>\n            </officeLocation>\n            <capacity>4</capacity>\n        </com.irsspace.irs.irsVehicle>\n    </vehicleList>\n</com.irsspace.irs.irsSolution>"
				  "data":datasetValues[choosenDataSet]
				}
				// console.log(datasetValues);
				var res = $.ajax(postSettings).done(function (response) {
				  console.log("post output");
				  console.log(response);
				});
				console.log("ajax post response text : " + res.responseText); 
			}
		
		function registerIRSSolverBestSolutionGet(){
			console.log("I am calling get best solution ");
			var responseText;
			var getBestSettings = {
					  "async": false,
					  "crossDomain": true,
					  "url": "http://localhost:8080/kie-server/services/rest/server/containers/irs-Intelligent-Rapid-Shuttle_1.0.0/solvers/irsSolutionSolver2/bestsolution",
					  "method": "GET",
					  "headers": {
					    "X-KIE-ContentType": "xstream",
					    "Content-Type": "application/xml",
					    "Authorization": "Basic d2JhZG1pbjp3YmFkbWlu",
					    "cache-control": "no-cache",
					    "Postman-Token": "d32a58ea-ab5a-4e3e-8ec6-644c5e14b15c"
					  }
					};
			
			 
					$.ajax(getBestSettings).done(function (response) {
					  console.log("getBest output");
					  retrieveLatLongPoints($(response));		
					  
					});
		}
		



    </script>
   

  </body>
</html>

</body>
</html>