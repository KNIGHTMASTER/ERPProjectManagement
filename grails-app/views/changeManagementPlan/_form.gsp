<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeManagementPlan" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: changeManagementPlanInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="changeManagementPlan.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${changeManagementPlanInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeManagementPlanInstance, field: 'changeManagementApproach', 'error')} ">
	<label for="changeManagementApproach">
		<g:message code="changeManagementPlan.changeManagementApproach.label" default="Change Management Approach" />
		
	</label>
	<!--<g:textArea name="changeManagementApproach" cols="40" rows="5" maxlength="2000" value="${changeManagementPlanInstance?.changeManagementApproach}"/>-->
      <br />
      <br />
      <tooltip:tip code="Describe the degree of change control, the relationship to configuration management, and how change control will integrate with other aspects of project management.">
      <ckeditor:editor name="changeManagementApproach" height="200px" width="100%" toolbar="Full">        
      ${changeManagementPlanInstance?.changeManagementApproach}
      </ckeditor:editor>  
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: changeManagementPlanInstance, field: 'datePrepared', 'error')} required">
	<label for="datePrepared">
		<g:message code="changeManagementPlan.datePrepared.label" default="Date Prepared" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datePrepared" precision="day"  value="${changeManagementPlanInstance?.datePrepared}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: changeManagementPlanInstance, field: 'definitionsOfChange', 'error')} ">
	<label for="definitionsOfChange">
		<g:message code="changeManagementPlan.definitionsOfChange.label" default="Definitions Of Change" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${changeManagementPlanInstance?.definitionsOfChange?}" var="d">
    <li><g:link controller="definitionsOfChange" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="definitionsOfChange" action="create" params="['changeManagementPlan.id': changeManagementPlanInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: changeManagementPlanInstance, field: 'changeControlBoard', 'error')} ">
    <label for="changeControlBoard">
        <g:message code="changeManagementPlan.changeControlBoard.label" default="Change Control Board" />

    </label>

    <ul class="one-to-many">
        <g:each in="${changeManagementPlanInstance?.changeControlBoard?}" var="c">
            <li><g:link controller="changeControlBoard" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="changeControlBoard" action="create" params="['changeManagementPlan.id': changeManagementPlanInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard')])}</g:link>
        </li>
    </ul>

</div>

