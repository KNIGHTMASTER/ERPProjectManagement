<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PlaceOfPerformance" %>



<div class="fieldcontain ${hasErrors(bean: placeOfPerformanceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="placeOfPerformance.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${placeOfPerformanceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeOfPerformanceInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="placeOfPerformance.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${placeOfPerformanceInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeOfPerformanceInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="placeOfPerformance.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${placeOfPerformanceInstance?.description}"/>
</div>

