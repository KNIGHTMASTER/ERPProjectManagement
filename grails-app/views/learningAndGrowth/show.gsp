
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.LearningAndGrowth" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-learningAndGrowth" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-learningAndGrowth" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list learningAndGrowth">
			
				<g:if test="${learningAndGrowthInstance?.dayLoss}">
				<li class="fieldcontain">
					<span id="dayLoss-label" class="property-label"><g:message code="learningAndGrowth.dayLoss.label" default="Day Loss" /></span>
					
						<span class="property-value" aria-labelledby="dayLoss-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="dayLoss"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.nActivity}">
				<li class="fieldcontain">
					<span id="nActivity-label" class="property-label"><g:message code="learningAndGrowth.nActivity.label" default="NA ctivity" /></span>
					
						<span class="property-value" aria-labelledby="nActivity-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="nActivity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.nEmployee}">
				<li class="fieldcontain">
					<span id="nEmployee-label" class="property-label"><g:message code="learningAndGrowth.nEmployee.label" default="NE mployee" /></span>
					
						<span class="property-value" aria-labelledby="nEmployee-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="nEmployee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.nTurnOver}">
				<li class="fieldcontain">
					<span id="nTurnOver-label" class="property-label"><g:message code="learningAndGrowth.nTurnOver.label" default="NT urn Over" /></span>
					
						<span class="property-value" aria-labelledby="nTurnOver-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="nTurnOver"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.ncr}">
				<li class="fieldcontain">
					<span id="ncr-label" class="property-label"><g:message code="learningAndGrowth.ncr.label" default="Ncr" /></span>
					
						<span class="property-value" aria-labelledby="ncr-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="ncr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.nr}">
				<li class="fieldcontain">
					<span id="nr-label" class="property-label"><g:message code="learningAndGrowth.nr.label" default="Nr" /></span>
					
						<span class="property-value" aria-labelledby="nr-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="nr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.nsr}">
				<li class="fieldcontain">
					<span id="nsr-label" class="property-label"><g:message code="learningAndGrowth.nsr.label" default="Nsr" /></span>
					
						<span class="property-value" aria-labelledby="nsr-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="nsr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.ntr}">
				<li class="fieldcontain">
					<span id="ntr-label" class="property-label"><g:message code="learningAndGrowth.ntr.label" default="Ntr" /></span>
					
						<span class="property-value" aria-labelledby="ntr-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="ntr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${learningAndGrowthInstance?.totalDay}">
				<li class="fieldcontain">
					<span id="totalDay-label" class="property-label"><g:message code="learningAndGrowth.totalDay.label" default="Total Day" /></span>
					
						<span class="property-value" aria-labelledby="totalDay-label"><g:fieldValue bean="${learningAndGrowthInstance}" field="totalDay"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${learningAndGrowthInstance?.id}" />
					<g:link class="edit" action="edit" id="${learningAndGrowthInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
