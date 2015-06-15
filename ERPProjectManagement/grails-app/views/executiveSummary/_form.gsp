<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ExecutiveSummary" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: executiveSummaryInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="executiveSummary.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" optionKey="id" required="" value="${executiveSummaryInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executiveSummaryInstance, field: 'issue', 'error')} ">
	<label for="issue">
		<g:message code="executiveSummary.issue.label" default="Issue" />
		
	</label>
	<!--<g:textArea name="issue" cols="40" rows="5" maxlength="2000" value="${executiveSummaryInstance?.issue}"/>-->
        <br />
        <br />
        <tooltip:tip code="This section should briefly describe the business problem that the proposed project will address">        
        <ckeditor:editor name="issue" height="200px" width="100%" toolbar="Full">        
            ${executiveSummaryInstance?.issue}
      </ckeditor:editor>              
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: executiveSummaryInstance, field: 'anticipatedOutcomes', 'error')} ">
	<label for="anticipatedOutcomes">
		<g:message code="executiveSummary.anticipatedOutcomes.label" default="Anticipated Outcomes" />
		
	</label>
	<!--<g:textArea name="anticipatedOutcomes" cols="40" rows="5" maxlength="2000" value="${executiveSummaryInstance?.anticipatedOutcomes}"/>-->
        <br />
        <br />
        <tooltip:tip code="This section should describe the anticipated outcome if the proposed project or initiative is implemented">        
      <ckeditor:editor name="anticipatedOutcomes" height="200px" width="100%" toolbar="Full">        
          ${executiveSummaryInstance?.anticipatedOutcomes}
      </ckeditor:editor>                    
        </tooltip:tip>
 
</div>

<div class="fieldcontain ${hasErrors(bean: executiveSummaryInstance, field: 'recommendation', 'error')} ">
	<label for="recommendation">
		<g:message code="executiveSummary.recommendation.label" default="Recommendation" />
		
	</label>
	<!--<g:textArea name="recommendation" cols="40" rows="5" maxlength="2000" value="${executiveSummaryInstance?.recommendation}"/>-->
          <br />
        <br />
        <tooltip:tip code="This section summarizes the approach for how the project will address the business problem">                
      <ckeditor:editor name="recommendation" height="200px" width="100%" toolbar="Full">        
      ${executiveSummaryInstance?.anticipatedOutcomes}
      </ckeditor:editor>                          
        </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: executiveSummaryInstance, field: 'justification', 'error')} ">
	<label for="justification">
		<g:message code="executiveSummary.justification.label" default="Justification" />
		
	</label>
	<!--<g:textArea name="justification" cols="40" rows="5" maxlength="2000" value="${executiveSummaryInstance?.justification}"/>-->
        <br />
        <br />
        <tooltip:tip code="This section justifies why the recommended project should be implemented and why it was selected over other alternatives">                        
      <ckeditor:editor name="justification" height="200px" width="100%" toolbar="Full">        
        ${executiveSummaryInstance?.justification}
      </ckeditor:editor>                                    
        </tooltip:tip>
</div>

