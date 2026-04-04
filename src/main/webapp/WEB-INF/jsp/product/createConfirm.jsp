<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div id="content">
    <div class="container">
        <div class="from-center">
            <form action="/manager/product/insert" method="POST">
                <h2 class="section-title">新規登録 (確認)</h2>

                <label>商品名</label><br>
             
                <input type="text" value="${productName}" readonly="readonly" />
                <input type="hidden" name="productName" value="${productName}" /><br><br>

                <label>商品説明</label><br>
                
                <textarea readonly="readonly" rows="5" cols="30">${productDesc}</textarea>
                <input type="hidden" name="productDesc" value="${productDesc}" /><br><br>

                <label>価格</label><br>
                
                <input type="number" value="${price}" readonly="readonly" />
                <input type="hidden" name="price" value="${price}" /><br><br>

                <label>カテゴリ</label><br>
                
                <select disabled>
                    <option value="1" ${categoryId==1 ? "selected" : ""}>IT</option>
                    <option value="2" ${categoryId==2 ? "selected" : ""}>数学</option>
                    <option value="3" ${categoryId==3 ? "selected" : ""}>英語</option>
                </select>
                <input type="hidden" name="categoryId" value="${categoryId}" /><br><br>

                <label>Featured</label><br>
                
                <input type="radio" name="featuredDisplay" value="yes" disabled ${featured == 'yes' ? "checked" : ""} /> Yes
                <input type="radio" name="featuredDisplay" value="no"  disabled ${featured == 'no'  ? "checked" : ""} /> No
                <input type="hidden" name="featured" value="${featured}" /><br><br>

                <button type="submit" style="background-color: chocolate; color: white;">登録</button>
            </form>
        </div>
    </div>
</div>

<footer>
    <div id="footer">
       
        <p>Copyright &copy; 2026 Developer by Liu</p>
    </div>
</footer>

</body>
</html>