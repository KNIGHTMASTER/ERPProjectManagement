<%@ page import="ProjectProcurementManagement.CloseProcurements.CloseProcurement" %>



<div class="fieldcontain ${hasErrors(bean: closeProcurementInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="closeProcurement.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${closeProcurementInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: closeProcurementInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="closeProcurement.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.PlanProcurement.Approval.list()}" optionKey="id" required="" value="${closeProcurementInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: closeProcurementInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="closeProcurement.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${closeProcurementInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: closeProcurementInstance, field: 'complete', 'error')} ">
	<label for="complete">
		<g:message code="closeProcurement.complete.label" default="Complete" />
		
	</label>
	<g:checkBox name="complete" value="${closeProcurementInstance?.complete}" />
</div>

<div class="fieldcontain ${hasErrors(bean: closeProcurementInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="closeProcurement.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="500" value="${closeProcurementInstance?.comment}"/>
</div>

