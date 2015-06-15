
<%@ page import="ProjectProcurementManagement.ConductProcurements.MaterialCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCriteria.label', default: 'MaterialCriteria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materialCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materialCriteria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materialCriteria">
			
				<g:if test="${materialCriteriaInstance?.materialId}">
				<li class="fieldcontain">
					<span id="materialId-label" class="property-label"><g:message code="materialCriteria.materialId.label" default="Material Id" /></span>
					
						<span class="property-value" aria-labelledby="materialId-label"><g:fieldValue bean="${materialCriteriaInstance}" field="materialId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCriteriaInstance?.materialName}">
				<li class="fieldcontain">
					<span id="materialName-label" class="property-label"><g:message code="materialCriteria.materialName.label" default="Material Name" /></span>
					
						<span class="property-value" aria-labelledby="materialName-label"><g:fieldValue bean="${materialCriteriaInstance}" field="materialName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCriteriaInstance?.unitType}">
				<li class="fieldcontain">
					<span id="unitType-label" class="property-label"><g:message code="materialCriteria.unitType.label" default="Unit Type" /></span>
					
						<span class="property-value" aria-labelledby="unitType-label"><g:fieldValue bean="${materialCriteriaInstance}" field="unitType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCriteriaInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="materialCriteria.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${materialCriteriaInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCriteriaInstance?.available}">
				<li class="fieldcontain">
					<span id="available-label" class="property-label"><g:message code="materialCriteria.available.label" default="Available" /></span>
					
						<span class="property-value" aria-labelledby="available-label"><g:fieldValue bean="${materialCriteriaInstance}" field="available"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCriteriaInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="materialCriteria.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${materialCriteriaInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materialCriteriaInstance?.id}" />
					<g:link class="edit" action="edit" id="${materialCriteriaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
