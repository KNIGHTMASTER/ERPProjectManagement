<%@ page import="ProjectScopeManagement.ControlScope.VarianceAnalysis" %>



<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="varianceAnalysis.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${varianceAnalysisInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'dateRequested', 'error')} required">
	<label for="dateRequested">
		<g:message code="varianceAnalysis.dateRequested.label" default="Date Requested" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateRequested" precision="day"  value="${varianceAnalysisInstance?.dateRequested}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'changeRequestor', 'error')} required">
	<label for="changeRequestor">
		<g:message code="varianceAnalysis.changeRequestor.label" default="Change Requestor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeRequestor" name="changeRequestor.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${varianceAnalysisInstance?.changeRequestor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'changeCategory', 'error')} required">
	<label for="changeCategory">
		<g:message code="varianceAnalysis.changeCategory.label" default="Change Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="changeCategory" from="${varianceAnalysisInstance.constraints.changeCategory.inList}" required="" value="${varianceAnalysisInstance?.changeCategory}" valueMessagePrefix="varianceAnalysis.changeCategory"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'changeAffect', 'error')} required">
	<label for="changeAffect">
		<g:message code="varianceAnalysis.changeAffect.label" default="Change Affect" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="changeAffect" from="${varianceAnalysisInstance.constraints.changeAffect.inList}" required="" value="${varianceAnalysisInstance?.changeAffect}" valueMessagePrefix="varianceAnalysis.changeAffect"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'changeRequested', 'error')} ">
	<label for="changeRequested">
		<g:message code="varianceAnalysis.changeRequested.label" default="Change Requested" />
		
	</label>
	<g:textArea name="changeRequested" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.changeRequested}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'reasonForChange', 'error')} ">
	<label for="reasonForChange">
		<g:message code="varianceAnalysis.reasonForChange.label" default="Reason For Change" />
		
	</label>
	<g:textArea name="reasonForChange" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.reasonForChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'alternativeConsidered', 'error')} ">
	<label for="alternativeConsidered">
		<g:message code="varianceAnalysis.alternativeConsidered.label" default="Alternative Considered" />
		
	</label>
	<g:textArea name="alternativeConsidered" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.alternativeConsidered}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'requiredTechnicalChange', 'error')} ">
	<label for="requiredTechnicalChange">
		<g:message code="varianceAnalysis.requiredTechnicalChange.label" default="Required Technical Change" />
		
	</label>
	<g:textArea name="requiredTechnicalChange" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.requiredTechnicalChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'riskForTheChange', 'error')} ">
	<label for="riskForTheChange">
		<g:message code="varianceAnalysis.riskForTheChange.label" default="Risk For The Change" />
		
	</label>
	<g:textArea name="riskForTheChange" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.riskForTheChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'estimatedCostNeeded', 'error')} required">
	<label for="estimatedCostNeeded">
		<g:message code="varianceAnalysis.estimatedCostNeeded.label" default="Estimated Cost Needed" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimatedCostNeeded" type="number" value="${varianceAnalysisInstance.estimatedCostNeeded}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'estimatedResourceNeeded', 'error')} ">
	<label for="estimatedResourceNeeded">
		<g:message code="varianceAnalysis.estimatedResourceNeeded.label" default="Estimated Resource Needed" />
		
	</label>
	<g:textArea name="estimatedResourceNeeded" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.estimatedResourceNeeded}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'implicationOfQuality', 'error')} ">
	<label for="implicationOfQuality">
		<g:message code="varianceAnalysis.implicationOfQuality.label" default="Implication Of Quality" />
		
	</label>
	<g:textArea name="implicationOfQuality" cols="40" rows="5" maxlength="1000" value="${varianceAnalysisInstance?.implicationOfQuality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: varianceAnalysisInstance, field: 'approvals', 'error')} ">
	<label for="approvals">
		<g:message code="varianceAnalysis.approvals.label" default="Approvals" />
		
	</label>
	<g:select name="approvals" from="${ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeBoardApproval.list()}" multiple="multiple" optionKey="id" size="5" value="${varianceAnalysisInstance?.approvals*.id}" class="many-to-many"/>
</div>

