<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.CostBenefitAnalysis" %>



<div class="fieldcontain ${hasErrors(bean: costBenefitAnalysisInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="costBenefitAnalysis.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" optionKey="id" required="" value="${costBenefitAnalysisInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBenefitAnalysisInstance, field: 'actionAnalysis', 'error')} ">
	<label for="actionAnalysis">
		<g:message code="costBenefitAnalysis.actionAnalysis.label" default="Action Analysis" />
		
	</label>
	<g:textArea name="actionAnalysis" cols="40" rows="5" maxlength="1000" value="${costBenefitAnalysisInstance?.actionAnalysis}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBenefitAnalysisInstance, field: 'actionType', 'error')} required">
	<label for="actionType">
		<g:message code="costBenefitAnalysis.actionType.label" default="Action Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="actionType" from="${costBenefitAnalysisInstance.constraints.actionType.inList}" required="" value="${costBenefitAnalysisInstance?.actionType}" valueMessagePrefix="costBenefitAnalysis.actionType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBenefitAnalysisInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="costBenefitAnalysis.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${costBenefitAnalysisInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBenefitAnalysisInstance, field: 'firstYearCost', 'error')} required">
	<label for="firstYearCost">
		<g:message code="costBenefitAnalysis.firstYearCost.label" default="First Year Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="firstYearCost" value="${fieldValue(bean: costBenefitAnalysisInstance, field: 'firstYearCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBenefitAnalysisInstance, field: 'proyekid', 'error')} ">
	<label for="proyekid">
		<!--<g:message code="costBenefitAnalysis.proyekid.label" default="Proyekid" />-->
		
	</label>
	<g:hiddenField name="proyekid" type="number" value="${costBenefitAnalysisInstance.proyekid}"/>
</div>

