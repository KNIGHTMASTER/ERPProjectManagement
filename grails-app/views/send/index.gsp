<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12/17/13
  Time: 10:17 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

    <g:form action="sendMail">
        Your email addres : <input name="email"/><br />
        Your Name : <input name="userName" /><br />
        Message : <g:textArea name="message" />
        <input type="submit">
    </g:form>
</body>
</html>