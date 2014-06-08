
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statementOfWork.label', default: 'StatementOfWork')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-statementOfWork" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../../PlaceOfPerformance/"><g:message code="Place Of Performance"/></a></li>
                                <li><a class="list" href="../../PeriodOfPerformance/"><g:message code="Period Of Performance"/></a></li>
                                <li><a class="list" href="../../WorkRequirements/"><g:message code="Work Requirements"/></a></li>
                                <li><a class="list" href="../../AcceptanceCriteria/"><g:message code="Acceptance Criteria"/></a></li>
                                <li><a class="list" href="../../statementOfWorkApproval/"><g:message code="Statement Of Work Approvals"/></a></li>
                                <li><a class="list" href="../../Milestones/"><g:message code="Milestones"/></a></li>                        
                                <li><a class="list" href="../../../ERPProjectManagement/task/"><g:message code="Tasks"/></a></li>                
			</ul>
		</div>
		<div id="show-statementOfWork" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list statementOfWork">
			
				<g:if test="${statementOfWorkInstance?.idProject}">
				<li class="fieldcontain">
					<span id="idProject-label" class="property-label"><g:message code="statementOfWork.idProject.label" default="Id Project" /></span>
					
						<span class="property-value" aria-labelledby="idProject-label"><g:fieldValue bean="${statementOfWorkInstance}" field="idProject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="statementOfWork.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${statementOfWorkInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="statementOfWork.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${statementOfWorkInstance}" field="projectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.introduction}">
				<li class="fieldcontain">
					<span id="introduction-label" class="property-label"><g:message code="statementOfWork.introduction.label" default="Introduction" /></span>
					
						<span class="property-value" aria-labelledby="introduction-label">${statementOfWorkInstance.introduction}</span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.scopeOfWork}">
				<li class="fieldcontain">
					<span id="scopeOfWork-label" class="property-label"><g:message code="statementOfWork.scopeOfWork.label" default="Scope Of Work" /></span>
					
						<span class="property-value" aria-labelledby="scopeOfWork-label">${statementOfWorkInstance?.scopeOfWork}</span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.otherRequirements}">
				<li class="fieldcontain">
					<span id="otherRequirements-label" class="property-label"><g:message code="statementOfWork.otherRequirements.label" default="Other Requirements" /></span>
					
						<span class="property-value" aria-labelledby="otherRequirements-label">${statementOfWorkInstance?.otherRequirements}</span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.placeOfPerformance}">
				<li class="fieldcontain">
					<span id="placeOfPerformance-label" class="property-label"><g:message code="statementOfWork.placeOfPerformance.label" default="Place Of Performance" /></span>
					
						<g:each in="${statementOfWorkInstance.placeOfPerformance}" var="p">
						<span class="property-value" aria-labelledby="placeOfPerformance-label"><g:link controller="placeOfPerformance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.periodOfPerformance}">
				<li class="fieldcontain">
					<span id="periodOfPerformance-label" class="property-label"><g:message code="statementOfWork.periodOfPerformance.label" default="Period Of Performance" /></span>
					
						<g:each in="${statementOfWorkInstance.periodOfPerformance}" var="p">
						<span class="property-value" aria-labelledby="periodOfPerformance-label"><g:link controller="periodOfPerformance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.workRequirements}">
				<li class="fieldcontain">
					<span id="workRequirements-label" class="property-label"><g:message code="statementOfWork.workRequirements.label" default="Work Requirements" /></span>
					
						<g:each in="${statementOfWorkInstance.workRequirements}" var="w">
						<span class="property-value" aria-labelledby="workRequirements-label"><g:link controller="workRequirements" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.acceptanceCriteria}">
				<li class="fieldcontain">
					<span id="acceptanceCriteria-label" class="property-label"><g:message code="statementOfWork.acceptanceCriteria.label" default="Acceptance Criteria" /></span>
					
						<g:each in="${statementOfWorkInstance.acceptanceCriteria}" var="a">
						<span class="property-value" aria-labelledby="acceptanceCriteria-label"><g:link controller="acceptanceCriteria" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.statementOfWorkApprovals}">
				<li class="fieldcontain">
					<span id="statementOfWorkApprovals-label" class="property-label"><g:message code="statementOfWork.statementOfWorkApprovals.label" default="Statement Of Work Approvals" /></span>
					
						<g:each in="${statementOfWorkInstance.statementOfWorkApprovals}" var="s">
						<span class="property-value" aria-labelledby="statementOfWorkApprovals-label"><g:link controller="statementOfWorkApproval" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.milestones}">
				<li class="fieldcontain">
					<span id="milestones-label" class="property-label"><g:message code="statementOfWork.milestones.label" default="Milestones" /></span>
					
						<g:each in="${statementOfWorkInstance.milestones}" var="m">
						<span class="property-value" aria-labelledby="milestones-label"><g:link controller="milestones" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkInstance?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="statementOfWork.tasks.label" default="Tasks" /></span>
					
						<g:each in="${statementOfWorkInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${statementOfWorkInstance?.id}" />
					<g:link class="edit" action="edit" id="${statementOfWorkInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
