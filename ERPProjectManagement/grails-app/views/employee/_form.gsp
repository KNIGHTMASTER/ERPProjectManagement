<%@ page import="ProjectHumanResourceManagement.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="employee.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${employeeInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'idEmployee', 'error')} required">
	<label for="idEmployee">
		<g:message code="employee.idEmployee.label" default="Id Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idEmployee" required="" value="${employeeInstance?.idEmployee}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${employeeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeeType', 'error')} required">
	<label for="employeeType">
		<g:message code="employee.employeeType.label" default="Employee Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employeeType" name="employeeType.id" from="${ProjectHumanResourceManagement.EmployeeType.list()}" optionKey="id" required="" value="${employeeInstance?.employeeType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="employee.sex.label" default="Sex" />
		
	</label>
	<g:select name="sex" from="${employeeInstance.constraints.sex.inList}" value="${employeeInstance?.sex}" valueMessagePrefix="employee.sex" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="employee.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${employeeInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'bornPlace', 'error')} required">
	<label for="bornPlace">
		<g:message code="employee.bornPlace.label" default="Born Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bornPlace" required="" value="${employeeInstance?.bornPlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'birthday', 'error')} ">
	<label for="birthday">
		<g:message code="employee.birthday.label" default="Birthday" />
		
	</label>
	<g:datePicker name="birthday" precision="day"  value="${employeeInstance?.birthday}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="employee.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${employeeInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${employeeInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="employee.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${employeeInstance?.website}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="employee.photo.label" default="Photo" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.photo?}" var="p">
    <li><g:link controller="emphoto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="emphoto" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emphoto.label', default: 'Emphoto')])}</g:link>
</li>
</ul>

</div>

