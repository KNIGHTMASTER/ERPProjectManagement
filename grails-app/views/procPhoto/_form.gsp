<%@ page import="ProjectProcurementManagement.CloseProcurements.ProcPhoto" %>



<div class="fieldcontain ${hasErrors(bean: procPhotoInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="procPhoto.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.CloseProcurements.CloseProcurement.list()}" optionKey="id" required="" value="${procPhotoInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procPhotoInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="procPhoto.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" name="photo" />
</div>

