<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.Requirement" %>



<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'idRequirement', 'error')} required">
	<label for="idRequirement">
		<g:message code="requirement.idRequirement.label" default="Id Requirement" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idRequirement" required="" value="${requirementInstance?.idRequirement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="requirement.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${requirementInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'requirement', 'error')} required">
	<label for="requirement">
		<g:message code="requirement.requirement.label" default="Requirement" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="requirement" required="" value="${requirementInstance?.requirement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'descriptions', 'error')} required">
	<label for="descriptions">
		<g:message code="requirement.descriptions.label" default="Descriptions" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descriptions" required="" value="${requirementInstance?.descriptions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'stakeholderRegister', 'error')} ">
	<label for="stakeholderRegister">
		<g:message code="requirement.stakeholderRegister.label" default="Stakeholder Register" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${requirementInstance?.stakeholderRegister?}" var="s">
    <li><g:link controller="stakeholderRegister" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stakeholderRegister" action="create" params="['requirement.id': requirementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister')])}</g:link>
</li>
</ul>

</div>

