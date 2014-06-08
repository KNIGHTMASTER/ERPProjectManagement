<%@ page import="ProjectTimeManagement.Utility.Coba" %>



<div class="fieldcontain ${hasErrors(bean: cobaInstance, field: 'ponum', 'error')} required">
	<label for="ponum">
		<g:message code="coba.ponum.label" default="Ponum" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ponum" type="number" value="${cobaInstance.ponum}" required=""/>
</div>

