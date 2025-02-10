<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.sevanet.model.Politician" %>
    
<%
Politician poli =  (Politician)session.getAttribute("politician");

if(poli == null){
	response.sendRedirect("politiciansessionexpage");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SevaNet</title>
</head>
<body>
<%@include file="politiciannavbar.jsp" %>

  <h4 align="center" style="color:red">
  <c:out value="${message}"></c:out>
  </h4>
<h3 style="text-align: center;"><u>Update Politician Profile</u></h3>

<div class="form-container">
    <form method="post" action="updatepoliticianprofile">
        <table>
            <tr>
                <td><label for="pid">Politician ID</label></td>
                <td><input type="number" id="pid" name="pid" readonly value="<%= poli.getId() %>" required/></td>
            </tr>
            <tr>
                <td><label for="pname">Name</label></td>
                <td><input type="text" id="pname" name="pname" value="<%= poli.getName()%>"required/></td>
            </tr>
            <tr>
                <td><label for="pparty">Party</label></td>
                <td><input type="text" id="pparty" name="pparty" value="<%= poli.getParty() %>"required/></td>
            </tr>
            <tr>
                <td><label for="pconstituency">Constituency</label></td>
                <td><input type="text" id="pconstituency" name="pconstituency" value="<%= poli.getConstituency() %>" required/></td>
            </tr>
            <tr>
                <td><label for="pposition">Position</label></td>
                <td><input type="text" id="pposition" name="pposition" value="<%= poli.getPosition() %>" required/></td>
            </tr>
            <tr>
                <td><label for="pcontact_info">Contact Info</label></td>
                <td><input type="text" id="pcontact_info" name="pcontact_info" value="<%= poli.getContactInfo()%>" required/></td>
            </tr>
            <tr>
                <td><label for="ppassword">Password</label></td>
                <td><input type="password" id="ppassword" name="ppassword" value="<%= poli.getPassword() %>" required/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="Update"/>
                    <input type="reset" value="Clear"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>