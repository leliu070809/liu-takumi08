<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<div id="content">
	<div class="container">
		<div class="form-center">
			<form action="/manager/category/createConfirm" method="POST">

				<h2 class="section-title">カテゴリ新規登録</h2>

				<label>カテゴリ名</label><br> <input name="categoryName" value=""
					placeholder="カテゴリ名を入力してください。" /> <br>
				<br> <label>カテゴリ説明</label><br>
				<textarea rows="5" cols="30" name="categoryDesc"></textarea>

				<br>
<!--				<br> <label>価格</label><br> <input type="number"-->
<!--					name="price" /> <br>-->
<!--				<br> <label>カテゴリ</label><br> <select name="categoryId">-->
<!--					<option value="1">IT</option>-->
<!--					<option value="2">数学</option>-->
<!--					<option value="3">英語</option>-->
<!--				</select> <br>-->
<!--				<br> <label>Featured</label><br> <input type="radio"-->
<!--					name="featured" value="yes" checked /> Yes <input type="radio"-->
<!--					name="featured" value="no" /> No <br>-->
<!--				<br>-->
				<button type="submit"
					style="border: none; background-color: chocolate; color: white; padding: 10px 20px; cursor: pointer;">
					送信</button>
			</form>
		</div>
	</div>
</div>

</body>

</html>
<%@ include file="../common/footer.jsp"%>