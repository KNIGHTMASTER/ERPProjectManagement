
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessCase.label', default: 'BusinessCase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-businessCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-businessCase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list businessCase">
			
				<g:if test="${businessCaseInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="businessCase.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${businessCaseInstance?.projectName?.id}">${businessCaseInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessCaseInstance?.businessCaseAnalysisTeams}">
				<li class="fieldcontain">
					<span id="businessCaseAnalysisTeams-label" class="property-label"><g:message code="businessCase.businessCaseAnalysisTeams.label" default="Business Case Analysis Teams" /></span>
					
						<g:each in="${businessCaseInstance.businessCaseAnalysisTeams}" var="b">
						<span class="property-value" aria-labelledby="businessCaseAnalysisTeams-label"><g:link controller="businessCaseAnalysisTeam" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${businessCaseInstance?.problemDefinitions}">
				<li class="fieldcontain">
					<span id="problemDefinitions-label" class="property-label"><g:message code="businessCase.problemDefinitions.label" default="Problem Definitions" /></span>
					
						<g:each in="${businessCaseInstance.problemDefinitions}" var="p">
						<span class="property-value" aria-labelledby="problemDefinitions-label"><g:link controller="problemDefinition" action="show" id="${p.id}">${p.problemStatement}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${businessCaseInstance?.projectOverviews}">
				<li class="fieldcontain">
					<span id="projectOverviews-label" class="property-label"><g:message code="businessCase.projectOverviews.label" default="Project Overviews" /></span>
					
						<g:each in="${businessCaseInstance.projectOverviews}" var="p">
						<span class="property-value" aria-labelledby="projectOverviews-label"><g:link controller="projectOverview" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

				<g:if test="${businessCaseInstance?.costBenefitAnalysis}">
                <g:hiddenField name="nfys" value="${nfys=0}"/>
				<li class="fieldcontain">
					<span id="costBenefitAnalysis-label" class="property-label"><g:message code="businessCase.costBenefitAnalysis.label" default="Cost Benefit Analysis" /></span>

                    <g:each in="${businessCaseInstance.costBenefitAnalysis}" var="c">
						<span class="property-value" aria-labelledby="costBenefitAnalysis-label"><g:link controller="costBenefitAnalysis" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                        <g:hiddenField name="nfys" value="${nfys+=c.firstYearCost}"/>
					</g:each>
                    <span id="costBenefitAnalysis-label" class="property-label"><g:message code="Net First Year Savings "  /></span>
                    <span class="property-value" ><label style="text-align: center; color: green"><strong>IDR ${nfys} </strong></label></span>
				</li>

				</g:if>
			
				<g:if test="${businessCaseInstance?.businessCaseApprovals}">
				<li class="fieldcontain">
					<span id="businessCaseApprovals-label" class="property-label"><g:message code="businessCase.businessCaseApprovals.label" default="Business Case Approvals" /></span>
					
						<g:each in="${businessCaseInstance.businessCaseApprovals}" var="b">
						<span class="property-value" aria-labelledby="businessCaseApprovals-label"><g:link controller="businessCaseApproval" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${businessCaseInstance?.id}" />
					<g:link class="edit" action="edit" id="${businessCaseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
