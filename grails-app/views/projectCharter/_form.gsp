<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter" %>
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.Milestones" %>
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.MilestonesController" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>



<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectCharter.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${projectCharterInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'payment', 'error')} ">
	<label for="payment">
		<g:message code="projectCharter.payment.label" default="Payment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectCharterInstance?.payment?}" var="p">
    <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payment" action="create" params="['projectCharter.id': projectCharterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'projectPurpose', 'error')} ">
	<label for="projectPurpose">
		<g:message code="projectCharter.projectPurpose.label" default="Project Purpose" />

	</label>
    <!--<g:textArea name="projectPurpose" cols="40" rows="5" maxlength="2000" value="${projectCharterInstance?.projectPurpose}"/>-->
    <br />
    <br />
    <tooltip:tip code="this section describe purpose of the project">
        <ckeditor:editor name="projectPurpose" height="200px" width="100%" toolbar="Full">
            ${projectCharterInstance?.projectPurpose}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'projectDescription', 'error')} ">
	<label for="projectDescription">
		<g:message code="projectCharter.projectDescription.label" default="Project Description" />
		
	</label>
    <!--<g:textArea name="projectDescription" cols="40" rows="5" maxlength="2000" value="${projectCharterInstance?.projectDescription}"/>-->
    <br />
    <br />

    <tooltip:tip code="this section describes description of the project">
        <ckeditor:editor name="projectDescription" height="200px" width="100%" toolbar="Full">
            ${projectCharterInstance?.projectDescription}
        </ckeditor:editor>
    </tooltip:tip>

</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'projectScope', 'error')} ">
	<label for="projectScope">
		<g:message code="projectCharter.projectScope.label" default="Project Scope" />
		
	</label>
    <!--<g:textArea name="projectScope" cols="40" rows="5" maxlength="2000" value="${projectCharterInstance?.projectScope}"/>-->
    <br />
    <br />
    <tooltip:tip code="this section scope of the project">
        <ckeditor:editor name="projectScope" height="200px" width="100%" toolbar="Full">
            ${projectCharterInstance?.projectScope}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'acceptanceCriteria', 'error')} ">
	<label for="acceptanceCriteria">
		<g:message code="projectCharter.acceptanceCriteria.label" default="Acceptance Criteria" />
		
	</label>
    <!--<g:textArea name="acceptanceCriteria" cols="40" rows="5" maxlength="2000" value="${projectCharterInstance?.acceptanceCriteria}"/>-->
    <br />
    <br />
    <tooltip:tip code="this section criteria on how the project will be accepted">
        <ckeditor:editor name="acceptanceCriteria" height="200px" width="100%" toolbar="Full">
            ${projectCharterInstance?.acceptanceCriteria}
        </ckeditor:editor>
    </tooltip:tip>

</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'initialRisk', 'error')} ">
	<label for="initialRisk">
		<g:message code="projectCharter.initialRisk.label" default="Initial Risk" />
		
	</label>
    <!--<g:textArea name="initialRisk" cols="40" rows="5" maxlength="1000" value="${projectCharterInstance?.initialRisk}"/>-->
    <br />
    <br />
    <tooltip:tip code="this section describe the risk initiated at the beginning of the project">
        <ckeditor:editor name="initialRisk" height="200px" width="100%" toolbar="Full">
            ${projectCharterInstance?.initialRisk}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'estimatedBudget', 'error')} required">
	<label for="estimatedBudget">
		<g:message code="projectCharter.estimatedBudget.label" default="Estimated Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimatedBudget" type="number" value="${projectCharterInstance.estimatedBudget}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'projectManagerAuthority', 'error')} ">
	<label for="projectManagerAuthority">
		<g:message code="projectCharter.projectManagerAuthority.label" default="Project Manager Authority" />
		
	</label>
    <!--<g:textArea name="projectManagerAuthority" cols="40" rows="5" maxlength="2000" value="${projectCharterInstance?.projectManagerAuthority}"/>-->
    <br />
    <br />

    <tooltip:tip code="this section Identify the Project Manager and give him authority to apply organization resources to the project">
        <ckeditor:editor name="projectManagerAuthority" height="200px" width="100%" toolbar="Full">
            ${projectCharterInstance?.projectManagerAuthority}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'milestones', 'error')} ">
	<label for="milestones">
		<g:message code="projectCharter.milestones.label" default="Milestones" />
		
	</label>
	<g:select name="milestones" from="${milestones}" multiple="multiple" optionKey="id" size="5" value="${projectCharterInstance?.milestones*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterInstance, field: 'projectCharterApprovals', 'error')} ">
	<label for="projectCharterApprovals">
		<g:message code="projectCharter.projectCharterApprovals.label" default="Project Charter Approvals" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectCharterInstance?.projectCharterApprovals?}" var="p">
    <li><g:link controller="projectCharterApproval" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectCharterApproval" action="create" params="['projectCharter.id': projectCharterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval')])}</g:link>
</li>
</ul>

</div>

