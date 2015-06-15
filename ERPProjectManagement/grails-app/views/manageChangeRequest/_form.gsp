<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ManageChangeRequest" %>



<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="manageChangeRequest.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${manageChangeRequestInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'peopleWhoApprove', 'error')} ">
	<label for="peopleWhoApprove">
		<g:message code="manageChangeRequest.peopleWhoApprove.label" default="People Who Approve" />
		
	</label>
	<g:select name="peopleWhoApprove" from="${ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard.list()}" multiple="multiple" optionKey="id" size="5" value="${manageChangeRequestInstance?.peopleWhoApprove*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'changeRequests', 'error')} ">
	<label for="changeRequests">
		<g:message code="manageChangeRequest.changeRequests.label" default="Change Requests" />
		
	</label>
	<g:select name="changeRequests" from="${ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeRequest.list()}" multiple="multiple" optionKey="id" size="5" value="${manageChangeRequestInstance?.changeRequests*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'varianceAnalysis', 'error')} ">
	<label for="varianceAnalysis">
		<g:message code="manageChangeRequest.varianceAnalysis.label" default="Variance Analysis" />
		
	</label>
	<g:select name="varianceAnalysis" from="${ProjectScopeManagement.ControlScope.VarianceAnalysis.list()}" multiple="multiple" optionKey="id" size="5" value="${manageChangeRequestInstance?.varianceAnalysis*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'dateRequested', 'error')} required">
	<label for="dateRequested">
		<g:message code="manageChangeRequest.dateRequested.label" default="Date Requested" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateRequested" precision="day"  value="${manageChangeRequestInstance?.dateRequested}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'dateApproved', 'error')} required">
	<label for="dateApproved">
		<g:message code="manageChangeRequest.dateApproved.label" default="Date Approved" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateApproved" precision="day"  value="${manageChangeRequestInstance?.dateApproved}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="manageChangeRequest.approval.label" default="Approval" />
		
	</label>
	<g:checkBox name="approval" value="${manageChangeRequestInstance?.approval}" />
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="manageChangeRequest.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="2000" value="${manageChangeRequestInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageChangeRequestInstance, field: 'recommendedAction', 'error')} ">
	<label for="recommendedAction">
		<g:message code="manageChangeRequest.recommendedAction.label" default="Recommended Action" />
		
	</label>
	<g:textArea name="recommendedAction" cols="40" rows="5" maxlength="2000" value="${manageChangeRequestInstance?.recommendedAction}"/>
</div>

