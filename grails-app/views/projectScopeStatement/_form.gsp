<%@ page import="ProjectScopeManagement.DefineScope.ProjectScopeStatement" %>
<head>
    <ckeditor:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectScopeStatement.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${projectScopeStatementInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'productScopeDescription', 'error')} ">
	<label for="productScopeDescription">
		<g:message code="projectScopeStatement.productScopeDescription.label" default="Product Scope Description" />
		
	</label>
	<!--<g:textArea name="productScopeDescription" cols="40" rows="5" maxlength="1000" value="${projectScopeStatementInstance?.productScopeDescription}"/>-->
      <br />
      <br />
      <ckeditor:editor name="productScopeDescription" height="200px" width="100%" toolbar="Full">        
      ${projectScopeStatementInstance?.productScopeDescription}
      </ckeditor:editor>          
</div>

<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'projectAcceptanceCriteria', 'error')} ">
	<label for="projectAcceptanceCriteria">
		<g:message code="projectScopeStatement.projectAcceptanceCriteria.label" default="Project Acceptance Criteria" />
		
	</label>
	<!--<g:textArea name="projectAcceptanceCriteria" cols="40" rows="5" maxlength="1000" value="${projectScopeStatementInstance?.projectAcceptanceCriteria}"/>-->
      <br />
      <br />
      <ckeditor:editor name="projectAcceptanceCriteria" height="200px" width="100%" toolbar="Full">        
      ${projectScopeStatementInstance?.projectAcceptanceCriteria}
      </ckeditor:editor>            
</div>

<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'projectExclusions', 'error')} ">
	<label for="projectExclusions">
		<g:message code="projectScopeStatement.projectExclusions.label" default="Project Exclusions" />
		
	</label>
	<!--<g:textArea name="projectExclusions" cols="40" rows="5" maxlength="1000" value="${projectScopeStatementInstance?.projectExclusions}"/>-->
      <br />
      <br />
      <ckeditor:editor name="projectExclusions" height="200px" width="100%" toolbar="Full">        
      ${projectScopeStatementInstance?.projectExclusions}
      </ckeditor:editor>              
</div>

<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'projectConstraints', 'error')} ">
	<label for="projectConstraints">
		<g:message code="projectScopeStatement.projectConstraints.label" default="Project Constraints" />
		
	</label>
	<!--<g:textArea name="projectConstraints" cols="40" rows="5" maxlength="1000" value="${projectScopeStatementInstance?.projectConstraints}"/>-->
      <br />
      <br />
      <ckeditor:editor name="projectConstraints" height="200px" width="100%" toolbar="Full">        
      ${projectScopeStatementInstance?.projectConstraints}
      </ckeditor:editor>                
</div>

<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'projectAssumptions', 'error')} ">
	<label for="projectAssumptions">
		<g:message code="projectScopeStatement.projectAssumptions.label" default="Project Assumptions" />
		
	</label>
	<!--<g:textArea name="projectAssumptions" cols="40" rows="5" maxlength="1000" value="${projectScopeStatementInstance?.projectAssumptions}"/>-->
      <br />
      <br />
      <ckeditor:editor name="projectAssumptions" height="200px" width="100%" toolbar="Full">        
      ${projectScopeStatementInstance?.projectAssumptions}
      </ckeditor:editor>                  
</div>

<div class="fieldcontain ${hasErrors(bean: projectScopeStatementInstance, field: 'projectDeliverables', 'error')} ">
	<label for="projectDeliverables">
		<g:message code="projectScopeStatement.projectDeliverables.label" default="Project Deliverables" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectScopeStatementInstance?.projectDeliverables?}" var="p">
    <li><g:link controller="projectDeliverable" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectDeliverable" action="create" params="['projectScopeStatement.id': projectScopeStatementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable')])}</g:link>
</li>
</ul>

</div>

