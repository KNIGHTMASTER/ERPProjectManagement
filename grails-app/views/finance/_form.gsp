<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Finance" %>



<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'ac', 'error')} required">
	<label for="ac">
		<g:message code="finance.ac.label" default="Ac" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ac" type="number" value="${financeInstance.ac}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'ev', 'error')} required">
	<label for="ev">
		<g:message code="finance.ev.label" default="Ev" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ev" type="number" value="${financeInstance.ev}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'evTotal', 'error')} required">
	<label for="evTotal">
		<g:message code="finance.evTotal.label" default="Ev Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="evTotal" type="number" value="${financeInstance.evTotal}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'income', 'error')} required">
	<label for="income">
		<g:message code="finance.income.label" default="Income" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="income" type="number" value="${financeInstance.income}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'netIncome', 'error')} required">
	<label for="netIncome">
		<g:message code="finance.netIncome.label" default="Net Income" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="netIncome" type="number" value="${financeInstance.netIncome}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'pv', 'error')} required">
	<label for="pv">
		<g:message code="finance.pv.label" default="Pv" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pv" type="number" value="${financeInstance.pv}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'sales', 'error')} required">
	<label for="sales">
		<g:message code="finance.sales.label" default="Sales" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sales" type="number" value="${financeInstance.sales}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'shareHolderQuality', 'error')} required">
	<label for="shareHolderQuality">
		<g:message code="finance.shareHolderQuality.label" default="Share Holder Quality" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="shareHolderQuality" type="number" value="${financeInstance.shareHolderQuality}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeInstance, field: 'totalAssets', 'error')} required">
	<label for="totalAssets">
		<g:message code="finance.totalAssets.label" default="Total Assets" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalAssets" type="number" value="${financeInstance.totalAssets}" required=""/>
</div>

