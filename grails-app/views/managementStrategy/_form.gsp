<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.ManagementStrategy" %>



<div class="fieldcontain ${hasErrors(bean: managementStrategyInstance, field: 'key', 'error')} required">
	<label for="key">
		<g:message code="managementStrategy.key.label" default="Key" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="key" required="" value="${managementStrategyInstance?.key}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementStrategyInstance, field: 'organization', 'error')} required">
	<label for="organization">
		<g:message code="managementStrategy.organization.label" default="Organization" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="organization" required="" value="${managementStrategyInstance?.organization}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementStrategyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="managementStrategy.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${managementStrategyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementStrategyInstance, field: 'power', 'error')} required">
	<label for="power">
		<g:message code="managementStrategy.power.label" default="Power" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="power" required="" value="${managementStrategyInstance?.power}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementStrategyInstance, field: 'interest', 'error')} required">
	<label for="interest">
		<g:message code="managementStrategy.interest.label" default="Interest" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interest" required="" value="${managementStrategyInstance?.interest}"/>
</div>

