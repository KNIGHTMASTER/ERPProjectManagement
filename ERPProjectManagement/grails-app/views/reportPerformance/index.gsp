<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <style>
    #ganttTitle{
        background-color:#FFD700;
        font-family:tahoma, arial, verdana;
        padding:5px;
        font-size: 30px;
        width:100%;
        height:40px;
    }
    #bscTitle{
        background-color:#ADFF2F;
        padding:5px;
        font-family:tahoma, arial, verdana;
        font-size: 30px;
        width:100%;
        height:40px;
    }
    #kpiTitle{
        background-color:#00FFFF;
        padding:5px;
        font-family:tahoma, arial, verdana;
        font-size: 30px;
        width:100%;
        height:40px;
    }
    #activityTitle{
        background-color:#FFFF00;
        padding:5px;
        font-family:tahoma, arial, verdana;
        font-size: 30px;
        width:100%;
        height:40px;
    }
    #costTitle{
        background-color:#FF4500;
        padding:5px;
        font-family:tahoma, arial, verdana;
        font-size: 30px;
        width:100%;
        height:40px;
    }
    </style>

    <%--Start Forecasting--%>
    <script type="text/javascript" src="${resource(dir:'js/forecasting/', file:'Chart.js')}"></script>
    <meta name = "viewport" content = "initial-scale = 1, user-scalable = no">
    <style>
    canvas{
    }
    </style>
    <%--End Forecasting--%>

    <!--<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'layout_1.css')}" type="text/css">-->
    <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/gantt', file: 'jsgantt.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: 'js/gantt', file: 'jsgantt.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/gantt', file: 'jsgantt.compressed.js')}"></script>


    <script type="text/javascript" src="${resource(dir:'js/', file:'jquery.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js/', file:'highcharts.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js/', file:'exporting.js')}"></script>

    <script type="text/javascript">
        //gantt
        $(document).ready(function(){
            $("#ganttTitle").click(function(){
                $("#GanttChartDIV").slideToggle("slow");
            });
        });

        //bsc
        $(document).ready(function(){
            $("#bscTitle").click(function(){
                $("#containerBSC").slideToggle("slow");
            });
        });

        //kpi
        $(document).ready(function(){
            $("#kpiTitle").click(function(){
                $("#containerKPI").slideToggle("slow");
            });
        });

        //cost
        $(document).ready(function(){
            $("#costTitle").click(function(){
                $("#containerCost").slideToggle("slow");
            });
        });
    </script>

</head>
<body>

<!--grafik akan ditampilkan disini -->
<div align="center">
    <label style="text-align: center; font-size:40px; color: green"><strong>Project ${namaProyek}</strong></label>
    <br>
    <br>
    <br>
    <div id="ganttTitle">Gantt Chart</div>
    <div style=" display: none" class="calendar" id="GanttChartDIV">
        ${gantt}
    </div>

    <div id="bscTitle">Balanced Scorecard</div>
    <div id="containerBSC" style="display:none">
        ${dataBSC}
    </div>

    <div id="kpiTitle">KPI Barchart</div>
    <div id="containerKPI" style="display:none;">
        ${data2}
    </div>

    <div id="costTitle">Cost Forecasting</div>
    <div id="containerCost" style="display:none">
        <canvas id="canvas" height="250" width="400">
            ${forecasting}
        </canvas>
    </div>

    <div id="activityTitle"><a href="../DiagramActivity/" target="_blank" style="color: #000000">Diagram Activity</a></div>

</div


</body>
</html>
