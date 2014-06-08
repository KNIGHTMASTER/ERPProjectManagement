<%@ page import="ProjectHumanResourceManagement.Salary" %>



<div class="fieldcontain ${hasErrors(bean: salaryInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="salary.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${salaryInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salaryInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="salary.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" value="${fieldValue(bean: salaryInstance, field: 'value')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salaryInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="salary.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${salaryInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: salaryInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="salary.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${salaryInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: salaryInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="salary.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${salaryInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: salaryInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="salary.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="500" value="${salaryInstance?.comment}"/>
</div>

