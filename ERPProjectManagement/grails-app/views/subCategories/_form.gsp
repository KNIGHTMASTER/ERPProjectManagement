<%@ page import="ProjectRiskManagement.Planning.SubCategories" %>



<div class="fieldcontain ${hasErrors(bean: subCategoriesInstance, field: 'subCategories', 'error')} required">
	<label for="subCategories">
		<g:message code="subCategories.subCategories.label" default="Sub Categories" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subCategories" required="" value="${subCategoriesInstance?.subCategories}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCategoriesInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="subCategories.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${subCategoriesInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCategoriesInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="subCategories.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${subCategoriesInstance.ranking}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCategoriesInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="subCategories.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${subCategoriesInstance?.description}"/>
</div>

