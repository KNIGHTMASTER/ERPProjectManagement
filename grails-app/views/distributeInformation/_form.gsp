<%@ page import="ProjectCommunicationManagement.DistributeInformation.DistributeInformation" %>



<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'projectCharter', 'error')} required">
	<label for="projectCharter">
		<g:message code="distributeInformation.projectCharter.label" default="Project Charter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectCharter" name="projectCharter.id" from="${namaProyek}" optionKey="id" required="" value="${distributeInformationInstance?.projectCharter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'activityTracking', 'error')} required">
	<label for="activityTracking">
		<g:message code="distributeInformation.activityTracking.label" default="Activity Tracking" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activityTracking" name="activityTracking.id" from="${activityTracking}" optionKey="id" required="" value="${distributeInformationInstance?.activityTracking?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'stakeholder', 'error')} ">
	<label for="stakeholder">
		<g:message code="distributeInformation.stakeholder.label" default="Stakeholder" />
		
	</label>
	<g:select name="stakeholder" from="${stakeholder}" multiple="multiple" optionKey="id" size="5" value="${distributeInformationInstance?.stakeholder*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'summary', 'error')} ">
	<label for="summary">
		<g:message code="distributeInformation.summary.label" default="Summary" />
		
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="2000" value="${distributeInformationInstance?.summary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'workPlannedLastActivity', 'error')} ">
	<label for="workPlannedLastActivity">
		<g:message code="distributeInformation.workPlannedLastActivity.label" default="Work Planned Last Activity" />
		
	</label>
	<g:textArea name="workPlannedLastActivity" cols="40" rows="5" maxlength="1000" value="${distributeInformationInstance?.workPlannedLastActivity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'workPlannedNextActivity', 'error')} ">
	<label for="workPlannedNextActivity">
		<g:message code="distributeInformation.workPlannedNextActivity.label" default="Work Planned Next Activity" />
		
	</label>
	<g:textArea name="workPlannedNextActivity" cols="40" rows="5" maxlength="1000" value="${distributeInformationInstance?.workPlannedNextActivity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'openIssues', 'error')} ">
	<label for="openIssues">
		<g:message code="distributeInformation.openIssues.label" default="Open Issues" />
		
	</label>
	<g:textArea name="openIssues" cols="40" rows="5" maxlength="1000" value="${distributeInformationInstance?.openIssues}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'openRisks', 'error')} ">
	<label for="openRisks">
		<g:message code="distributeInformation.openRisks.label" default="Open Risks" />
		
	</label>
	<g:textArea name="openRisks" cols="40" rows="5" maxlength="1000" value="${distributeInformationInstance?.openRisks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: distributeInformationInstance, field: 'distribute', 'error')} ">
	<label for="distribute">
		<g:message code="distributeInformation.distribute.label" default="Distribute" />
		
	</label>
	<g:checkBox name="distribute" value="${distributeInformationInstance?.distribute}" />
</div>

