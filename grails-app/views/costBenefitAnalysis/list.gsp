
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.CostBenefitAnalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-costBenefitAnalysis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-costBenefitAnalysis" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                    <%--<br />
                    <g:form>
                      Filter Project : <g:select name="keyWord" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" keys="${proyekIdsList}"/>
                      <g:actionSubmit value="Filter" action="list" />
                    </g:form>--%>
                        
			<table>
				<thead>
					<tr>
					
						<th><g:message code="costBenefitAnalysis.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="actionAnalysis" title="${message(code: 'costBenefitAnalysis.actionAnalysis.label', default: 'Action Analysis')}" />
					
						<g:sortableColumn property="actionType" title="${message(code: 'costBenefitAnalysis.actionType.label', default: 'Action Type')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'costBenefitAnalysis.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="firstYearCost" title="${message(code: 'costBenefitAnalysis.firstYearCost.label', default: 'First Year Cost')}" />
					
						<!--<g:sortableColumn property="proyekid" title="/${message(code: 'costBenefitAnalysis.proyekid.label', default: 'Proyekid')}" />-->
					
					</tr>
				</thead>
				<tbody>
                                <g:hiddenField name="nfys" value="${nfys=0}"/>                                  
				<g:each in="${costBenefitAnalysisInstanceList}" status="i" var="costBenefitAnalysisInstance">                                        
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${costBenefitAnalysisInstance.id}">${fieldValue(bean: costBenefitAnalysisInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: costBenefitAnalysisInstance, field: "actionAnalysis")}</td>
					
						<td>${fieldValue(bean: costBenefitAnalysisInstance, field: "actionType")}</td>
					
						<td>${fieldValue(bean: costBenefitAnalysisInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: costBenefitAnalysisInstance, field: "firstYearCost")}</td>
					
						<!--<td>$/{fieldValue(bean: costBenefitAnalysisInstance, field: "proyekid")}</td>-->
					
					</tr>
                                            <g:hiddenField name="nfys" value="${nfys+=costBenefitAnalysisInstance.firstYearCost}"/>
				</g:each>
				</tbody>
			</table>
                        <label style="text-align: right; color: green"><strong>Total Net First Year Savings : IDR ${nfys} </strong></label>
			<div class="pagination">
				<g:paginate total="${costBenefitAnalysisInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
