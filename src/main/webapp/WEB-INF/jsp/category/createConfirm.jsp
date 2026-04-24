<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css">

<div id="content">
    <div class="container">
        <div class="from-center">
        
            <form action="/manager/category/insert" method="POST">
                <h2 class="section-title">新規登録 (確認)</h2>

                <label>カテゴリ名</label><br>
             
<!--                <input type="text" value="<c:out value='${param.categorytName}'/>" readonly="readonly" />-->
                <input type="text" name="categoryName" value="${categoryName}" /><br><br>

                <label>カテゴリ説明</label><br>
                
<!--                <textarea readonly="readonly" rows="5" cols="30">${categoryDesc}</textarea>-->
                <input type="text" name="categoryDesc" value="<c:out value='${param.categoryDesc}'/>" /><br><br>
                <button type="submit" class="btn-submit, btn"> 確定</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>