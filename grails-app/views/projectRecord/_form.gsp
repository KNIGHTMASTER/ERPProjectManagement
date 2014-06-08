<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectRecord.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${projectRecordInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'projectSummary', 'error')} ">
	<label for="projectSummary">
		<g:message code="projectRecord.projectSummary.label" default="Project Summary" />
		
	</label>
	<%--<g:textArea name="projectSummary" cols="40" rows="5" maxlength="200000" value="${projectRecordInstance?.projectSummary}"/>--%>
    <br />
    <br />
    <tooltip:tip code="This section should contains project background overview, project scope and project management">
        <ckeditor:editor name="projectSummary" height="200px" width="100%" toolbar="Full">
            ${projectRecordInstance?.projectSummary}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'projectTeam', 'error')} ">
	<label for="projectTeam">
		<g:message code="projectRecord.projectTeam.label" default="Project Team" />
		
	</label>
	<g:select name="projectTeam" from="${ProjectIntegrationManagement.DirectAndManageProjectExecution.ManageTeamMemberAssignedToProject.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.projectTeam*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'transitionToOperation', 'error')} ">
	<label for="transitionToOperation">
		<g:message code="projectRecord.transitionToOperation.label" default="Transition To Operation" />
		
	</label>
	<%--<g:textArea name="transitionToOperation" cols="40" rows="5" maxlength="2000" value="${projectRecordInstance?.transitionToOperation}"/>--%>
    <br />
    <br />
    <tooltip:tip code="This section describes the transition of the project to operations upon completion.  This section should include any difficulties or challenges faced during this transition. ">
        <ckeditor:editor name="transitionToOperation" height="200px" width="100%" toolbar="Full">
            ${projectRecordInstance?.transitionToOperation}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'goalsAndObjectives', 'error')} ">
	<label for="goalsAndObjectives">
		<g:message code="projectRecord.goalsAndObjectives.label" default="Goals And Objectives" />
		
	</label>
	<g:select name="goalsAndObjectives" from="${ProjectIntegrationManagement.DevelopProjectCharter.GoalsAndObjectives.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.goalsAndObjectives*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'projectDeliverables', 'error')} ">
	<label for="projectDeliverables">
		<g:message code="projectRecord.projectDeliverables.label" default="Project Deliverables" />
		
	</label>
	<g:select name="projectDeliverables" from="${ProjectScopeManagement.VerifyScope.Inspection.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.projectDeliverables*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'projectSchedule', 'error')} ">
	<label for="projectSchedule">
		<g:message code="projectRecord.projectSchedule.label" default="Project Schedule" />
		
	</label>
	<g:select name="projectSchedule" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.projectSchedule*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'projectBudget', 'error')} required">
	<label for="projectBudget">
		<g:message code="projectRecord.projectBudget.label" default="Project Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectBudget" name="projectBudget.id" from="${ProjectCostManagement.DetermineBudget.Budget.list()}" optionKey="id" required="" value="${projectRecordInstance?.projectBudget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'monthBudgets', 'error')} ">
	<label for="monthBudgets">
		<g:message code="projectRecord.monthBudgets.label" default="Month Budgets" />
		
	</label>
	<g:select name="monthBudgets" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.monthBudgets*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'activityCosts', 'error')} ">
	<label for="activityCosts">
		<g:message code="projectRecord.activityCosts.label" default="Activity Costs" />
		
	</label>
	<g:select name="activityCosts" from="${ProjectCostManagement.DetermineBudget.ActivityCost.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.activityCosts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'materialActivityCosts', 'error')} ">
	<label for="materialActivityCosts">
		<g:message code="projectRecord.materialActivityCosts.label" default="Material Activity Costs" />
		
	</label>
	<g:select name="materialActivityCosts" from="${ProjectCostManagement.DetermineBudget.MaterialCostActivity.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.materialActivityCosts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'managementCostActivity', 'error')} ">
	<label for="managementCostActivity">
		<g:message code="projectRecord.managementCostActivity.label" default="Management Cost Activity" />
		
	</label>
	<g:select name="managementCostActivity" from="${ProjectCostManagement.DetermineBudget.ManagementCostActivity.list()}" multiple="multiple" optionKey="id" size="5" value="${projectRecordInstance?.managementCostActivity*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'qualityManagement', 'error')} ">
	<label for="qualityManagement">
		<g:message code="projectRecord.qualityManagement.label" default="Quality Management" />
		
	</label>
	<%--<g:textArea name="qualityManagement" cols="40" rows="5" maxlength="2000" value="${projectRecordInstance?.qualityManagement}"/>--%>
    <br />
    <br />
    <tooltip:tip code="This section describe how quality control was done during project">
        <ckeditor:editor name="qualityManagement" height="200px" width="100%" toolbar="Full">
            ${projectRecordInstance?.qualityManagement}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'communicationManagement', 'error')} ">
	<label for="communicationManagement">
		<g:message code="projectRecord.communicationManagement.label" default="Communication Management" />
		
	</label>
	<%--<g:textArea name="communicationManagement" cols="40" rows="5" maxlength="2000" value="${projectRecordInstance?.communicationManagement}"/>--%>
    <br />
    <br />
    <tooltip:tip code="This section describe how communication management was done during project">
        <ckeditor:editor name="communicationManagement" height="200px" width="100%" toolbar="Full">
            ${projectRecordInstance?.communicationManagement}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'lessonLearned', 'error')} ">
	<label for="lessonLearned">
		<g:message code="projectRecord.lessonLearned.label" default="Lesson Learned" />
		
	</label>
	<%--<g:textArea name="lessonLearned" cols="40" rows="5" maxlength="2000" value="${projectRecordInstance?.lessonLearned}"/>--%>
    <br />
    <br />
    <tooltip:tip code="This section should highlight what lesson learned during project until done">
        <ckeditor:editor name="lessonLearned" height="200px" width="100%" toolbar="Full">
            ${projectRecordInstance?.lessonLearned}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'recommendations', 'error')} ">
	<label for="recommendations">
		<g:message code="projectRecord.recommendations.label" default="Recommendations" />
		
	</label>
	<%--<g:textArea name="recommendations" cols="40" rows="5" maxlength="2000" value="${projectRecordInstance?.recommendations}"/>--%>
    <br />
    <br />
    <tooltip:tip code="This section should highlight any recommendations and lessons learned which would be of use on future projects">
        <ckeditor:editor name="recommendations" height="200px" width="100%" toolbar="Full">
            ${projectRecordInstance?.recommendations}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectRecordInstance, field: 'approvals', 'error')} ">
	<label for="approvals">
		<g:message code="projectRecord.approvals.label" default="Approvals" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectRecordInstance?.approvals?}" var="a">
    <li><g:link controller="recordAcceptance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="recordAcceptance" action="create" params="['projectRecord.id': projectRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance')])}</g:link>
</li>
</ul>

</div>

