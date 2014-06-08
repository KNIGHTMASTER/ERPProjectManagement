<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.LearningAndGrowth" %>



<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'dayLoss', 'error')} required">
	<label for="dayLoss">
		<g:message code="learningAndGrowth.dayLoss.label" default="Day Loss" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dayLoss" type="number" value="${learningAndGrowthInstance.dayLoss}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'nActivity', 'error')} required">
	<label for="nActivity">
		<g:message code="learningAndGrowth.nActivity.label" default="NA ctivity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nActivity" type="number" value="${learningAndGrowthInstance.nActivity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'nEmployee', 'error')} required">
	<label for="nEmployee">
		<g:message code="learningAndGrowth.nEmployee.label" default="NE mployee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nEmployee" type="number" value="${learningAndGrowthInstance.nEmployee}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'nTurnOver', 'error')} required">
	<label for="nTurnOver">
		<g:message code="learningAndGrowth.nTurnOver.label" default="NT urn Over" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nTurnOver" type="number" value="${learningAndGrowthInstance.nTurnOver}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'ncr', 'error')} required">
	<label for="ncr">
		<g:message code="learningAndGrowth.ncr.label" default="Ncr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ncr" type="number" value="${learningAndGrowthInstance.ncr}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'nr', 'error')} required">
	<label for="nr">
		<g:message code="learningAndGrowth.nr.label" default="Nr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nr" type="number" value="${learningAndGrowthInstance.nr}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'nsr', 'error')} required">
	<label for="nsr">
		<g:message code="learningAndGrowth.nsr.label" default="Nsr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nsr" type="number" value="${learningAndGrowthInstance.nsr}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'ntr', 'error')} required">
	<label for="ntr">
		<g:message code="learningAndGrowth.ntr.label" default="Ntr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ntr" type="number" value="${learningAndGrowthInstance.ntr}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: learningAndGrowthInstance, field: 'totalDay', 'error')} required">
	<label for="totalDay">
		<g:message code="learningAndGrowth.totalDay.label" default="Total Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalDay" type="number" value="${learningAndGrowthInstance.totalDay}" required=""/>
</div>

