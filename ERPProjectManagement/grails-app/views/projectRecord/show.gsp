
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectRecord.label', default: 'ProjectRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectRecord">
			
				<g:if test="${projectRecordInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectRecord.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${projectRecordInstance?.projectName?.id}">${projectRecordInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.projectSummary}">
				<li class="fieldcontain">
					<span id="projectSummary-label" class="property-label"><g:message code="projectRecord.projectSummary.label" default="Project Summary" /></span>
					
						<span class="property-value" aria-labelledby="projectSummary-label">${projectRecordInstance.projectSummary}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.projectTeam}">
				<li class="fieldcontain">
					<span id="projectTeam-label" class="property-label"><g:message code="projectRecord.projectTeam.label" default="Project Team" /></span>
					
						<g:each in="${projectRecordInstance.projectTeam}" var="p">
						<span class="property-value" aria-labelledby="projectTeam-label"><g:link controller="manageTeamMemberAssignedToProject" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.transitionToOperation}">
				<li class="fieldcontain">
					<span id="transitionToOperation-label" class="property-label"><g:message code="projectRecord.transitionToOperation.label" default="Transition To Operation" /></span>
					
						<span class="property-value" aria-labelledby="transitionToOperation-label">${projectRecordInstance.transitionToOperation}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.goalsAndObjectives}">
				<li class="fieldcontain">
					<span id="goalsAndObjectives-label" class="property-label"><g:message code="projectRecord.goalsAndObjectives.label" default="Goals And Objectives" /></span>
					
						<g:each in="${projectRecordInstance.goalsAndObjectives}" var="g">
						<span class="property-value" aria-labelledby="goalsAndObjectives-label"><g:link controller="goalsAndObjectives" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.projectDeliverables}">
				<li class="fieldcontain">
					<span id="projectDeliverables-label" class="property-label"><g:message code="projectRecord.projectDeliverables.label" default="Project Deliverables" /></span>
					
						<g:each in="${projectRecordInstance.projectDeliverables}" var="p">
						<span class="property-value" aria-labelledby="projectDeliverables-label"><g:link controller="inspection" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.projectSchedule}">
				<li class="fieldcontain">
					<span id="projectSchedule-label" class="property-label"><g:message code="projectRecord.projectSchedule.label" default="Project Schedule" /></span>
					
						<g:each in="${projectRecordInstance.projectSchedule}" var="p">
						<span class="property-value" aria-labelledby="projectSchedule-label"><g:link controller="milestones" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.projectBudget}">
				<li class="fieldcontain">
					<span id="projectBudget-label" class="property-label"><g:message code="projectRecord.projectBudget.label" default="Project Budget" /></span>
					
						<span class="property-value" aria-labelledby="projectBudget-label"><g:link controller="budget" action="show" id="${projectRecordInstance?.projectBudget?.id}">${projectRecordInstance?.projectBudget?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.monthBudgets}">
				<li class="fieldcontain">
					<span id="monthBudgets-label" class="property-label"><g:message code="projectRecord.monthBudgets.label" default="Month Budgets" /></span>
					
						<g:each in="${projectRecordInstance.monthBudgets}" var="m">
						<span class="property-value" aria-labelledby="monthBudgets-label"><g:link controller="monthBudget" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.activityCosts}">
				<li class="fieldcontain">
					<span id="activityCosts-label" class="property-label"><g:message code="projectRecord.activityCosts.label" default="Activity Costs" /></span>
					
						<g:each in="${projectRecordInstance.activityCosts}" var="a">
						<span class="property-value" aria-labelledby="activityCosts-label"><g:link controller="activityCost" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.materialActivityCosts}">
				<li class="fieldcontain">
					<span id="materialActivityCosts-label" class="property-label"><g:message code="projectRecord.materialActivityCosts.label" default="Material Activity Costs" /></span>
					
						<g:each in="${projectRecordInstance.materialActivityCosts}" var="m">
						<span class="property-value" aria-labelledby="materialActivityCosts-label"><g:link controller="materialCostActivity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.managementCostActivity}">
				<li class="fieldcontain">
					<span id="managementCostActivity-label" class="property-label"><g:message code="projectRecord.managementCostActivity.label" default="Management Cost Activity" /></span>
					
						<g:each in="${projectRecordInstance.managementCostActivity}" var="m">
						<span class="property-value" aria-labelledby="managementCostActivity-label"><g:link controller="managementCostActivity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.qualityManagement}">
				<li class="fieldcontain">
					<span id="qualityManagement-label" class="property-label"><g:message code="projectRecord.qualityManagement.label" default="Quality Management" /></span>
					
						<span class="property-value" aria-labelledby="qualityManagement-label">"${projectRecordInstance.qualityManagement}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.communicationManagement}">
				<li class="fieldcontain">
					<span id="communicationManagement-label" class="property-label"><g:message code="projectRecord.communicationManagement.label" default="Communication Management" /></span>
					
						<span class="property-value" aria-labelledby="communicationManagement-label">${projectRecordInstance.communicationManagement}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.lessonLearned}">
				<li class="fieldcontain">
					<span id="lessonLearned-label" class="property-label"><g:message code="projectRecord.lessonLearned.label" default="Lesson Learned" /></span>
					
						<span class="property-value" aria-labelledby="lessonLearned-label">${projectRecordInstance.lessonLearned}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.recommendations}">
				<li class="fieldcontain">
					<span id="recommendations-label" class="property-label"><g:message code="projectRecord.recommendations.label" default="Recommendations" /></span>
					
						<span class="property-value" aria-labelledby="recommendations-label">${projectRecordInstance.recommendations}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.approvals}">
				<li class="fieldcontain">
					<span id="approvals-label" class="property-label"><g:message code="projectRecord.approvals.label" default="Approvals" /></span>
					
						<g:each in="${projectRecordInstance.approvals}" var="a">
						<span class="property-value" aria-labelledby="approvals-label"><g:link controller="recordAcceptance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectRecordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="projectRecord.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectRecordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectRecordInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectRecordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
