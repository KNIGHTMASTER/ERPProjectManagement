<%@ page import="ProjectTimeManagement.Utility.Widget" %>



<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="widget.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="project" required="" value="${widgetInstance?.project}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: widgetInstance, field: 'pixes', 'error')} ">
	<label for="pixes">
		<g:message code="widget.pixes.label" default="Pixes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${widgetInstance?.pixes?}" var="p">
    <li><g:link controller="pix" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pix" action="create" params="['widget.id': widgetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pix.label', default: 'Pix')])}</g:link>
</li>
</ul>

</div>

