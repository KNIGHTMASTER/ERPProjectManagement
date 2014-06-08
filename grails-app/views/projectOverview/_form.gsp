<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectOverview" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: projectOverviewInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectOverview.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" optionKey="id" required="" value="${projectOverviewInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectOverviewInstance, field: 'projectDescription', 'error')} ">
	<label for="projectDescription">
		<g:message code="projectOverview.projectDescription.label" default="Project Description" />
		
	</label>
	<!--<g:textArea name="projectDescription" cols="40" rows="5" maxlength="2000" value="${projectOverviewInstance?.projectDescription}"/>-->
      <br />
      <br />
      <tooltip:tip code="This section describes the approach the project will use to address the business problem(s)">        
      <ckeditor:editor name="projectDescription" height="200px" width="100%" toolbar="Full">        
          ${projectOverviewInstance?.projectDescription}
      </ckeditor:editor>        
      </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectOverviewInstance, field: 'projectAssumptions', 'error')} ">
	<label for="projectAssumptions">
		<g:message code="projectOverview.projectAssumptions.label" default="Project Assumptions" />
		
	</label>
	<!--<g:textArea name="projectAssumptions" cols="40" rows="5" maxlength="2000" value="${projectOverviewInstance?.projectAssumptions}"/>-->
        <br />
        <br />
        <tooltip:tip code="This section lists the preliminary assumptions for the proposed project">                
          <ckeditor:editor name="projectAssumptions" height="200px" width="100%" toolbar="Full">        
            ${projectOverviewInstance?.projectAssumptions}
        </ckeditor:editor>                    
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectOverviewInstance, field: 'projectConstraints', 'error')} ">
	<label for="projectConstraints">
		<g:message code="projectOverview.projectConstraints.label" default="Project Constraints" />
		
	</label>
	<!--<g:textArea name="projectConstraints" cols="40" rows="5" maxlength="2000" value="${projectOverviewInstance?.projectConstraints}"/>-->
          <br />
        <br />
        <tooltip:tip code="This section lists the preliminary constraints for the proposed project">
        <ckeditor:editor name="projectConstraints" height="200px" width="100%" toolbar="Full">        
          ${projectOverviewInstance?.projectConstraints}
        </ckeditor:editor>          
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectOverviewInstance, field: 'goalsAndObjectives', 'error')} ">
	<label for="goalsAndObjectives">
		<g:message code="projectOverview.goalsAndObjectives.label" default="Goals And Objectives" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectOverviewInstance?.goalsAndObjectives?}" var="g">
    <li><g:link controller="goalsAndObjectives" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="goalsAndObjectives" action="create" params="['projectOverview.id': projectOverviewInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives')])}</g:link>
</li>
</ul>

</div>

