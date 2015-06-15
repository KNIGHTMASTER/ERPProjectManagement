
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-developProjectManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-developProjectManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list developProjectManagementPlan">
				<g:if test="${developProjectManagementPlanInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="developProjectManagementPlan.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${developProjectManagementPlanInstance?.projectName?.id}">${developProjectManagementPlanInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

                <g:if test="${developProjectManagementPlanInstance?.dateCreated}">
                    <li class="fieldcontain">
                        <span id="dateCreated-label" class="property-label"><g:message code="developProjectManagementPlan.dateCreated.label" default="Date Created" /></span>

                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${developProjectManagementPlanInstance?.dateCreated}" /></span>

                    </li>
                </g:if>


				<g:if test="${developProjectManagementPlanInstance?.planningVersion}">
				<li class="fieldcontain">
					<span id="planningVersion-label" class="property-label"><g:message code="developProjectManagementPlan.planningVersion.label" default="Planning Version" /></span>
					
						<span class="property-value" aria-labelledby="planningVersion-label"><g:fieldValue bean="${developProjectManagementPlanInstance}" field="planningVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.changeManagementPlan}">
				<li class="fieldcontain">
					<span id="changeManagementPlan-label" class="property-label"><g:message code="developProjectManagementPlan.changeManagementPlan.label" default="Change Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="changeManagementPlan-label"><g:link controller="changeManagementPlan" action="show" id="${developProjectManagementPlanInstance?.changeManagementPlan?.id}">${developProjectManagementPlanInstance?.changeManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.scopeManagementPlan}">
				<li class="fieldcontain">
					<span id="scopeManagementPlan-label" class="property-label"><g:message code="developProjectManagementPlan.scopeManagementPlan.label" default="Scope Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="scopeManagementPlan-label"><g:link controller="projectScopeStatement" action="show" id="${developProjectManagementPlanInstance?.scopeManagementPlan?.id}">${developProjectManagementPlanInstance?.scopeManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.requirementsDocumentation}">
				<li class="fieldcontain">
					<span id="requirementsDocumentation-label" class="property-label"><g:message code="developProjectManagementPlan.requirementsDocumentation.label" default="Requirements Documentation" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.requirementsDocumentation}" var="r">
						<span class="property-value" aria-labelledby="requirementsDocumentation-label"><g:link controller="requirementsDocumentation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.requirementsManagementPlan}">
				<li class="fieldcontain">
					<span id="requirementsManagementPlan-label" class="property-label"><g:message code="developProjectManagementPlan.requirementsManagementPlan.label" default="Requirements Management Plan" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.requirementsManagementPlan}" var="r">
						<span class="property-value" aria-labelledby="requirementsManagementPlan-label"><g:link controller="requirementsManagementPlan" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.timeManagementPlans}">
				<li class="fieldcontain">
					<span id="timeManagementPlans-label" class="property-label"><g:message code="developProjectManagementPlan.timeManagementPlans.label" default="Time Management Plans" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.timeManagementPlans}" var="t">
						<span class="property-value" aria-labelledby="timeManagementPlans-label"><g:link controller="activity" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.costManagementPlans}">
				<li class="fieldcontain">
					<span id="costManagementPlans-label" class="property-label"><g:message code="developProjectManagementPlan.costManagementPlans.label" default="Cost Management Plans" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.costManagementPlans}" var="c">
						<span class="property-value" aria-labelledby="costManagementPlans-label"><g:link controller="costManagementPlan" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.riskManagementPlans}">
				<li class="fieldcontain">
					<span id="riskManagementPlans-label" class="property-label"><g:message code="developProjectManagementPlan.riskManagementPlans.label" default="Risk Management Plans" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.riskManagementPlans}" var="r">
						<span class="property-value" aria-labelledby="riskManagementPlans-label"><g:link controller="riskCategories" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.communicationManagementPlan}">
				<li class="fieldcontain">
					<span id="communicationManagementPlan-label" class="property-label"><g:message code="developProjectManagementPlan.communicationManagementPlan.label" default="Communication Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="communicationManagementPlan-label"><g:link controller="communicationManagementPlan" action="show" id="${developProjectManagementPlanInstance?.communicationManagementPlan?.id}">${developProjectManagementPlanInstance?.communicationManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.procurementManagementPlans}">
				<li class="fieldcontain">
					<span id="procurementManagementPlans-label" class="property-label"><g:message code="developProjectManagementPlan.procurementManagementPlans.label" default="Procurement Management Plans" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.procurementManagementPlans}" var="p">
						<span class="property-value" aria-labelledby="procurementManagementPlans-label"><g:link controller="requirementProcurement" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${developProjectManagementPlanInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="developProjectManagementPlan.approval.label" default="Approval" /></span>
					
						<g:each in="${developProjectManagementPlanInstance.approval}" var="a">
						<span class="property-value" aria-labelledby="approval-label"><g:link controller="projectManagementPlanAcceptance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${developProjectManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${developProjectManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
