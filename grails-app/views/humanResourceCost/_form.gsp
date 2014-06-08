<%@ page import="ProjectCostManagement.DetermineBudget.HumanResourceCost" %>



<div class="fieldcontain ${hasErrors(bean: humanResourceCostInstance, field: 'activityCost', 'error')} required">
	<label for="activityCost">
		<g:message code="humanResourceCost.activityCost.label" default="Activity Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activityCost" name="activityCost.id" from="${ProjectCostManagement.DetermineBudget.ActivityCost.list()}" optionKey="id" required="" value="${humanResourceCostInstance?.activityCost?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: humanResourceCostInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="humanResourceCost.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${humanResourceCostInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: humanResourceCostInstance, field: 'idx', 'error')} required">
	<label for="idx">
		<g:message code="humanResourceCost.idx.label" default="Idx" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idx" required="" value="${humanResourceCostInstance?.idx}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: humanResourceCostInstance, field: 'approve', 'error')} ">
	<label for="approve">
		<g:message code="humanResourceCost.approve.label" default="Approve" />
		
	</label>
	<g:checkBox name="approve" value="${humanResourceCostInstance?.approve}" />
</div>

<div class="fieldcontain ${hasErrors(bean: humanResourceCostInstance, field: 'salaryHumanResource', 'error')} ">
	<label for="salaryHumanResource">
		<g:message code="humanResourceCost.salaryHumanResource.label" default="Salary Human Resource" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${humanResourceCostInstance?.salaryHumanResource?}" var="s">
    <li><g:link controller="salaryHumanResource" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="salaryHumanResource" action="create" params="['humanResourceCost.id': humanResourceCostInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource')])}</g:link>
</li>
</ul>

</div>

