<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <!-- Header -->
 <%@ include file="../common/header.jsp" %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ一覧</title>
</head>
<body>
	<h1>カテゴリ一覧画面</h1>
	<a class="btn" href="./create">新規登録</a>
	
	<table border="1">
		<thead>
			<tr>
				<td>ID</td>
				<td>Category name</td>
				<td>Category desc</td>
			</tr>
		</thead>
	<tbody>
	<style>
	.red{color:red}
	</style>
    <c:forEach items="${categories}" var="c">
        <tr <c:if test='${c.id>2}' > class= "red" </c:if> >
            <td>${c.id}</td>
            <td>${c.categoryName}</td>
            <td>${c.categoryDesc}</td>
        </tr>
    </c:forEach>
</tbody>
</table>
<%@ include file="../common/footer.jsp" %>