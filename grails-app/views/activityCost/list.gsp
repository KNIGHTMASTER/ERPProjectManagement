
<%@ page import="ProjectCostManagement.DetermineBudget.ActivityCost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCost.label', default: 'ActivityCost')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityCost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../HumanResourceCost/"><g:message code="Human Resource Cost List"/></a></li>
                                <li><a class="list" href="../SalaryHumanResource/"><g:message code="Salary Human Resource List"/></a></li>
			</ul>
		</div>
		<div id="list-activityCost" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="activityCost.cost.label" default="Cost" /></th>
                                                <th>Workers</th>
						<g:sortableColumn update="content_index_wrapper" property="total" title="${message(code: 'activityCost.total.label', default: 'Total Planned')}" />
					 
                                                <g:sortableColumn update="content_index_wrapper" property="earnedValue" title="${message(code: 'activityCost.earnedValue.label', default: 'Earned Value')}" />
                                                
                                                <g:sortableColumn update="content_index_wrapper" property="actualCost" title="${message(code: 'activityCost.actualCost.label', default: 'Actual Cost')}" />
                        
						<g:sortableColumn property="approve" title="${message(code: 'activityCost.approve.label', default: 'Approve')}" />
					
					</tr>
				</thead>
				<tbody>
                                  <g:hiddenField name="cost" value="${cost=0}"/>
                                  <g:hiddenField name="ev" value="${ev=0}"/>
                                  <g:hiddenField name="ac" value="${ac=0}"/>
				<g:each in="${activityCostInstanceList}" status="i" var="activityCostInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityCostInstance.id}">${fieldValue(bean: activityCostInstance, field: "cost")}</g:link></td>                               
						<td>${fieldValue(bean: activityCostInstance, field: "workers")}</td>
                                                					
						<td>${fieldValue(bean: activityCostInstance, field: "total")}</td>
					
                                                <td>${fieldValue(bean: activityCostInstance, field: "earnedValue")}</td>
                                                
						<td>${fieldValue(bean: activityCostInstance, field: "actualCost")}</td>
                                                
						<td><g:formatBoolean boolean="${activityCostInstance.approve}" /></td>
					
					</tr>
                                        <g:hiddenField name="cost" value="${cost+=activityCostInstance.total}"/>
                                        <g:hiddenField name="ev" value="${ev+=activityCostInstance.earnedValue}"/>
                                        <g:hiddenField name="ac" value="${ac+=activityCostInstance.actualCost}"/>
                                 </g:each>
				</tbody>
			</table>
                            <label style="text-align: right;"><strong>Total Human Resource Cost Plan : Rp ${cost} </strong></label>
                            <label style="text-align: right;"><strong>Total Earned Value : Rp ${ev}</strong></label>
                            <label style="text-align: right;"><strong>Total Actual Cost : Rp ${ac}</strong></label>
			<div class="pagination">
				<g:paginate total="${activityCostInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
