<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/define.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css">
<title>カテゴリ一覧</title>

</head>
<body>

  <div class="main-content">
    <div class="page-wrapper">
    <div class="top-page">

      <h1>カテゴリ一覧画面</h1>
      <a class="btn" href="./create">新規登録</a>
      </div>

      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <td>ID</td>
              <td>カテゴリ名</td>
              <td>カテゴリ説明</td>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${categories}" var="c">
              <tr class="${c.id > 2 ? 'highlight' : ''}">
                <td>${c.id}</td>
                <td>${c.categoryName}</td>
                <td>${c.categoryDesc}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
         
      </div>
	<div class="footer-actions">
    <a href="${pageContext.request.contextPath}/home" class="btn btn-back">ホームページ戻る</a>
</div>
    </div>
    
  </div>
  

<%@ include file="../common/footer.jsp" %>