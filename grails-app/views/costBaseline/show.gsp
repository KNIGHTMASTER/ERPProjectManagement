
<%@ page import="ProjectCostManagement.DetermineBudget.CostBaseline" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costBaseline.label', default: 'CostBaseline')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-costBaseline" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-costBaseline" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list costBaseline">
			
				<g:if test="${costBaselineInstance?.balance}">
				<li class="fieldcontain">
					<span id="balance-label" class="property-label"><g:message code="costBaseline.balance.label" default="Balance" /></span>
					
						<span class="property-value" aria-labelledby="balance-label"><g:link controller="monthBudget" action="show" id="${costBaselineInstance?.balance?.id}">${costBaselineInstance?.balance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBaselineInstance?.baseline}">
				<li class="fieldcontain">
					<span id="baseline-label" class="property-label"><g:message code="costBaseline.baseline.label" default="Baseline" /></span>
					
						<span class="property-value" aria-labelledby="baseline-label"><g:fieldValue bean="${costBaselineInstance}" field="baseline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBaselineInstance?.developProjectManagementPlan}">
				<li class="fieldcontain">
					<span id="developProjectManagementPlan-label" class="property-label"><g:message code="costBaseline.developProjectManagementPlan.label" default="Develop Project Management Plan" /></span>
					
						<g:each in="${costBaselineInstance.developProjectManagementPlan}" var="d">
						<span class="property-value" aria-labelledby="developProjectManagementPlan-label"><g:link controller="developProjectManagementPlan" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${costBaselineInstance?.deviation}">
				<li class="fieldcontain">
					<span id="deviation-label" class="property-label"><g:message code="costBaseline.deviation.label" default="Deviation" /></span>
					
						<span class="property-value" aria-labelledby="deviation-label"><g:fieldValue bean="${costBaselineInstance}" field="deviation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBaselineInstance?.fundingProject}">
				<li class="fieldcontain">
					<span id="fundingProject-label" class="property-label"><g:message code="costBaseline.fundingProject.label" default="Funding Project" /></span>
					
						<span class="property-value" aria-labelledby="fundingProject-label"><g:link controller="fundingProject" action="show" id="${costBaselineInstance?.fundingProject?.id}">${costBaselineInstance?.fundingProject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${costBaselineInstance?.id}" />
					<g:link class="edit" action="edit" id="${costBaselineInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
