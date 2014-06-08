
<%@ page import="ProjectRiskManagement.Planning.SubCategories" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subCategories.label', default: 'SubCategories')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subCategories" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subCategories" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subCategories">
			
				<g:if test="${subCategoriesInstance?.subCategories}">
				<li class="fieldcontain">
					<span id="subCategories-label" class="property-label"><g:message code="subCategories.subCategories.label" default="Sub Categories" /></span>
					
						<span class="property-value" aria-labelledby="subCategories-label"><g:fieldValue bean="${subCategoriesInstance}" field="subCategories"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subCategoriesInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="subCategories.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${subCategoriesInstance?.riskCategories?.id}">${subCategoriesInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subCategoriesInstance?.ranking}">
				<li class="fieldcontain">
					<span id="ranking-label" class="property-label"><g:message code="subCategories.ranking.label" default="Ranking" /></span>
					
						<span class="property-value" aria-labelledby="ranking-label"><g:fieldValue bean="${subCategoriesInstance}" field="ranking"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subCategoriesInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="subCategories.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${subCategoriesInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subCategoriesInstance?.id}" />
					<g:link class="edit" action="edit" id="${subCategoriesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
