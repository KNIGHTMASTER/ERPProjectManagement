
<%@ page import="ProjectCostManagement.DetermineBudget.Budget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budget.label', default: 'Budget')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-budget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-budget" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list budget">
			
				<g:if test="${budgetInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="budget.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="projectCharter" action="show" id="${budgetInstance?.project?.id}">${budgetInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="budget.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${budgetInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.monthBudget}">
				<li class="fieldcontain">
					<span id="monthBudget-label" class="property-label"><g:message code="budget.monthBudget.label" default="Month Budget" /></span>
					
						<g:each in="${budgetInstance.monthBudget}" var="m">
						<span class="property-value" aria-labelledby="monthBudget-label"><g:link controller="monthBudget" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${budgetInstance?.id}" />
					<g:link class="edit" action="edit" id="${budgetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
