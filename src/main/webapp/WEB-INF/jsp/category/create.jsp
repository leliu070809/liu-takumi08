<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css">

<div id="content">
  <div class="container">
    <div class="form-center">
      <form action="/manager/category/createConfirm" method="POST">

        <h2 class="section-title">カテゴリ新規登録</h2>

        <label>カテゴリ名</label><br>
        <input name="categoryName" value=""
               placeholder="カテゴリ名を入力してください。" />

        <label>カテゴリ説明</label><br>
        <textarea rows="5" name="categoryDesc"></textarea>

        <br>
        <button type="submit" class="btn-submit, btn">新規登録</button>

      </form>
    </div>
  </div>
</div>

</body>
</html>
<%@ include file="../common/footer.jsp"%>