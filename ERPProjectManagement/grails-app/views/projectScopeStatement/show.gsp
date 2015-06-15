
<%@ page import="ProjectScopeManagement.DefineScope.ProjectScopeStatement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectScopeStatement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/identificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>                                                                                                   
			</ul>
		</div>
		<div id="show-projectScopeStatement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectScopeStatement">
			
				<g:if test="${projectScopeStatementInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectScopeStatement.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${projectScopeStatementInstance?.projectName?.id}">${projectScopeStatementInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.productScopeDescription}">
				<li class="fieldcontain">
					<span id="productScopeDescription-label" class="property-label"><g:message code="projectScopeStatement.productScopeDescription.label" default="Product Scope Description" /></span>
					
						<span class="property-value" aria-labelledby="productScopeDescription-label">${projectScopeStatementInstance.productScopeDescription}
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.projectAcceptanceCriteria}">
				<li class="fieldcontain">
					<span id="projectAcceptanceCriteria-label" class="property-label"><g:message code="projectScopeStatement.projectAcceptanceCriteria.label" default="Project Acceptance Criteria" /></span>
					
						<span class="property-value" aria-labelledby="projectAcceptanceCriteria-label">${projectScopeStatementInstance.projectAcceptanceCriteria}
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.projectExclusions}">
				<li class="fieldcontain">
					<span id="projectExclusions-label" class="property-label"><g:message code="projectScopeStatement.projectExclusions.label" default="Project Exclusions" /></span>
					
						<span class="property-value" aria-labelledby="projectExclusions-label">${projectScopeStatementInstance.projectExclusions}
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.projectConstraints}">
				<li class="fieldcontain">
					<span id="projectConstraints-label" class="property-label"><g:message code="projectScopeStatement.projectConstraints.label" default="Project Constraints" /></span>
					
						<span class="property-value" aria-labelledby="projectConstraints-label">${projectScopeStatementInstance.projectConstraints}
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.projectAssumptions}">
				<li class="fieldcontain">
					<span id="projectAssumptions-label" class="property-label"><g:message code="projectScopeStatement.projectAssumptions.label" default="Project Assumptions" /></span>
					
						<span class="property-value" aria-labelledby="projectAssumptions-label">${projectScopeStatementInstance.projectAssumptions}
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.projectDeliverables}">
				<li class="fieldcontain">
					<span id="projectDeliverables-label" class="property-label"><g:message code="projectScopeStatement.projectDeliverables.label" default="Project Deliverables" /></span>
					
						<g:each in="${projectScopeStatementInstance.projectDeliverables}" var="p">
						<span class="property-value" aria-labelledby="projectDeliverables-label"><g:link controller="projectDeliverable" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectScopeStatementInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="projectScopeStatement.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectScopeStatementInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectScopeStatementInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectScopeStatementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
