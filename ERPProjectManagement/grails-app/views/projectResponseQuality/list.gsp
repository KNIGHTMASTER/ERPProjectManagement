
<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponseQuality" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

        <style type="text/css">
        table.hovertable {
            font-family: verdana,arial,sans-serif;
            font-size:14px;
            color:#333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }
        table.hovertable th {
            background-color:#c3dde0;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        table.hovertable tr {
            background-color:#d4e3e5;
        }
        table.hovertable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        </style>
        <script type="text/javascript">
            //boxmiu
            $(document).ready(function(){
                $("#tombolMiuCost").click(function(){
                    $("#isiMiuCost").slideToggle("slow");
                });
            });
        </script>

        <script type="text/javascript">
            //boxmiu
            $(document).ready(function(){
                $("#tombolMiuTime").click(function(){
                    $("#isiMiuTime").slideToggle("slow");
                });
            });

            $(document).ready(function(){
                $("#tombolProjectStatus").click(function(){
                    $("#GanttChartDIV").slideToggle("slow");
                });
            });
        </script>

	</head>
	<body>
		<a href="#list-projectResponseQuality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectResponseQuality" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectResponseQuality.projectCharter.label" default="Project Charter" /></th>
					
						<th><g:message code="projectResponseQuality.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="quality" title="${message(code: 'projectResponseQuality.quality.label', default: 'Quality')}" />
					
						<g:sortableColumn property="scope" title="${message(code: 'projectResponseQuality.scope.label', default: 'Scope')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectResponseQualityInstanceList}" status="i" var="projectResponseQualityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectResponseQualityInstance.id}">${fieldValue(bean: projectResponseQualityInstance, field: "projectCharter")}</g:link></td>
					
						<td>${fieldValue(bean: projectResponseQualityInstance, field: "stakeholder")}</td>
					
						<td>${fieldValue(bean: projectResponseQualityInstance, field: "quality")}</td>
					
						<td>${fieldValue(bean: projectResponseQualityInstance, field: "scope")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            <br>
            <div id="tombolMiuCost"></di><label style="text-align: left; color: green; font-size: 20px"><strong>Miu Quality </strong></label></div>
            <div id="isiMiuCost" style="display: none">
                <img src="../images/fuzzy/quality.png" width="400px" height="167px"/>

                <br>
                Hasil &mu; Quality = ${miuQuality}
            </div>
            <br>
            <div id="tombolMiuTime"><label style="text-align: left; color: green; font-size: 20px"><strong>Miu Scope</strong></label></div>
            <div id="isiMiuTime" style="display: none">
                <img src="../images/fuzzy/scope.png" width="402px" height="171px"/>
                <br>
                Hasil &mu; Scope = ${miuScope}
            </div>
            <br>
            <label style="text-align: left; color: green; font-size: 20px"><strong>Output Role : </strong></label>
            <table border="1">
                <table>
                    <tr>
                        <td>
                            <table class="hovertable">
                                <tr>
                                    <th>Scope/ Quality</th><th>VL</th><th>L</th><th>M</th><th>H</th><th>VH</th>
                                </tr>
                                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                    <td style="text-align: center">VL</td><td>E</td><td>E</td><td>D</td><td>D</td><td>D</td>
                                </tr>
                                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                    <td style="text-align: center">L</td><td>E</td><td>E</td><td>D</td><td>D</td><td>C</td>
                                </tr>
                                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                    <td style="text-align: center">M</td><td>D</td><td>D</td><td>C</td><td>C</td><td>B</td>
                                </tr>
                                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                    <td style="text-align: center">H</td><td>D</td><td>D</td><td>C</td><td>B</td><td>A</td>
                                </tr>
                                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                    <td style="text-align: center">VH</td><td>D</td><td>C</td><td>B</td><td>A</td><td>A</td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <h2><strong>Keterangan :</strong></h2>
                            <h3> A : Project Diselesaikan</h3>
                            <h3> B : Project Dilanjutkan</h3>
                            <h3> C : Project Diperbaiki</h3>
                            <h3> D : Project Harus ada Perubahan</h3>
                            <h3> E : Project Digagalkan</h3>
                        </td>
                    </tr>
                </table>
            </table>
            <br>
            <div id="tombolProjectStatus"><label style="text-align: left; color: green; font-size: 20px"><strong>Project Status</strong></label></div>
            <div style="position:relative; display:none" class="calendar" id="GanttChartDIV">
                <%--${gantt}--%>
                <table>
                    <thead>
                    <tr>

                        <th><g:message code="inspection.projectName.label" default="Project Name" /></th>

                        <th><g:message code="inspection.deliverable.label" default="Deliverable" /></th>

                        <g:sortableColumn property="decision" title="${message(code: 'inspection.decision.label', default: 'Status')}" />

                        <g:sortableColumn property="realization" title="${message(code: 'inspection.realization.label', default: 'Realization')}" />

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inspectionInstanceList}" status="i" var="inspectionInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${inspectionInstance.id}">${fieldValue(bean: inspectionInstance, field: "projectName")}</g:link></td>

                            <td>${inspectionInstance.deliverable}</td>

                            <td>${inspectionInstance.decision}</td>

                            <td>${inspectionInstance.realization}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <br>
            <label style="text-align: left; color: green; font-size: 20px"><strong>Hasil Defuzzifikasi : </strong></label>
            ${hasilDefuzzifikasi}
            <br>
            <br>
            <label style="text-align: left; color: green; font-size: 20px"><strong>Hasil Pengurutan Ascending Defuzzifikasi : </strong></label>
            ${sortAscDefuzzi}
            <br>
            <br>
            <label style="text-align: left; color: green; font-size: 20px"><strong>Hasil Pengurutan Descending Defuzzifikasi : </strong></label>
            ${sortDescDefuzzi}
			<div class="pagination">
				<g:paginate total="${projectResponseQualityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
