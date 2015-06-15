<%@ page import="ProjectTimeManagement.Utility.Lagi" %>



<div class="fieldcontain ${hasErrors(bean: lagiInstance, field: 'idEmp', 'error')} required">
	<label for="idEmp">
		<g:message code="lagi.idEmp.label" default="Id Emp" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idEmp" type="number" value="${lagiInstance.idEmp}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: lagiInstance, field: 'pro', 'error')} ">
	<label for="pro">
		<g:message code="lagi.pro.label" default="Pro" />
		
	</label>
	<g:textField name="pro" value="${lagiInstance?.pro}"/>
</div>

