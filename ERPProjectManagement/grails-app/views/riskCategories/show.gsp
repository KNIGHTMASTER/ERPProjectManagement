
<%@ page import="ProjectRiskManagement.Planning.RiskCategories" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'riskCategories.label', default: 'RiskCategories')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-riskCategories" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/projectCharter/list"><g:message code="Project Charter List"/></a></li>
                                <li><a href="/ERPProjectManagement/subCategories/list"><g:message code="Sub Categories List"/></a></li>
			</ul>
		</div>
		<div id="show-riskCategories" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list riskCategories">
			
				<g:if test="${riskCategoriesInstance?.projectCharter}">
				<li class="fieldcontain">
					<span id="projectCharter-label" class="property-label"><g:message code="riskCategories.projectCharter.label" default="Project Charter" /></span>
					
						<span class="property-value" aria-labelledby="projectCharter-label"><g:link controller="projectCharter" action="show" id="${riskCategoriesInstance?.projectCharter?.id}">${riskCategoriesInstance?.projectCharter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${riskCategoriesInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="riskCategories.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:fieldValue bean="${riskCategoriesInstance}" field="riskCategories"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${riskCategoriesInstance?.ranking}">
				<li class="fieldcontain">
					<span id="ranking-label" class="property-label"><g:message code="riskCategories.ranking.label" default="Ranking" /></span>
					
						<span class="property-value" aria-labelledby="ranking-label"><g:fieldValue bean="${riskCategoriesInstance}" field="ranking"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${riskCategoriesInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="riskCategories.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${riskCategoriesInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${riskCategoriesInstance?.id}" />
					<g:link class="edit" action="edit" id="${riskCategoriesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
