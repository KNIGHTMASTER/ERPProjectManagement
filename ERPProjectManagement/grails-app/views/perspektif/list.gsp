
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Perspektif" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: '4 Perspektif Balanced Scorecard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-perspektif" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <%--<li><a class="list" href="../FinanceEvAcMaterial/"><g:message code="EV AC Material"/></a></li>
                <li><a class="list" href="../FinanceEvAcManag/"><g:message code="EV AC Management"/></a></li>
                <li><a class="list" href="../FinanceEvAc/"><g:message code="EV AC Activity"/></a></li>
                <li><a class="list" href="../Finance3/"><g:message code="Income"/></a></li>
                <li><a class="list" href="../Net Income/"><g:message code="Payment"/></a></li>
                <li><a class="list" href="../Modal/"><g:message code="Shareholder Equity"/></a></li>
                <li><a class="list" href="../CostManagementPlan/"><g:message code="PV"/></a></li>
                <li><a class="list" href="../Activity/"><g:message code="Activity"/></a></li>
                <li><a class="list" href="../Delay/"><g:message code="Delay"/></a></li>
                <li><a class="list" href="../GetDelay/"><g:message code="Day Loss"/></a></li>
                <li><a class="list" href="../CostRiskIdentified/"><g:message code="NCR"/></a></li>
                <li><a class="list" href="../TimeRiskIdentified/"><g:message code="NTR"/></a></li>
                <li><a class="list" href="../ScopeRiskIdentified/"><g:message code="NSR"/></a></li>--%>
			</ul>
		</div>
		<div id="list-perspektif" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="perspektif.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="data1" title="${message(code: 'perspektif.data1.label', default: 'Data1')}" />
					
						<g:sortableColumn property="data2" title="${message(code: 'perspektif.data2.label', default: 'Data2')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'perspektif.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${perspektifInstanceList}" status="i" var="perspektifInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${perspektifInstance.id}">${fieldValue(bean: perspektifInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: perspektifInstance, field: "data1")}</td>
					
						<td>${fieldValue(bean: perspektifInstance, field: "data2")}</td>
					
						<td>${fieldValue(bean: perspektifInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${perspektifInstanceTotal}" />
			</div>
		</div>
        <br />
    <h1><g:message code="KPI Variables List"/></h1>
    <h2><label style="text-align: left; color: green"><strong>Finance</strong></label></h2>
        Earned Value (EV)=  IDR ${evTotal}<br />
        Actual Cost (AC) = IDR ${acTotal}<br />
        Planned Value (PV) = IDR ${pvTotal}<br />
        Income = IDR ${income}<br />
        Net Income = IDR ${netIncome}<br />
        ShareHolder Equity = IDR ${shareholderequity}<br />
        <br />
    <h2><label style="text-align: left; color: green"><strong>Internal Process Business</strong></label></h2>
        N Activity = ${nActivity}<br />
        N Delay = ${nDelay}<br />
        N Loss Time = ${lossTime}<br />
    <br />
    <h2><label style="text-align: left; color: green"><strong>Learning And Growth</strong></label></h2>
        N Risk = ${nRisk}<br />
        N Cost Risk = ${nCostRisk}<br />
        N Time Risk = ${nTimeRisk}<br />
        N Scope Risk = ${nScopeRisk}<br />
    <br />
    <h2><label style="text-align: left; color: green"><strong>Customer</strong></label></h2>
        N Vendor = ${nVendor}<br />
        N Accepted Vendor = ${nAcceptedVendor}<br />
        N Stakeholder = ${nStakeholder}<br/>
        N Complain = ${nComplain}<br />
        Total Day = ${totalDay}<br />
	</body>
</html>
