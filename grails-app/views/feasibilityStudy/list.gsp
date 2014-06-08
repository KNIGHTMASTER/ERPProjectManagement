
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.FeasibilityStudy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-feasibilityStudy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-feasibilityStudy" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="feasibilityStudy.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="executiveSummary" title="${message(code: 'feasibilityStudy.executiveSummary.label', default: 'Executive Summary')}" />
					
						<g:sortableColumn property="descriptionOfProducts" title="${message(code: 'feasibilityStudy.descriptionOfProducts.label', default: 'Description Of Products')}" />
					
						<g:sortableColumn property="technologyConsiderations" title="${message(code: 'feasibilityStudy.technologyConsiderations.label', default: 'Technology Considerations')}" />
					
						<g:sortableColumn property="productMarketPlace" title="${message(code: 'feasibilityStudy.productMarketPlace.label', default: 'Product Market Place')}" />
					
						<g:sortableColumn property="marketingStrategy" title="${message(code: 'feasibilityStudy.marketingStrategy.label', default: 'Marketing Strategy')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${feasibilityStudyInstanceList}" status="i" var="feasibilityStudyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${feasibilityStudyInstance.id}">${fieldValue(bean: feasibilityStudyInstance, field: "projectName")}</g:link></td>
					
						<td>${feasibilityStudyInstance.executiveSummary}</td>
					
						<td>${feasibilityStudyInstance.descriptionOfProducts}</td>
					
						<td>${feasibilityStudyInstance.technologyConsiderations}</td>
					
						<td>${feasibilityStudyInstance.productMarketPlace}</td>
					
						<td>${feasibilityStudyInstance.marketingStrategy}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${feasibilityStudyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
