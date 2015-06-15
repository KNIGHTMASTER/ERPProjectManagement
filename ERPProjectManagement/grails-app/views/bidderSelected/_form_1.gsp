<%@ page import="ProjectProcurementManagement.ConductProcurements.BidderSelected" %>



<div class="fieldcontain ${hasErrors(bean: bidderSelectedInstance, field: 'vendorName', 'error')} required">
	<label for="vendorName">
		<g:message code="bidderSelected.vendorName.label" default="Vendor Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendorName" name="vendorName.id" from="${ProjectProcurementManagement.ConductProcurements.VendorRegister.list()}" optionKey="id" required="" value="${bidderSelectedInstance?.vendorName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidderSelectedInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="bidderSelected.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.PlanProcurement.Approval.list()}" optionKey="id" required="" value="${bidderSelectedInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidderSelectedInstance, field: 'dateSelected', 'error')} required">
	<label for="dateSelected">
		<g:message code="bidderSelected.dateSelected.label" default="Date Selected" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateSelected" precision="day"  value="${bidderSelectedInstance?.dateSelected}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bidderSelectedInstance, field: 'bidderType', 'error')} ">
	<label for="bidderType">
		<g:message code="bidderSelected.bidderType.label" default="Bidder Type" />
		
	</label>
	<g:select name="bidderType" from="${bidderSelectedInstance.constraints.bidderType.inList}" value="${bidderSelectedInstance?.bidderType}" valueMessagePrefix="bidderSelected.bidderType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidderSelectedInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="bidderSelected.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="500" value="${bidderSelectedInstance?.note}"/>
</div>

