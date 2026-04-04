<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div id="content">
	<div class="container">
		<form action="/manager/product/create-execute" method="POST">
			<h2 class="section-title">新規登録 (確認)</h2>

			<label>商品名</label><br> <input type="text" value="${productName}" disabled /> 
			<input type="hidden" name="productName" value="${productName}" /> <br>
			<br> 
			<label>商品説明</label>
			<br>
			<textarea rows="5" cols="30" disabled>${productDesc}</textarea>
			<input type="hidden" name="productDesc" value="${productDesc}" /> <br>
			<br> <label>価格</label>
			<br> 
			<input type="number" value="${price}" disabled /> 
			<input type="hidden" name="price" value="${price}" /> <br>
			<br> <label>カテゴリ</label><br> <select disabled>
				<option value="1" ${categoryId==1 ? "selected" : "" }>IT</option>
				<option value="2" ${categoryId==2 ? "selected" : "" }>数学</option>
				<option value="3" ${categoryId==3 ? "selected" : "" }>英語</option>
			</select> <input type="hidden" name="categoryId" value="${categoryId}" /> <br>
			<br> 
			<label>Featured</label>
			<br> 
			<input type="radio" disabled ${featured== 'yes' ? "checked" : "" } /> Yes 
			<input type="radio" disabled ${featured== 'no' ? "checked" : "" } /> No 
			<input type="hidden" name="featured" value="${featured}" /> <br>
			<br>
			<button type="submit" style="background-color: chocolate; color: white;">確定 </button>
		</form>
	</div>
</div>

<footer>
	<div id="footer">
		<p>Copyinght © 2026 Developer by Liu</p>
	</div>
</footer>

</body>

</html>