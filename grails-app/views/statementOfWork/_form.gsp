<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'idProject', 'error')} required">
	<!--<label for="idProject">
		<g:message code="statementOfWork.idProject.label" default="Id Project" />
		<span class="required-indicator">*</span>
	</label>-->
	<!--<g:field name="idProject" type="number" value="${statementOfWorkInstance.idProject}" required=""/>-->
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'projectName', 'error')} ">
	<label for="projectName">
		<g:message code="statementOfWork.projectName.label" default="Project Name" />
		
	</label>
	<g:textField name="projectName" value="${statementOfWorkInstance?.projectName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'introduction', 'error')} ">
	<label for="introduction">
		<g:message code="statementOfWork.introduction.label" default="Introduction" />
		
	</label>
	<!--<g:textArea name="introduction" cols="40" rows="5" maxlength="2000" value="${statementOfWorkInstance?.introduction}"/>-->
        <br />
        <br />
        <tooltip:tip code="Background and summary of the proposed project">        
        <ckeditor:editor name="introduction" height="200px" width="100%" toolbar="Full">
        ${statementOfWorkInstance?.introduction}
        </ckeditor:editor>
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'scopeOfWork', 'error')} ">
	<label for="scopeOfWork">
		<g:message code="statementOfWork.scopeOfWork.label" default="Scope Of Work" />
		
	</label>
	<!--<g:textArea name="scopeOfWork" cols="40" rows="5" maxlength="2000" value="${statementOfWorkInstance?.scopeOfWork}"/>-->
        <br />
        <br />
      <tooltip:tip code="this section should highlight what is and is not included in the scope of the project in broader terms">
      <ckeditor:editor name="scopeOfWork" height="200px" width="100%" toolbar="Full">        
        ${statementOfWorkInstance?.scopeOfWork}
      </ckeditor:editor>                                    
      </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'otherRequirements', 'error')} ">
	<label for="otherRequirements">
		<g:message code="statementOfWork.otherRequirements.label" default="Other Requirements" />
		
	</label>
	<!--<g:textArea name="otherRequirements" cols="40" rows="5" maxlength="2000" value="${statementOfWorkInstance?.otherRequirements}"/>-->
        <br />
        <br />
      <tooltip:tip code="Any special requirements, such as security requirements (personnel with security clearance and what level, badges, etc.) should be described in this section">
      <ckeditor:editor name="otherRequirements" height="200px" width="100%" toolbar="Full">        
      ${statementOfWorkInstance?.otherRequirements}
      </ckeditor:editor>                                
      </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'placeOfPerformance', 'error')} ">
	<label for="placeOfPerformance">
		<g:message code="statementOfWork.placeOfPerformance.label" default="Place Of Performance" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.placeOfPerformance?}" var="p">
    <li><g:link controller="placeOfPerformance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="placeOfPerformance" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'periodOfPerformance', 'error')} ">
	<label for="periodOfPerformance">
		<g:message code="statementOfWork.periodOfPerformance.label" default="Period Of Performance" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.periodOfPerformance?}" var="p">
    <li><g:link controller="periodOfPerformance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="periodOfPerformance" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'workRequirements', 'error')} ">
	<label for="workRequirements">
		<g:message code="statementOfWork.workRequirements.label" default="Work Requirements" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.workRequirements?}" var="w">
    <li><g:link controller="workRequirements" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="workRequirements" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'workRequirements.label', default: 'WorkRequirements')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'acceptanceCriteria', 'error')} ">
	<label for="acceptanceCriteria">
		<g:message code="statementOfWork.acceptanceCriteria.label" default="Acceptance Criteria" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.acceptanceCriteria?}" var="a">
    <li><g:link controller="acceptanceCriteria" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="acceptanceCriteria" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'statementOfWorkApprovals', 'error')} ">
	<label for="statementOfWorkApprovals">
		<g:message code="statementOfWork.statementOfWorkApprovals.label" default="Statement Of Work Approvals" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.statementOfWorkApprovals?}" var="s">
    <li><g:link controller="statementOfWorkApproval" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="statementOfWorkApproval" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'milestones', 'error')} ">
	<label for="milestones">
		<g:message code="statementOfWork.milestones.label" default="Milestones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.milestones?}" var="m">
    <li><g:link controller="milestones" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="milestones" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'milestones.label', default: 'Milestones')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="statementOfWork.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statementOfWorkInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['statementOfWork.id': statementOfWorkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

