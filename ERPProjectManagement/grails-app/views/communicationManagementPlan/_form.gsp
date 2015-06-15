<%@ page import="ProjectCommunicationManagement.PlanCommunications.CommunicationManagementPlan" %>
<head>
    <ckeditor:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="communicationManagementPlan.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${communicationManagementPlanInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'introduction', 'error')} ">
	<label for="introduction">
		<g:message code="communicationManagementPlan.introduction.label" default="Introduction" />
		
	</label>
	<%--<g:textArea name="introduction" cols="40" rows="5" maxlength="2000" value="${communicationManagementPlanInstance?.introduction}"/>--%>
    <br>
    <br>
    <ckeditor:editor name="introduction" height="200px" width="100%" toolbar="Full">
        ${communicationManagementPlanInstance?.introduction}
    </ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'communicationManagementApproach', 'error')} ">
	<label for="communicationManagementApproach">
		<g:message code="communicationManagementPlan.communicationManagementApproach.label" default="Communication Management Approach" />
		
	</label>
	<%--<g:textArea name="communicationManagementApproach" cols="40" rows="5" maxlength="2000" value="${communicationManagementPlanInstance?.communicationManagementApproach}"/>--%>
    <br>
    <br>
    <br>
    <br>
<ckeditor:editor name="communicationManagementApproach" height="200px" width="100%" toolbar="Full">
    ${communicationManagementPlanInstance?.communicationManagementApproach}
</ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'communicationManagementConstraints', 'error')} ">
	<label for="communicationManagementConstraints">
		<g:message code="communicationManagementPlan.communicationManagementConstraints.label" default="Communication Management Constraints" />
		
	</label>
	<%--<g:textArea name="communicationManagementConstraints" cols="40" rows="5" maxlength="2000" value="${communicationManagementPlanInstance?.communicationManagementConstraints}"/>--%>
    <br>
    <br>
    <br>
    <br>
<ckeditor:editor name="communicationManagementConstraints" height="200px" width="100%" toolbar="Full">
    ${communicationManagementPlanInstance?.communicationManagementConstraints}
</ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'stakeholderCommunicationRequirements', 'error')} ">
	<label for="stakeholderCommunicationRequirements">
		<g:message code="communicationManagementPlan.stakeholderCommunicationRequirements.label" default="Stakeholder Communication Requirements" />
		
	</label>
	<%--<g:textArea name="stakeholderCommunicationRequirements" cols="40" rows="5" maxlength="2000" value="${communicationManagementPlanInstance?.stakeholderCommunicationRequirements}"/>--%>
<br>
<br>
<br>
<br>
<ckeditor:editor name="stakeholderCommunicationRequirements" height="200px" width="100%" toolbar="Full">
    ${communicationManagementPlanInstance?.stakeholderCommunicationRequirements}
</ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'stakeholderRoles', 'error')} ">
	<label for="stakeholderRoles">
		<g:message code="communicationManagementPlan.stakeholderRoles.label" default="Stakeholder Roles" />
		
	</label>
	<g:select name="stakeholderRoles" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRoles.list()}" multiple="multiple" optionKey="id" size="5" value="${communicationManagementPlanInstance?.stakeholderRoles*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'projectTeamDirectory', 'error')} ">
	<label for="projectTeamDirectory">
		<g:message code="communicationManagementPlan.projectTeamDirectory.label" default="Project Team Directory" />
		
	</label>
	<g:select name="projectTeamDirectory" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" multiple="multiple" optionKey="id" size="5" value="${communicationManagementPlanInstance?.projectTeamDirectory*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'communicationMethodsAndTechnologies', 'error')} ">
	<label for="communicationMethodsAndTechnologies">
		<g:message code="communicationManagementPlan.communicationMethodsAndTechnologies.label" default="Communication Methods And Technologies" />
		
	</label>
	<%--<g:textArea name="communicationMethodsAndTechnologies" cols="40" rows="5" maxlength="2000" value="${communicationManagementPlanInstance?.communicationMethodsAndTechnologies}"/>--%>
    <br>
    <br>
    <br>
    <br>
    <ckeditor:editor name="communicationMethodsAndTechnologies" height="200px" width="100%" toolbar="Full">
        ${communicationManagementPlanInstance?.communicationMethodsAndTechnologies}
    </ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationManagementPlanInstance, field: 'changeControlBoard', 'error')} required">
	<label for="changeControlBoard">
		<g:message code="communicationManagementPlan.changeControlBoard.label" default="Change Control Board" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeControlBoard" name="changeControlBoard.id" from="${ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard.list()}" optionKey="id" required="" value="${communicationManagementPlanInstance?.changeControlBoard?.id}" class="many-to-one"/>
</div>

