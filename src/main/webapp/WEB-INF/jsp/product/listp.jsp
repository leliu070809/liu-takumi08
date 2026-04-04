<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <!-- Header -->
 <%@ include file="../common/header.jsp" %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h1>Product 一覧</h1>
	<table border="1">
		<thead>
			<tr>
				<td>ID</td>
				<td>ProductName</td>	
				<td>Price</td>
				<td>CategoryId</td>
			</tr>
		</thead>
		
	<tbody>
    <c:forEach items="${products}" var="c">
        <tr>
            <td>${c.id}</td>
            <td>${c.productName}</td>
            <td>${c.price}</td>
            <td>${c.categoryId}</td>
            
        </tr>
    </c:forEach>
</tbody>
</table>
<%@ include file="../common/footer.jsp" %>