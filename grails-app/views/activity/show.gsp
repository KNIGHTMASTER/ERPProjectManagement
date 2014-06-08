
<%@ page import="ProjectTimeManagement.DefineActivity.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list">
			
				<g:if test="${activityInstance?.idMilestone}">
				<li class="fieldcontain">
					<span id="idMilestone-label" class="property-label"><g:message code="activity.idMilestone.label" default="Id Milestone" /></span>
					
						<span class="property-value" aria-labelledby="idMilestone-label"><g:link controller="milestones" action="show" id="${activityInstance?.idMilestone?.id}">${activityInstance?.idMilestone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.idTask}">
				<li class="fieldcontain">
					<span id="idTask-label" class="property-label"><g:message code="activity.idTask.label" default="Id Task" /></span>
					
						<span class="property-value" aria-labelledby="idTask-label"><g:fieldValue bean="${activityInstance}" field="idTask"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.taskName}">
				<li class="fieldcontain">
					<span id="taskName-label" class="property-label"><g:message code="activity.taskName.label" default="Task Name" /></span>
					
						<span class="property-value" aria-labelledby="taskName-label"><g:link controller="task" action="show" id="${activityInstance?.taskName?.id}">${activityInstance?.taskName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="activity.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${activityInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.resources}">
				<li class="fieldcontain">
					<span id="resources-label" class="property-label"><g:message code="activity.resources.label" default="Resources" /></span>
					
						<g:each in="${activityInstance.resources}" var="r">
						<span class="property-value" aria-labelledby="resources-label"><g:link controller="teamDevelopment" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.predecessors}">
				<li class="fieldcontain">
					<span id="predecessors-label" class="property-label"><g:message code="activity.predecessors.label" default="Predecessors" /></span>
					
						<g:each in="${activityInstance.predecessors}" var="p">
						<span class="property-value" aria-labelledby="predecessors-label"><g:link controller="activity" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.successors}">
				<li class="fieldcontain">
					<span id="successors-label" class="property-label"><g:message code="activity.successors.label" default="Successors" /></span>
					
						<g:each in="${activityInstance.successors}" var="s">
						<span class="property-value" aria-labelledby="successors-label"><g:link controller="activity" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="activity.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${activityInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="activity.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${activityInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.est}">
				<li class="fieldcontain">
					<span id="est-label" class="property-label"><g:message code="activity.est.label" default="Est" /></span>
					
						<span class="property-value" aria-labelledby="est-label"><g:fieldValue bean="${activityInstance}" field="est"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.eet}">
				<li class="fieldcontain">
					<span id="eet-label" class="property-label"><g:message code="activity.eet.label" default="Eet" /></span>
					
						<span class="property-value" aria-labelledby="eet-label"><g:fieldValue bean="${activityInstance}" field="eet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.lst}">
				<li class="fieldcontain">
					<span id="lst-label" class="property-label"><g:message code="activity.lst.label" default="Lst" /></span>
					
						<span class="property-value" aria-labelledby="lst-label"><g:fieldValue bean="${activityInstance}" field="lst"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.let}">
				<li class="fieldcontain">
					<span id="let-label" class="property-label"><g:message code="activity.let.label" default="Let" /></span>
					
						<span class="property-value" aria-labelledby="let-label"><g:fieldValue bean="${activityInstance}" field="let"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.materials}">
				<li class="fieldcontain">
					<span id="materials-label" class="property-label"><g:message code="activity.materials.label" default="Materials" /></span>
					
						<g:each in="${activityInstance.materials}" var="m">
						<span class="property-value" aria-labelledby="materials-label"><g:link controller="requirementProcurement" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.timeApproval}">
				<li class="fieldcontain">
					<span id="timeApproval-label" class="property-label"><g:message code="activity.timeApproval.label" default="Time Approval" /></span>
					
						<g:each in="${activityInstance.timeApproval}" var="t">
						<span class="property-value" aria-labelledby="timeApproval-label"><g:link controller="timeApproval" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.trackings}">
				<li class="fieldcontain">
					<span id="trackings-label" class="property-label"><g:message code="activity.trackings.label" default="Trackings" /></span>
					
						<g:each in="${activityInstance.trackings}" var="t">
						<span class="property-value" aria-labelledby="trackings-label"><g:link controller="activityTracking" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
