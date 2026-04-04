<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <!-- Header -->
 <%@ include file="../common/header.jsp" %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h1>マネージャー一覧</h1>
	<table border="1">
		<thead>
			<tr>
				<td>ID</td>
				<td>Members Username</td>	
				<td>Mebers LastName</td>
				<td>mebers FirstName</td>
				<td>Mebers Birthday</td>
				<td>Mebers Address</td>
			</tr>
		</thead>
	<tbody>
    <c:forEach items="${manager1}" var="c">
        <tr>
            <td>${c.id}</td>
            <td>${c.username}</td>
            <td>${c.lastName}</td>
            <td>${c.firstName}</td>
            <td>${c.birthday}</td>
            <td>${c.address}</td>
        </tr>
    </c:forEach>
</tbody>
</table>
<%@ include file="../common/footer.jsp" %>
