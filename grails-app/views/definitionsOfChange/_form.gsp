<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.DefinitionsOfChange" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: definitionsOfChangeInstance, field: 'changeManagementPlan', 'error')} required">
	<label for="changeManagementPlan">
		<g:message code="definitionsOfChange.changeManagementPlan.label" default="Change Management Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeManagementPlan" name="changeManagementPlan.id" from="${namaProyek}" optionKey="id" required="" value="${definitionsOfChangeInstance?.changeManagementPlan?.id}" class="many-to-one"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: definitionsOfChangeInstance, field: 'scheduleChange', 'error')} ">
	<label for="scheduleChange">
		<g:message code="definitionsOfChange.scheduleChange.label" default="Schedule Change" />
		
	</label>
	<!--<g:textArea name="scheduleChange" cols="40" rows="5" maxlength="1000" value="${definitionsOfChangeInstance?.scheduleChange}"/>-->
        <br />
        <br />
        <tooltip:tip code="Schedule change:  Define a schedule change versus a schedule revision.  Indicate when a schedule variance needs to go through the change control process to be rebaselined.">
      <ckeditor:editor name="scheduleChange" height="200px" width="100%" toolbar="Full">        
      ${definitionsOfChangeInstance?.scheduleChange}
      </ckeditor:editor>          
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: definitionsOfChangeInstance, field: 'budgetChange', 'error')} ">
	<label for="budgetChange">
		<g:message code="definitionsOfChange.budgetChange.label" default="Budget Change" />
		
	</label>
	<!--<g:textArea name="budgetChange" cols="40" rows="5" maxlength="1000" value="${definitionsOfChangeInstance?.budgetChange}"/>-->
        <br />
        <br />
        <tooltip:tip code="Budget change: Define a budget change versus a budget update.  Indicate when a budget variance needs to go through the change control process to be rebaselined.">
      <ckeditor:editor name="budgetChange" height="200px" width="100%" toolbar="Full">        
      ${definitionsOfChangeInstance?.budgetChange}
      </ckeditor:editor>            
          </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: definitionsOfChangeInstance, field: 'scopeChange', 'error')} ">
	<label for="scopeChange">
		<g:message code="definitionsOfChange.scopeChange.label" default="Scope Change" />
		
	</label>
	<!--<g:textArea name="scopeChange" cols="40" rows="5" maxlength="1000" value="${definitionsOfChangeInstance?.scopeChange}"/>-->
        <br />
        <br />
        <tooltip:tip code="Scope change: Define a scope change versus a change in approach.  Indicate when a scope variance needs to go through a change control process to be rebaselined.">
      <ckeditor:editor name="scopeChange" height="200px" width="100%" toolbar="Full">        
      ${definitionsOfChangeInstance?.scopeChange}
      </ckeditor:editor>              
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: definitionsOfChangeInstance, field: 'projectDocumentChanges', 'error')} ">
	<label for="projectDocumentChanges">
		<g:message code="definitionsOfChange.projectDocumentChanges.label" default="Project Document Changes" />
		
	</label>
	<!--<g:textArea name="projectDocumentChanges" cols="40" rows="5" maxlength="1000" value="${definitionsOfChangeInstance?.projectDocumentChanges}"/>-->
        <br />
        <br />
<tooltip:tip code="Project document changes: Define when updates to project management documents or other project documents need to go through the change control process to be rebaselined.">        
      <ckeditor:editor name="projectDocumentChanges" height="200px" width="100%" toolbar="Full">        
      ${definitionsOfChangeInstance?.projectDocumentChanges}
      </ckeditor:editor>                
</tooltip:tip>        
</div>

