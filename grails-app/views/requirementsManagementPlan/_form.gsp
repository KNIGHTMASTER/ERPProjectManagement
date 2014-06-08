<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsManagementPlan" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="requirementsManagementPlan.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${requirementsManagementPlanInstance?.projectName?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'categories', 'error')} ">
    <label for="categories">
        <g:message code="requirementsManagementPlan.categories.label" default="Categories" />

    </label>
    <g:textField name="categories" value="${requirementsManagementPlanInstance?.categories}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'requirementsCollection', 'error')} ">
	<label for="requirementsCollection">
		<g:message code="requirementsManagementPlan.requirementsCollection.label" default="Requirements Collection" />
		
	</label>
    <!--<g:textArea name="requirementsCollection" cols="40" rows="5" maxlength="1000" value="${requirementsManagementPlanInstance?.requirementsCollection}"/>-->
    <br />
    <br />
    <tooltip:tip code="Describe how requirements will be collected.  Consider such techniques as brainstorming, interviewing">
        <ckeditor:editor name="requirementsCollection" height="200px" width="100%" toolbar="Full">
            ${requirementsManagementPlanInstance?.requirementsCollection}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'prioritization', 'error')} ">
	<label for="prioritization">
		<g:message code="requirementsManagementPlan.prioritization.label" default="Prioritization" />
		
	</label>
    <!--<g:textArea name="prioritization" cols="40" rows="5" maxlength="1000" value="${requirementsManagementPlanInstance?.prioritization}"/>-->
    <br />
    <br />
    <tooltip:tip code="Identify the approach to prioritize requirements">
        <ckeditor:editor name="prioritization" height="200px" width="100%" toolbar="Full">
            ${requirementsManagementPlanInstance?.prioritization}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'traceability', 'error')} ">
	<label for="traceability">
		<g:message code="requirementsManagementPlan.traceability.label" default="Traceability" />
		
	</label>
    <!--<g:textArea name="traceability" cols="40" rows="5" maxlength="1000" value="${requirementsManagementPlanInstance?.traceability}"/>-->
    <br />
    <br />
    <tooltip:tip code="Identify the requirement attributes that will be used for tracing requirements, such as functional to business requirements or functional to security requirements">
        <ckeditor:editor name="traceability" height="200px" width="100%" toolbar="Full">
            ${requirementsManagementPlanInstance?.traceability}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'configurationManagement', 'error')} ">
    <label for="configurationManagement">
        <g:message code="requirementsManagementPlan.configurationManagement.label" default="Configuration Management" />

    </label>
    <!--<g:textArea name="configurationManagement" cols="40" rows="5" maxlength="1000" value="${requirementsManagementPlanInstance?.configurationManagement}"/>-->
    <br />
    <br />
    <tooltip:tip code="Describe how requirements can be changed.  Include a description of the process and any necessary forms, processes, or procedures needed to initiate a change.  Document how analysis of the impact or changes will be conducted.  Include levels of approval necessary for changes">
        <ckeditor:editor name="configurationManagement" height="200px" width="100%" toolbar="Full">
            ${requirementsManagementPlanInstance?.configurationManagement}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsManagementPlanInstance, field: 'verification', 'error')} ">
    <label for="verification">
        <g:message code="requirementsManagementPlan.verification.label" default="Verification" />

    </label>
    <!--<g:textArea name="verification" cols="40" rows="5" maxlength="1000" value="${requirementsManagementPlanInstance?.verification}"/>-->
    <br />
    <br />
    <tooltip:tip code="Describe the different methods that will be used to verify requirements, such as observation, measurement, testing, etc.  Include any metrics that will be used for verification">
        <ckeditor:editor name="verification" height="200px" width="100%" toolbar="Full">
            ${requirementsManagementPlanInstance?.verification}
        </ckeditor:editor>
    </tooltip:tip>
</div>
