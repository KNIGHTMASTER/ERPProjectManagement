
<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostActivity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementCostActivity.label', default: 'ManagementCostActivity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-managementCostActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../ManagementCostUse/"><g:message code="Management Cost Use List"/></a></li>
                                <li><a class="list" href="../ManagementCostPayment/"><g:message code="Management Cost Payment List"/></a></li>
			</ul>
		</div>
		<div id="list-managementCostActivity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="managementCostActivity.cost.label" default="Cost" /></th>
					
						<g:sortableColumn property="detail" title="${message(code: 'managementCostActivity.detail.label', default: 'Detail')}" />
					
                                                <g:sortableColumn update="content_index_wrapper" property="price" title="${message(code: 'managementCostActivity.price.label', default: 'Total Planned')}" />

                                                <g:sortableColumn update="content_index_wrapper" property="totalUsed" title="${message(code: 'managementCostActivity.totalUsed.label', default: 'Total Used')}" />
                                                
                                                <g:sortableColumn update="content_index_wrapper" property="totalPayment" title="${message(code: 'managementCostActivity.totalPayment.label', default: 'Total Payment')}" />
                        
                                                <th><g:message code="managementCostActivity.approve.label" default="Appoval" /></th>
                                                
					</tr>
				</thead>
				<tbody>
                                  <g:hiddenField name="cost" value="${cost=0}"/>
                                  <g:hiddenField name="ev" value="${ev=0}"/>
                                  <g:hiddenField name="ac" value="${ac=0}"/>
                                  <g:each in="${managementCostActivityInstanceList}" status="i" var="managementCostActivityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managementCostActivityInstance.id}">${fieldValue(bean: managementCostActivityInstance, field: "cost")}</g:link></td>
					
						<td>${fieldValue(bean: managementCostActivityInstance, field: "detail")}</td>
					
						<td>${fieldValue(bean: managementCostActivityInstance, field: "price")}</td>
					
                                                <td>${fieldValue(bean: managementCostActivityInstance, field: "earnedValue")}</td>
					
						<td>${fieldValue(bean: managementCostActivityInstance, field: "actualCost")}</td>
                                                
                                                <td>${fieldValue(bean: managementCostActivityInstance, field: "approve")}</td>
                                                
					</tr>
                                        <g:hiddenField name="cost" value="${cost+=managementCostActivityInstance.price}"/>
                                        <g:hiddenField name="ev" value="${ev+=managementCostActivityInstance.earnedValue}"/>
                                        <g:hiddenField name="ac" value="${ac+=managementCostActivityInstance.actualCost}"/>
                                 </g:each>
				</tbody>
			</table>
                            <label style="text-align: right;"><strong>Total Management Cost Plan : Rp ${cost} </strong></label>
                            <label style="text-align: right;"><strong>Total Earned Value Management : Rp ${ev}</strong></label>
                            <label style="text-align: right;"><strong>Total Actual Management Cost : Rp ${ac}</strong></label>
			<div class="pagination">
				<g:paginate total="${managementCostActivityInstanceTotal}" />
			</div>
                        <span><export:formats formats="['csv', 'excel', 'pdf', 'rtf', 'xml']" /></span>
		</div>
	</body>
</html>
