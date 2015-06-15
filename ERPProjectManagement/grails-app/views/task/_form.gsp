<%@ page import="ProjectTimeManagement.DefineActivity.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'idProject', 'error')} required">
	<label for="idProject">
		<g:message code="task.idProject.label" default="Id Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idProject" name="idProject.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${taskInstance?.idProject?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskName', 'error')} required">
	<label for="taskName">
		<g:message code="task.taskName.label" default="Task Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="taskName" required="" value="${taskInstance?.taskName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'descriptionOfWork', 'error')} ">
	<label for="descriptionOfWork">
		<g:message code="task.descriptionOfWork.label" default="Description Of Work" />
		
	</label>
	<g:textArea name="descriptionOfWork" cols="40" rows="5" maxlength="1000" value="${taskInstance?.descriptionOfWork}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'activity', 'error')} ">
	<label for="activity">
		<g:message code="task.activity.label" default="Activity" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${taskInstance?.activity?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

