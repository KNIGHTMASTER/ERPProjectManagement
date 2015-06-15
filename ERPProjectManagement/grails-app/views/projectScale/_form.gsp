<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectScale" %>



<div class="fieldcontain ${hasErrors(bean: projectScaleInstance, field: 'scale', 'error')} ">
	<label for="scale">
		<g:message code="projectScale.scale.label" default="Scale" />
		
	</label>
	<g:textField name="scale" value="${projectScaleInstance?.scale}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectScaleInstance, field: 'minPrice', 'error')} required">
	<label for="minPrice">
		<g:message code="projectScale.minPrice.label" default="Min Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minPrice" value="${fieldValue(bean: projectScaleInstance, field: 'minPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectScaleInstance, field: 'maxPrice', 'error')} required">
	<label for="maxPrice">
		<g:message code="projectScale.maxPrice.label" default="Max Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxPrice" value="${fieldValue(bean: projectScaleInstance, field: 'maxPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectScaleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="projectScale.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${projectScaleInstance?.description}"/>
</div>

