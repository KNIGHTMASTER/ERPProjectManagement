<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase" %>



<div class="fieldcontain ${hasErrors(bean: businessCaseInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="businessCase.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal.list()}" optionKey="id" required="" value="${businessCaseInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseInstance, field: 'businessCaseAnalysisTeams', 'error')} ">
	<label for="businessCaseAnalysisTeams">
		<g:message code="businessCase.businessCaseAnalysisTeams.label" default="Business Case Analysis Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${businessCaseInstance?.businessCaseAnalysisTeams?}" var="b">
    <li><g:link controller="businessCaseAnalysisTeam" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="businessCaseAnalysisTeam" action="create" params="['businessCase.id': businessCaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseInstance, field: 'problemDefinitions', 'error')} ">
	<label for="problemDefinitions">
		<g:message code="businessCase.problemDefinitions.label" default="Problem Definitions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${businessCaseInstance?.problemDefinitions?}" var="p">
    <li><g:link controller="problemDefinition" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="problemDefinition" action="create" params="['businessCase.id': businessCaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseInstance, field: 'projectOverviews', 'error')} ">
	<label for="projectOverviews">
		<g:message code="businessCase.projectOverviews.label" default="Project Overviews" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${businessCaseInstance?.projectOverviews?}" var="p">
    <li><g:link controller="projectOverview" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectOverview" action="create" params="['businessCase.id': businessCaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectOverview.label', default: 'ProjectOverview')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseInstance, field: 'costBenefitAnalysis', 'error')} ">
	<label for="costBenefitAnalysis">
		<g:message code="businessCase.costBenefitAnalysis.label" default="Cost Benefit Analysis" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${businessCaseInstance?.costBenefitAnalysis?}" var="c">
    <li><g:link controller="costBenefitAnalysis" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="costBenefitAnalysis" action="create" params="['businessCase.id': businessCaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseInstance, field: 'businessCaseApprovals', 'error')} ">
	<label for="businessCaseApprovals">
		<g:message code="businessCase.businessCaseApprovals.label" default="Business Case Approvals" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${businessCaseInstance?.businessCaseApprovals?}" var="b">
    <li><g:link controller="businessCaseApproval" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="businessCaseApproval" action="create" params="['businessCase.id': businessCaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval')])}</g:link>
</li>
</ul>

</div>

