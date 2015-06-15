<%@ page import="ProjectTimeManagement.EstimateResourceActivity.ResourcesCalendar" %>



<div class="fieldcontain ${hasErrors(bean: resourcesCalendarInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="resourcesCalendar.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${resourcesCalendarInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourcesCalendarInstance, field: 'activeDate', 'error')} required">
	<label for="activeDate">
		<g:message code="resourcesCalendar.activeDate.label" default="Active Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="activeDate" precision="day"  value="${resourcesCalendarInstance?.activeDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: resourcesCalendarInstance, field: 'inactiveDate', 'error')} required">
	<label for="inactiveDate">
		<g:message code="resourcesCalendar.inactiveDate.label" default="Inactive Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inactiveDate" precision="day"  value="${resourcesCalendarInstance?.inactiveDate}"  />
</div>

