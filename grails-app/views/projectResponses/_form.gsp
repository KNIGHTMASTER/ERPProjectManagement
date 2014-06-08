<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponses" %>
<head>
    <resource:include components="slider" />
    <%--<richui:slider html:type="hidden" inputId="progress" inputName="progress" labels="20" step="5" value="${task?.progress}" min="0" max="100" buttons="false" />--%>
</head>


<div class="fieldcontain ${hasErrors(bean: projectResponsesInstance, field: 'projectCharter', 'error')} required">
    <label for="projectCharter">
        <g:message code="projectResponses.projectCharter.label" default="Project Charter"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="projectCharter" name="projectCharter.id"
              from="${namaProyek}" optionKey="id"
              required="" value="${projectResponsesInstance?.projectCharter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectResponsesInstance, field: 'stakeholder', 'error')} required">
    <label for="stakeholder">
        <g:message code="projectResponses.stakeholder.label" default="Stakeholder"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="stakeholder" name="stakeholder.id"
              from="${stakeholder}" optionKey="id"
              required="" value="${projectResponsesInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectResponsesInstance, field: 'cost', 'error')} required">
    <label for="cost">
        <g:message code="projectResponses.cost.label" default="Cost"/>
        <span class="required-indicator">*</span>
    </label>
    <%--<g:field name="cost" value="${fieldValue(bean: projectResponsesInstance, field: 'cost')}" required=""/>--%>
    <br>
    <richui:slider html:type="hidden" inputId="progress" inputName="cost" snapOnDrag="true" changeOnDrag="true" tickMajor="2" tickMinor="1" labels="2" step="1" value="${projectResponsesInstance?.cost}" min="0" max="10" buttons="true" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectResponsesInstance, field: 'time', 'error')} required">
    <label for="time">
        <g:message code="projectResponses.time.label" default="Time"/>
        <span class="required-indicator">*</span>
    </label>
    <%--<g:field name="time" value="${fieldValue(bean: projectResponsesInstance, field: 'time')}" required=""/>--%>
    <br>
    <richui:slider html:type="hidden"  inputName="time" snapOnDrag="true" changeOnDrag="true" tickMajor="2" tickMinor="1" labels="2" step="1" value="${projectResponsesInstance?.time}" min="0" max="10" buttons="true" />
</div>

