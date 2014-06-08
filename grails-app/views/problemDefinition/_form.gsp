<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProblemDefinition" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: problemDefinitionInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="problemDefinition.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" optionKey="id" required="" value="${problemDefinitionInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: problemDefinitionInstance, field: 'problemStatement', 'error')} ">
	<label for="problemStatement">
		<g:message code="problemDefinition.problemStatement.label" default="Problem Statement" />
		
	</label>
	<!--<g:textArea name="problemStatement" cols="40" rows="5" maxlength="2000" value="${problemDefinitionInstance?.problemStatement}"/>-->
        <br />
      <br />
      <tooltip:tip code="This section describes the business problem that this project was created to address.  The problem may be process, technology, or product/service oriented">        
      <ckeditor:editor name="problemStatement" height="200px" width="100%" toolbar="Full">        
	${problemDefinitionInstance?.problemStatement}
      </ckeditor:editor>      
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: problemDefinitionInstance, field: 'organizationalImpact', 'error')} ">
	<label for="organizationalImpact">
		<g:message code="problemDefinition.organizationalImpact.label" default="Organizational Impact" />
		
	</label>
	<!--<g:textArea name="organizationalImpact" cols="40" rows="5" maxlength="2000" value="${problemDefinitionInstance?.organizationalImpact}"/>-->
      <br />
      <br />
<tooltip:tip code="This section describes how the proposed project will modify or affect the organizational processes, tools, hardware, and/or software">              
      <ckeditor:editor name="organizationalImpact" height="200px" width="100%" toolbar="Full">        
	${problemDefinitionInstance?.organizationalImpact}
      </ckeditor:editor>        
  </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: problemDefinitionInstance, field: 'technologyMigration', 'error')} ">
	<label for="technologyMigration">
		<g:message code="problemDefinition.technologyMigration.label" default="Technology Migration" />
		
	</label>
	<!--<g:textArea name="technologyMigration" cols="40" rows="5" maxlength="2000" value="${problemDefinitionInstance?.technologyMigration}"/>-->
        <br />
        <br />
<tooltip:tip code="This section provides a high-level overview of how the new technology will be implemented and how data from the legacy technology will be migrated">                      
      <ckeditor:editor name="technologyMigration" height="200px" width="100%" toolbar="Full">        
	${problemDefinitionInstance?.technologyMigration}
      </ckeditor:editor>        
</tooltip:tip>
</div>

