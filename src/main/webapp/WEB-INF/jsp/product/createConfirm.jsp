<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header.jsp" %>

<div id="content">
    <div class="container">
        <form action="/product/create-execute" method="POST"> <h2 class="section-title">新規登録 (確認)</h2>
            
            <label>商品名</label><br>
            <input type="text" th:value="${productName}" disabled />
            <input type="hidden" name="productName" th:value="${productName}" />
            
            <br><br>
            <label>商品説明</label><br>
            <textarea rows="5" cols="30" th:text="${productDesc}" disabled></textarea>
            <input type="hidden" name="productDesc" th:value="${productDesc}" />
            
            <br><br>
            <label>価格</label><br>
            <input type="number" th:value="${price}" disabled />
            <input type="hidden" name="price" th:value="${price}" />
            
            <br><br>
            <label>カテゴリ</label><br>
            <select disabled>
                <option value="1" th:selected="${categoryId == 1}">IT</option>
                <option value="2" th:selected="${categoryId == 2}">数学</option>
                <option value="3" th:selected="${categoryId == 3}">英語</option>
            </select>
            <input type="hidden" name="categoryId" th:value="${categoryId}" />
            
            <br><br>
            <label>Featured</label><br>
            <input type="radio" disabled th:checked="${featured == 'yes'}" /> Yes
            <input type="radio" disabled th:checked="${featured == 'no'}" /> No
            <input type="hidden" name="featured" th:value="${featured}" />

            <br><br>
            <button type="submit" style="background-color: chocolate; color: white;">
                確定 (Gửi đi)
            </button>
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