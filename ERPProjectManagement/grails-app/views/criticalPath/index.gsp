<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main">
  <title>Critical Path</title>
</head>
<body>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="/ERPProjectManagement/schedule"><g:message code="default.home.label"/></a></li>
    </ul>
  </div>

  <div class="content scaffold-create" role="main">
    <g:if test="${criticalPaths != null && criticalPaths.keySet().size() > 0}">
      <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
      </g:if>

      <g:each in="${criticalPaths.keySet()}" var="project">
        <h1>${project.projectName}</h1>
        <div class="critical-paths">
          <g:each in="${criticalPaths[project]}" status="i" var="result">
            <g:if test="${result.isCritical()}">
              <div class="activity">${result.name}</div>
              <div class="activity">${result.cost}</div>
              <g:if test="${i != criticalPaths[project].size() - 1}">
                <div class="arrow">&rarr;</div>
              </g:if>
            </g:if>
          </g:each>
          <div class="arrow">&nbsp;=&nbsp;</div>
          <div class="activity">${totalCPs[project]}</div>
        </div>
      </g:each>

    </div>
    </g:if>
  </div>

</body>
</html>