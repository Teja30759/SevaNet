<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title> Success</title>

</head>
<body>
<%@include file="mainnavbar.jsp" %>

<div class="card">
    <c:out value="${message}"></c:out>
    <br><br>
    <a href="reportissuepage" ">Add Again<a>
</div>
</body>
</html>