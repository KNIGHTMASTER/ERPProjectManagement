<%@ page import="ProjectRiskManagement.Planning.RiskCategories" %>



<div class="fieldcontain ${hasErrors(bean: riskCategoriesInstance, field: 'projectCharter', 'error')} ">
	<label for="projectCharter">
		<g:message code="riskCategories.projectCharter.label" default="Project Charter" />
		
	</label>
	<g:select id="projectCharter" name="projectCharter.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" value="${riskCategoriesInstance?.projectCharter?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: riskCategoriesInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="riskCategories.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select name="riskCategories" from="${riskCategoriesInstance.constraints.riskCategories.inList}" value="${riskCategoriesInstance?.riskCategories}" valueMessagePrefix="riskCategories.riskCategories" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: riskCategoriesInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="riskCategories.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${riskCategoriesInstance.ranking}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: riskCategoriesInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="riskCategories.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${riskCategoriesInstance?.description}"/>
</div>

