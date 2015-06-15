<%@ page import="ProjectTimeManagement.Utility.Pix" %>



<div class="fieldcontain ${hasErrors(bean: pixInstance, field: 'widget', 'error')} required">
	<label for="widget">
		<g:message code="pix.widget.label" default="Widget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="widget" name="widget.id" from="${ProjectTimeManagement.Utility.Widget.list()}" optionKey="id" required="" value="${pixInstance?.widget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pixInstance, field: 'mile', 'error')} required">
	<label for="mile">
		<g:message code="pix.mile.label" default="Mile" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mile" required="" value="${pixInstance?.mile}"/>
</div>

