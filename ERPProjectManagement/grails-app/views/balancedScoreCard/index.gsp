
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<title>BSC for Project ${namaProyek}</title>
		<!--1) include file jquery.min.js dan higchart.js-->

                <script type="text/javascript" src="${resource(dir:'js/', file:'jquery.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/', file:'highcharts.js')}"></script>
                <script type="text/javascript" src="${resource(dir:'js/', file:'exporting.js')}"></script>
		
</head>
	<body>

<!--grafik akan ditampilkan disini -->
<div align="center"><label style="text-align: center; font-size:50px; color: green"><strong>Project ${namaProyek}</strong></label></div>
<div id="containerBSC" style="min-width: 400px;height: 400px; margin: 0 auto">
        ${dataBSC}
</div>

</body>
</html>
		