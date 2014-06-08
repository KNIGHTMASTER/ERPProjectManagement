<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.FeasibilityStudy" %>
<head xmlns="http://www.w3.org/1999/html">
    <ckeditor:resources/>
    <tooltip:resources/>
</head>



<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="feasibilityStudy.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal.list()}" optionKey="id" required="" value="${feasibilityStudyInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'executiveSummary', 'error')} ">
	<label for="executiveSummary">
		<g:message code="feasibilityStudy.executiveSummary.label" default="Executive Summary" />
		
	</label>
	<!--<g:textArea name="executiveSummary" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.executiveSummary}"/>-->
      <br />
      <br />
<tooltip:tip code="The executive summary provides an overview of the content contained in the feasibility study document">
    <ckeditor:editor name="executiveSummary" height="200px" width="100%" toolbar="Full">
	${feasibilityStudyInstance?.executiveSummary}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'descriptionOfProducts', 'error')} ">
	<label for="descriptionOfProducts">
		<g:message code="feasibilityStudy.descriptionOfProducts.label" default="Description Of Products" />
		
	</label>
	<!--<g:textArea name="descriptionOfProducts" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.descriptionOfProducts}"/>-->
        <br />
        <br />
<tooltip:tip code="This section provides a high level description of the products and/or services which are being considered as past of the feasibility study">
      <ckeditor:editor name="descriptionOfProducts" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.descriptionOfProducts}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'technologyConsiderations', 'error')} ">
	<label for="technologyConsiderations">
		<g:message code="feasibilityStudy.technologyConsiderations.label" default="Technology Considerations" />
		
	</label>
	<!--<g:textArea name="technologyConsiderations" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.technologyConsiderations}"/>-->
        <br />
        <br />
<tooltip:tip code="This section should explain any considerations the organization must make with regards to technology">
      <ckeditor:editor name="technologyConsiderations" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.technologyConsiderations}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'productMarketPlace', 'error')} ">
	<label for="productMarketPlace">
		<g:message code="feasibilityStudy.productMarketPlace.label" default="Product Market Place" />
		
	</label>
	<!--<g:textArea name="productMarketPlace" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.productMarketPlace}"/>-->
        <br />
        <br />
    <tooltip:tip code="This section describes the existing marketplace for the products and/or services the organization is considering">
      <ckeditor:editor name="productMarketPlace" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.productMarketPlace}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'marketingStrategy', 'error')} ">
	<label for="marketingStrategy">
		<g:message code="feasibilityStudy.marketingStrategy.label" default="Marketing Strategy" />
		
	</label>
	<!--<g:textArea name="marketingStrategy" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.marketingStrategy}"/>-->
        <br />
        <br />
<tooltip:tip code="This section provides a high level description of how the organization will market its product or service">
      <ckeditor:editor name="marketingStrategy" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.marketingStrategy}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'organizationAndStaffing', 'error')} ">
	<label for="organizationAndStaffing">
		<g:message code="feasibilityStudy.organizationAndStaffing.label" default="Organization And Staffing" />
		
	</label>
	<!--<g:textArea name="organizationAndStaffing" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.organizationAndStaffing}"/>-->
        <br />
        <br />
<tooltip:tip code="With many new products or services there may be a need for additional staffing or for an organization to restructure in order to accommodate the change">
      <ckeditor:editor name="organizationAndStaffing" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.organizationAndStaffing}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'schedule', 'error')} ">
	<label for="schedule">
		<g:message code="feasibilityStudy.schedule.label" default="Schedule" />
		
	</label>
	<!--<g:textArea name="schedule" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.schedule}"/>-->
        <br />
        <br />
<tooltip:tip code="This section is intended to provide a high level framework for implementation of the product or service being considered">
      <ckeditor:editor name="schedule" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.schedule}
      </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'financialProjections', 'error')} ">
	<label for="financialProjections">
		<g:message code="feasibilityStudy.financialProjections.label" default="Financial Projections" />
		
	</label>
	<!--<g:textArea name="financialProjections" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.financialProjections}"/>-->
        <br />
        <br />
      <ckeditor:editor name="financialProjections" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.financialProjections}
      </ckeditor:editor>      
</div>

<div class="fieldcontain ${hasErrors(bean: feasibilityStudyInstance, field: 'recommendations', 'error')} ">
	<label for="recommendations">
		<g:message code="feasibilityStudy.recommendations.label" default="Recommendations" />
		
	</label>
	<!--<g:textArea name="recommendations" cols="40" rows="5" maxlength="2000" value="${feasibilityStudyInstance?.recommendations}"/>-->
        <br />
        <br />
      <ckeditor:editor name="recommendations" height="200px" width="100%" toolbar="Full">        
	${feasibilityStudyInstance?.recommendations}
      </ckeditor:editor>      
</div>

