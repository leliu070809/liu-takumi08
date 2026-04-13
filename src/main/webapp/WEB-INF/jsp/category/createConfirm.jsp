<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<!--                <label>価格</label><br>-->
                
<!--                <input type="number" value="${price}" readonly="readonly" />-->
<!--                <input type="hidden" name="price" value="<c:out value='${param.price}'/>" /><br><br>-->

<!--                <label>カテゴリ</label><br>-->
                
<!--                <select disabled>-->
<!--                    <option value="1" ${categoryId==1 ? "selected" : ""}>IT</option>-->
<!--                    <option value="2" ${categoryId==2 ? "selected" : ""}>数学</option>-->
<!--                    <option value="3" ${categoryId==3 ? "selected" : ""}>英語</option>-->
<!--                </select>-->
<!--                <input type="hidden" name="categoryId" value="${categoryId}" /><br><br>-->

<!--                <label>Featured</label><br>-->
                
<!--                <input type="radio" name="featuredDisplay" value="yes" disabled ${featured == 'yes' ? "checked" : ""} /> Yes-->
<!--                <input type="radio" name="featuredDisplay" value="no"  disabled ${featured == 'no'  ? "checked" : ""} /> No-->
<!--                <input type="hidden" name="featured" value="${featured}" /><br><br>-->

                <button type="submit" style="background-color: chocolate; color: white;">確定</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>