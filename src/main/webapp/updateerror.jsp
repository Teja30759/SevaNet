<%@page import="com.klef.jfsd.springboot.sevanet.model.Politician" %>
    
<%
Politician poli =  (Politician)session.getAttribute("politician");

if(poli == null){
	response.sendRedirect("politiciansessionexpage");
	return;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Updation Failed</title>
</head>
<body>

<h1>Profile Updation Failed</h1>
<a href="updateprofilepage">Update Again</a>
</body>
</html>