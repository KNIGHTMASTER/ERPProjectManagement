
<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostActivity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCostActivity.label', default: 'MaterialCostActivity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materialCostActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../MaterialCostUse/"><g:message code="Material Cost Use List"/></a></li>
                                <li><a class="list" href="../MaterialCostPayment/"><g:message code="Material Cost Payment List"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>
			</ul>
		</div>
		<div id="list-materialCostActivity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="materialCostActivity.cost.label" default="Cost" /></th>
					
						<th><g:message code="materialCostActivity.material.label" default="Material" /></th>
                                                
						<g:sortableColumn property="total" title="${message(code: 'materialCostActivity.total.label', default: 'Total Planned')}" />
					
						<g:sortableColumn property="earnedValue" title="${message(code: 'materialCostActivity.total.label', default: 'Total Use')}" />
					
						<g:sortableColumn property="actualCost" title="${message(code: 'materialCostActivity.total.label', default: 'Total Payment')}" />
					
						<g:sortableColumn property="approve" title="${message(code: 'materialCostActivity.approve.label', default: 'Approve')}" />
					
					</tr>
				</thead>
				<tbody>
                                  <g:hiddenField name="cost" value="${cost=0}"/>
                                  <g:hiddenField name="ev" value="${ev=0}"/>
                                  <g:hiddenField name="ac" value="${ac=0}"/>
				<g:each in="${materialCostActivityInstanceList}" status="i" var="materialCostActivityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialCostActivityInstance.id}">${fieldValue(bean: materialCostActivityInstance, field: "cost")}</g:link></td>
					
						<td>${fieldValue(bean: materialCostActivityInstance, field: "material")}</td>
					
						<td>${fieldValue(bean: materialCostActivityInstance, field: "total")}</td>
						
                                                <td>${fieldValue(bean: materialCostActivityInstance, field: "earnedValue")}</td>
					
						<td>${fieldValue(bean: materialCostActivityInstance, field: "actualCost")}</td>
                                                				
						<td><g:formatBoolean boolean="${materialCostActivityInstance.approve}" /></td>
					
					</tr>
                                        <g:hiddenField name="cost" value="${cost+=materialCostActivityInstance.total}"/>
                                        <g:hiddenField name="ev" value="${ev+=materialCostActivityInstance.earnedValue}"/>
                                        <g:hiddenField name="ac" value="${ac+=materialCostActivityInstance.actualCost}"/>
                                 </g:each>
				</tbody>
			</table>
                            <label style="text-align: right;"><strong>Total Material Cost Plan : Rp ${cost} </strong></label>
                            <label style="text-align: right;"><strong>Total Earned Value Material : Rp ${ev}</strong></label>
                            <label style="text-align: right;"><strong>Total Actual Material Cost : Rp ${ac}</strong></label>
			<div class="pagination">
				<g:paginate total="${materialCostActivityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
