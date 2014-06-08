
<%@ page import="ProjectCostManagement.ControlCost.AnalysisEVM" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisEVM.label', default: 'AnalysisEVM')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-analysisEVM" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-analysisEVM" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list analysisEVM">
			
				<g:if test="${analysisEVMInstance?.idMilestone}">
				<li class="fieldcontain">
					<span id="idMilestone-label" class="property-label"><g:message code="analysisEVM.idMilestone.label" default="Id Milestone" /></span>
					
						<span class="property-value" aria-labelledby="idMilestone-label"><g:link controller="milestones" action="show" id="${analysisEVMInstance?.idMilestone?.id}">${analysisEVMInstance?.idMilestone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisEVMInstance?.plannedValue}">
				<li class="fieldcontain">
					<span id="plannedValue-label" class="property-label"><g:message code="analysisEVM.plannedValue.label" default="Planned Value" /></span>
					
						<span class="property-value" aria-labelledby="plannedValue-label"><g:fieldValue bean="${analysisEVMInstance}" field="plannedValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisEVMInstance?.earnedValue}">
				<li class="fieldcontain">
					<span id="earnedValue-label" class="property-label"><g:message code="analysisEVM.earnedValue.label" default="Earned Value" /></span>
					
						<span class="property-value" aria-labelledby="earnedValue-label"><g:fieldValue bean="${analysisEVMInstance}" field="earnedValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisEVMInstance?.actualCost}">
				<li class="fieldcontain">
					<span id="actualCost-label" class="property-label"><g:message code="analysisEVM.actualCost.label" default="Actual Cost" /></span>
					
						<span class="property-value" aria-labelledby="actualCost-label"><g:fieldValue bean="${analysisEVMInstance}" field="actualCost"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${analysisEVMInstance?.id}" />
					<g:link class="edit" action="edit" id="${analysisEVMInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
