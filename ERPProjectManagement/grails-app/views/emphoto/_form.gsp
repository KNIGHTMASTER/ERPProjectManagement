<%@ page import="ProjectHumanResourceManagement.Emphoto" %>



<div class="fieldcontain ${hasErrors(bean: emphotoInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="emphoto.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${emphotoInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emphotoInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="emphoto.photo.label" default="Photo" />
		
	</label>
	<input type="file" id="photo" name="photo" />
</div>

