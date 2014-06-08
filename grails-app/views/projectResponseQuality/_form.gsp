<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponseQuality" %>
<head>
    <resource:include components="slider" />
    <%--<richui:slider html:type="hidden" inputId="progress" inputName="progress" labels="20" step="5" value="${task?.progress}" min="0" max="100" buttons="false" />--%>
</head>


<div class="fieldcontain ${hasErrors(bean: projectResponseQualityInstance, field: 'projectCharter', 'error')} required">
	<label for="projectCharter">
		<g:message code="projectResponseQuality.projectCharter.label" default="Project Charter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectCharter" name="projectCharter.id" from="${namaProyek}" optionKey="id" required="" value="${projectResponseQualityInstance?.projectCharter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectResponseQualityInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="projectResponseQuality.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${stakeholder}" optionKey="id" required="" value="${projectResponseQualityInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectResponseQualityInstance, field: 'quality', 'error')} required">
	<label for="quality">
		<g:message code="projectResponseQuality.quality.label" default="Quality" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:field name="quality" value="${fieldValue(bean: projectResponseQualityInstance, field: 'quality')}" required=""/>--%>
    <br>
    <richui:slider html:type="hidden" inputId="progress" inputName="quality" snapOnDrag="true" changeOnDrag="true" tickMajor="2" tickMinor="1" labels="2" step="1" value="${projectResponseQualityInstance?.quality}" min="0" max="10" buttons="true" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectResponseQualityInstance, field: 'scope', 'error')} required">
	<label for="scope">
		<g:message code="projectResponseQuality.scope.label" default="Scope" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:field name="scope" value="${fieldValue(bean: projectResponseQualityInstance, field: 'scope')}" required=""/>--%>
    <br>
    <richui:slider html:type="hidden" inputId="progress" inputName="scope" snapOnDrag="true" changeOnDrag="true" tickMajor="2" tickMinor="1" labels="2" step="1" value="${projectResponseQualityInstance?.scope}" min="0" max="10" buttons="true" />
</div>

