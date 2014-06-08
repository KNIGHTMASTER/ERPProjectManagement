<%@ page import="ProjectCommunicationManagement.ReportPerformance.UserAvatar" %>



<div class="fieldcontain ${hasErrors(bean: userAvatarInstance, field: 'avatar', 'error')} ">
	<label for="avatar">
		<g:message code="userAvatar.avatar.label" default="Avatar" />
		
	</label>
	<input type="file" id="avatar" name="avatar" />
</div>

<div class="fieldcontain ${hasErrors(bean: userAvatarInstance, field: 'avatarType', 'error')} ">
	<label for="avatarType">
		<g:message code="userAvatar.avatarType.label" default="Avatar Type" />
		
	</label>
	<g:textField name="avatarType" value="${userAvatarInstance?.avatarType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userAvatarInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="userAvatar.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" value="${userAvatarInstance?.userId}"/>
</div>

