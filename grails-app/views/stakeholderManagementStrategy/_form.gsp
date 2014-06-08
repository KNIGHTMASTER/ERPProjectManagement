<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderManagementStrategy" %>
<head>
    <ckeditor:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: stakeholderManagementStrategyInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="stakeholderManagementStrategy.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${stakeholderManagementStrategyInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderManagementStrategyInstance, field: 'projectStatusControl', 'error')} ">
	<label for="projectStatusControl">
		<g:message code="stakeholderManagementStrategy.projectStatusControl.label" default="Project Status Control" />
		
	</label>
	<g:textField name="projectStatusControl" value="${stakeholderManagementStrategyInstance?.projectStatusControl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderManagementStrategyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="stakeholderManagementStrategy.description.label" default="Description" />
		
	</label>
	<%--<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${stakeholderManagementStrategyInstance?.description}"/>--%>
<br>
<br>
<tooltip:tip code="This section describe how the stakeholder will be managed along the project">
    <ckeditor:editor name="description" height="200px" width="100%" toolbar="Full">
        ${stakeholderManagementStrategyInstance?.description}
    </ckeditor:editor>
</tooltip:tip>
</div>

