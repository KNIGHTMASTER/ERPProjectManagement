<%@ page import="ProjectHumanResourceManagement.EmployeeType" %>



<div class="fieldcontain ${hasErrors(bean: employeeTypeInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="employeeType.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${employeeTypeInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="employeeType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${employeeTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeTypeInstance, field: 'employee', 'error')} ">
	<label for="employee">
		<g:message code="employeeType.employee.label" default="Employee" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeTypeInstance?.employee?}" var="e">
    <li><g:link controller="employee" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="employee" action="create" params="['employeeType.id': employeeTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'employee.label', default: 'Employee')])}</g:link>
</li>
</ul>

</div>

