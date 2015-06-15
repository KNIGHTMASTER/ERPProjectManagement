
<%@ page import="ProjectCostManagement.EstimateCost.BasicOfEstimate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-basicOfEstimate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-basicOfEstimate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <g:each in="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}"  var="prj">
                          <g:hiddenField name="tot" value="${tot=0}"/>
                          <label> </label>
                                <label><strong style="color: blue"><b>Project ${prj.projectName}</b></strong></label>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="basicOfEstimate.idMilestone.label" default="Id Milestone" /></th>
					
						<g:sortableColumn property="estimateCost" title="${message(code: 'basicOfEstimate.pessimistic.label', default: 'Estimate Cost')}" />
					
						<g:sortableColumn property="reserve" title="${message(code: 'basicOfEstimate.optimistic.label', default: 'Reserve')}" />
					
						<g:sortableColumn property="estimateCostProject" title="${message(code: 'basicOfEstimate.costMethodology.label', default: 'Estimate Cost Project')}" />
					
						<g:sortableColumn property="costMethodology" title="${message(code: 'basicOfEstimate.mostLikelyEstimate.label', default: 'Cost Methodology')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${basicOfEstimateInstanceList}" status="i" var="basicOfEstimateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${basicOfEstimateInstance.id}">${fieldValue(bean: basicOfEstimateInstance, field: "idMilestone")}</g:link></td>
					
						<td>${fieldValue(bean: basicOfEstimateInstance, field: "estimateCost")}</td>
					
						<td>${fieldValue(bean: basicOfEstimateInstance, field: "reserve")}</td>
					
						<td>${fieldValue(bean: basicOfEstimateInstance, field: "estimateCostProject")}</td>
					
						<td>${fieldValue(bean: basicOfEstimateInstance, field: "costMethodology")}</td>
					
					</tr>
                                <g:hiddenField name="tot" value="${tot+=basicOfEstimateInstance.estimateCostProject}"/>
				</g:each>
				</tbody>
			</table>
                        <label style="text-align: right;"><b>Total Estimate Cost Project = Rp. ${tot} </b></label>
                        </g:each>
			<div class="pagination">
				<g:paginate total="${basicOfEstimateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
