
<%@ page import="ProjectCostManagement.EstimateCost.ActivityCostEstimates" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityCostEstimates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activityCostEstimates" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                           <g:hiddenField name="basic" value="${basic=0}"/>
                           <g:each in="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}"  var="wbs">
                                <label> </label>
                                <label><strong style="color: black"><b>Milestone ${wbs.milestoneName}</b></strong></label>
                                <table>
				<thead>
					<tr>
					
						<th><g:message code="activityCostEstimates.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="resource" title="${message(code: 'activityCostEstimates.resource.label', default: 'Resource')}" />
					
						<g:sortableColumn property="directCosts" title="${message(code: 'activityCostEstimates.directCosts.label', default: 'Direct Costs')}" />
					
						<g:sortableColumn property="indirectCosts" title="${message(code: 'activityCostEstimates.indirectCosts.label', default: 'Indirect Costs')}" />
					
						<g:sortableColumn property="reserve" title="${message(code: 'activityCostEstimates.reserve.label', default: 'Reserve')}" />
					
                                                <g:sortableColumn property="estimate" title="${message(code: 'activityCostEstimates.estimate.label', default: 'Estimate')}" />
					
					</tr>
				</thead>
                                <g:hiddenField name="tot" value="${tot=0}"/> 
                                <g:each in="${ProjectTimeManagement.DefineActivity.Activity.findAllByIdMilestone(wbs)}"  var="act">
                                          <% ce = ProjectTimeManagement.DefineActivity.Activity.get(act.id) 
                                          ace = ProjectCostManagement.EstimateCost.ActivityCostEstimates.executeQuery("select t from ActivityCostEstimates t where t.activity=${ce.id}")%> 
                   
				<tbody>
                                          <g:each in="${ace}" status="i" var="aces">
                                               <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                  
                                                  <td><g:link action="show" id="${aces.id}">${aces.activity.taskName}</g:link></td>

                                                  <td>${aces.resource}</td>

                                                  <td>${aces.directCosts}</td>

                                                  <td>${aces.indirectCosts}</td>

                                                  <td>${aces.reserve}</td>

                                                  <td>${aces.estimate}</td>
                                                  <g:hiddenField name="tot" value="${tot+=aces.estimate}"/>
                                              </tr>
                                          </g:each>
				</tbody>
                            </g:each>
                                <g:hiddenField name="basic" value="${basic+=tot}"/>
			</table>
                           <label style="text-align: right;"><b>Total Estimate = Rp. ${tot} </b></label>
                        </g:each>
                        <div class="pagination">
			</div>
		</div>
	</body>
</html>