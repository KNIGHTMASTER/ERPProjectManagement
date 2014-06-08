
<%@ page import="ProjectRiskManagement.Planning.AnalysisProjectScopeStatement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-analysisProjectScopeStatement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-analysisProjectScopeStatement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list analysisProjectScopeStatement">
			
				<g:if test="${analysisProjectScopeStatementInstance?.identificationProjectScopeStatement}">
				<li class="fieldcontain">
					<span id="identificationProjectScopeStatement-label" class="property-label"><g:message code="analysisProjectScopeStatement.identificationProjectScopeStatement.label" default="Identification Project Scope Statement" /></span>
					
						<span class="property-value" aria-labelledby="identificationProjectScopeStatement-label"><g:link controller="identificationProjectScopeStatement" action="show" id="${analysisProjectScopeStatementInstance?.identificationProjectScopeStatement?.id}">${analysisProjectScopeStatementInstance?.identificationProjectScopeStatement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisProjectScopeStatementInstance?.ranking}">
				<li class="fieldcontain">
					<span id="ranking-label" class="property-label"><g:message code="analysisProjectScopeStatement.ranking.label" default="Ranking" /></span>
					
						<span class="property-value" aria-labelledby="ranking-label"><g:fieldValue bean="${analysisProjectScopeStatementInstance}" field="ranking"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisProjectScopeStatementInstance?.subCategories}">
				<li class="fieldcontain">
					<span id="subCategories-label" class="property-label"><g:message code="analysisProjectScopeStatement.subCategories.label" default="Sub Categories" /></span>
					
						<span class="property-value" aria-labelledby="subCategories-label"><g:link controller="subCategories" action="show" id="${analysisProjectScopeStatementInstance?.subCategories?.id}">${analysisProjectScopeStatementInstance?.subCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisProjectScopeStatementInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="analysisProjectScopeStatement.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${analysisProjectScopeStatementInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisProjectScopeStatementInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="analysisProjectScopeStatement.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${analysisProjectScopeStatementInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${analysisProjectScopeStatementInstance?.id}" />
					<g:link class="edit" action="edit" id="${analysisProjectScopeStatementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
