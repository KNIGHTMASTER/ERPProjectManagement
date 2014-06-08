
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectCharter.label', default: 'ProjectCharter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectCharter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectCharter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectCharter">
			
				<g:if test="${projectCharterInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectCharter.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${projectCharterInstance?.projectName?.id}">${projectCharterInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.payment}">
				<li class="fieldcontain">
					<span id="payment-label" class="property-label"><g:message code="projectCharter.payment.label" default="Payment" /></span>
					
						<g:each in="${projectCharterInstance.payment}" var="p">
						<span class="property-value" aria-labelledby="payment-label"><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.projectPurpose}">
				<li class="fieldcontain">
					<span id="projectPurpose-label" class="property-label"><g:message code="projectCharter.projectPurpose.label" default="Project Purpose" /></span>

                    <span class="property-value" aria-labelledby="projectDescription-label">${projectCharterInstance.projectDescription}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.projectDescription}">
				<li class="fieldcontain">
					<span id="projectDescription-label" class="property-label"><g:message code="projectCharter.projectDescription.label" default="Project Description" /></span>

                    <span class="property-value" aria-labelledby="projectDescription-label">${projectCharterInstance.projectDescription}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.projectScope}">
				<li class="fieldcontain">
					<span id="projectScope-label" class="property-label"><g:message code="projectCharter.projectScope.label" default="Project Scope" /></span>

                    <span class="property-value" aria-labelledby="projectScope-label">${projectCharterInstance.projectScope}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.acceptanceCriteria}">
				<li class="fieldcontain">
					<span id="acceptanceCriteria-label" class="property-label"><g:message code="projectCharter.acceptanceCriteria.label" default="Acceptance Criteria" /></span>

                    <span class="property-value" aria-labelledby="acceptanceCriteria-label">${projectCharterInstance.acceptanceCriteria}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.initialRisk}">
				<li class="fieldcontain">
					<span id="initialRisk-label" class="property-label"><g:message code="projectCharter.initialRisk.label" default="Initial Risk" /></span>

                    <span class="property-value" aria-labelledby="initialRisk-label">${projectCharterInstance.initialRisk}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.estimatedBudget}">
				<li class="fieldcontain">
					<span id="estimatedBudget-label" class="property-label"><g:message code="projectCharter.estimatedBudget.label" default="Estimated Budget" /></span>
					
						<span class="property-value" aria-labelledby="estimatedBudget-label"><g:fieldValue bean="${projectCharterInstance}" field="estimatedBudget"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.projectManagerAuthority}">
				<li class="fieldcontain">
					<span id="projectManagerAuthority-label" class="property-label"><g:message code="projectCharter.projectManagerAuthority.label" default="Project Manager Authority" /></span>

                    <span class="property-value" aria-labelledby="projectManagerAuthority-label">${projectCharterInstance.projectManagerAuthority}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.milestones}">
				<li class="fieldcontain">
					<span id="milestones-label" class="property-label"><g:message code="projectCharter.milestones.label" default="Milestones" /></span>
					
						<g:each in="${projectCharterInstance.milestones}" var="m">
						<span class="property-value" aria-labelledby="milestones-label"><g:link controller="milestones" action="show" id="${m.id}">${m.milestoneName?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterInstance?.projectCharterApprovals}">
				<li class="fieldcontain">
					<span id="projectCharterApprovals-label" class="property-label"><g:message code="projectCharter.projectCharterApprovals.label" default="Project Charter Approvals" /></span>
					
						<g:each in="${projectCharterInstance.projectCharterApprovals}" var="p">
						<span class="property-value" aria-labelledby="projectCharterApprovals-label"><g:link controller="projectCharterApproval" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

                <g:if test="${projectCharterInstance?.dateCreated}">
                    <li class="fieldcontain">
                        <span id="dateCreated-label" class="property-label"><g:message code="projectCharter.dateCreated.label" default="Date Created" /></span>

                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectCharterInstance?.dateCreated}" /></span>

                    </li>
                </g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectCharterInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectCharterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
