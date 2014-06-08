<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponses" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'projectResponses.label', default: 'ProjectResponses')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-projectResponses" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-projectResponses" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list projectResponses">

        <g:if test="${projectResponsesInstance?.projectCharter}">
            <li class="fieldcontain">
                <span id="projectCharter-label" class="property-label"><g:message
                        code="projectResponses.projectCharter.label" default="Project Charter"/></span>

                <span class="property-value" aria-labelledby="projectCharter-label"><g:link controller="projectCharter"
                                                                                            action="show"
                                                                                            id="${projectResponsesInstance?.projectCharter?.id}">${projectResponsesInstance?.projectCharter?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${projectResponsesInstance?.stakeholder}">
            <li class="fieldcontain">
                <span id="stakeholder-label" class="property-label"><g:message code="projectResponses.stakeholder.label"
                                                                               default="Stakeholder"/></span>

                <span class="property-value" aria-labelledby="stakeholder-label"><g:link
                        controller="stakeholderRegister" action="show"
                        id="${projectResponsesInstance?.stakeholder?.id}">${projectResponsesInstance?.stakeholder?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${projectResponsesInstance?.cost}">
            <li class="fieldcontain">
                <span id="cost-label" class="property-label"><g:message code="projectResponses.cost.label"
                                                                        default="Cost"/></span>

                <span class="property-value" aria-labelledby="cost-label"><g:fieldValue
                        bean="${projectResponsesInstance}" field="cost"/></span>

            </li>
        </g:if>

        <g:if test="${projectResponsesInstance?.time}">
            <li class="fieldcontain">
                <span id="time-label" class="property-label"><g:message code="projectResponses.time.label"
                                                                        default="Time"/></span>

                <span class="property-value" aria-labelledby="time-label"><g:fieldValue
                        bean="${projectResponsesInstance}" field="time"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${projectResponsesInstance?.id}"/>
            <g:link class="edit" action="edit" id="${projectResponsesInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
