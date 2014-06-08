<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister" %>
<head>
    <ckeditor:resources/>
    <tooltip:resources/>
</head>


<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'projectName', 'error')} required">
    <label for="projectName">
        <g:message code="stakeholderRegister.projectName.label" default="Project Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${stakeholderRegisterInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'role', 'error')} required">
    <label for="role">
        <g:message code="stakeholderRegister.role.label" default="Role" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="role" name="role.id" from="${role}" optionKey="id" required="" value="${stakeholderRegisterInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'fullName', 'error')} required">
    <label for="fullName">
        <g:message code="stakeholderRegister.fullName.label" default="Full Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="fullName" required="" value="${stakeholderRegisterInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'designation', 'error')} ">
    <label for="designation">
        <g:message code="stakeholderRegister.designation.label" default="Designation" />

    </label>
    <tooltip:tip code="Degree or title of identified stakeholder">
        <g:textField name="designation" value="${stakeholderRegisterInstance?.designation}"/>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'department', 'error')} ">
    <label for="department">
        <g:message code="stakeholderRegister.department.label" default="Department" />

    </label>
    <tooltip:tip code="Working department of identified stakeholder">
        <g:textField name="department" value="${stakeholderRegisterInstance?.department}"/>
    </tooltip:tip>
</div>


<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="stakeholderRegister.email.label" default="Email" />
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${stakeholderRegisterInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'phone', 'error')} ">
    <label for="phone">
        <g:message code="stakeholderRegister.phone.label" default="Phone" />

    </label>
    <g:textField name="phone" value="${stakeholderRegisterInstance?.phone}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'stakeholderType', 'error')} ">
    <label for="stakeholderType">
        <g:message code="stakeholderRegister.stakeholderType.label" default="Stakeholder Type" />

    </label>
    <g:select name="stakeholderType" from="${stakeholderRegisterInstance.constraints.stakeholderType.inList}" value="${stakeholderRegisterInstance?.stakeholderType}" valueMessagePrefix="stakeholderRegister.stakeholderType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'communicationType', 'error')} required">
    <label for="communicationType">
        <g:message code="stakeholderRegister.communicationType.label" default="Communication Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="communicationType" name="communicationType.id" from="${communicationType}" optionKey="id" required="" value="${stakeholderRegisterInstance?.communicationType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'expectations', 'error')} ">
    <label for="expectations">
        <g:message code="stakeholderRegister.expectations.label" default="Expectations" />

    </label>
    <!--<g:textArea name="expectations" cols="40" rows="5" maxlength="2000" value="${stakeholderRegisterInstance?.expectations}"/>-->
    <br>
    <br>
    <tooltip:tip code="This section describes what stakeholder expects along the project">
        <ckeditor:editor name="expectations" height="200px" width="100%" toolbar="Full">
            ${stakeholderRegisterInstance?.expectations}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'influenceOnProjectOutcome', 'error')} ">
    <label for="influenceOnProjectOutcome">
        <g:message code="stakeholderRegister.influenceOnProjectOutcome.label" default="Influence On Project Outcome" />

    </label>
    <%--<g:textArea name="influenceOnProjectOutcome" cols="40" rows="5" maxlength="2000" value="${stakeholderRegisterInstance?.influenceOnProjectOutcome}"/>--%>
    <br>
    <br>
    <br>
    <tooltip:tip code="This section describes what stakeholder expects along the project">
        <ckeditor:editor name="influenceOnProjectOutcome" height="200px" width="100%" toolbar="Full">
            ${stakeholderRegisterInstance?.influenceOnProjectOutcome}
        </ckeditor:editor>
    </tooltip:tip>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRegisterInstance, field: 'image', 'error')} required">
    <label for="image">
        <g:message code="stakeholderRegister.image.label" default="Image" />
        <span class="required-indicator">*</span>
    </label>
    <input type="file" id="image" name="image" />
</div>

