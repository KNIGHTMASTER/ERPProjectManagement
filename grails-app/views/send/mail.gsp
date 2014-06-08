<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12/18/13
  Time: 4:17 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

Thank you ${name}using grails mail

${message}<text:newLine/>
<text:newLine/>
<g:each in="${(1..10)}">
    ${it}
</g:each>
<text:newLine/>
</body>
</html>