
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stakeholderRegister.label', default: 'StakeholderRegister')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stakeholderRegister" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stakeholderRegister" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stakeholderRegister">
			
				<g:if test="${stakeholderRegisterInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="stakeholderRegister.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${stakeholderRegisterInstance?.projectName?.id}">${stakeholderRegisterInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="stakeholderRegister.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="stakeholderRoles" action="show" id="${stakeholderRegisterInstance?.role?.id}">${stakeholderRegisterInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.fullName}">
				<li class="fieldcontain">
					<span id="fullName-label" class="property-label"><g:message code="stakeholderRegister.fullName.label" default="Full Name" /></span>
					
						<span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${stakeholderRegisterInstance}" field="fullName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.designation}">
				<li class="fieldcontain">
					<span id="designation-label" class="property-label"><g:message code="stakeholderRegister.designation.label" default="Designation" /></span>
					
						<span class="property-value" aria-labelledby="designation-label"><g:fieldValue bean="${stakeholderRegisterInstance}" field="designation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="stakeholderRegister.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${stakeholderRegisterInstance}" field="department"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.stakeholderType}">
				<li class="fieldcontain">
					<span id="stakeholderType-label" class="property-label"><g:message code="stakeholderRegister.stakeholderType.label" default="Stakeholder Type" /></span>
					
						<span class="property-value" aria-labelledby="stakeholderType-label"><g:fieldValue bean="${stakeholderRegisterInstance}" field="stakeholderType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.communicationType}">
				<li class="fieldcontain">
					<span id="communicationType-label" class="property-label"><g:message code="stakeholderRegister.communicationType.label" default="Communication Type" /></span>
					
						<span class="property-value" aria-labelledby="communicationType-label"><g:link controller="communicationType" action="show" id="${stakeholderRegisterInstance?.communicationType?.id}">${stakeholderRegisterInstance?.communicationType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.expectations}">
				<li class="fieldcontain">
					<span id="expectations-label" class="property-label"><g:message code="stakeholderRegister.expectations.label" default="Expectations" /></span>
					
						<span class="property-value" aria-labelledby="expectations-label">${stakeholderRegisterInstance.expectations}</span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.influenceOnProjectOutcome}">
				<li class="fieldcontain">
					<span id="influenceOnProjectOutcome-label" class="property-label"><g:message code="stakeholderRegister.influenceOnProjectOutcome.label" default="Influence On Project Outcome" /></span>
					
						<span class="property-value" aria-labelledby="influenceOnProjectOutcome-label">${stakeholderRegisterInstance.influenceOnProjectOutcome}</span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="stakeholderRegister.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${stakeholderRegisterInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="stakeholderRegister.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${stakeholderRegisterInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="stakeholderRegister.image.label" default="Image" /></span>
                    <img src="${createLink(action:'displayAvatar', id:stakeholderRegisterInstance?.id)}" />
				</li>
				</g:if>
			
				<g:if test="${stakeholderRegisterInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="stakeholderRegister.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${stakeholderRegisterInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stakeholderRegisterInstance?.id}" />
					<g:link class="edit" action="edit" id="${stakeholderRegisterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
