<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/define.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css">
<title>商品一覧</title>

</head>
<body>

  <div id="content">
    <div class="main-content">
      <div class="page-wrapper">
        <div class="top-page">
          <h1>商品一覧画面</h1>
          <button class="btn btn-back" onclick="getList()">商品一覧収得</button>
        </div>

<!--        <div class="table-wrap">-->
<!--          <table>-->
<!--            <thead>-->
<!--              <tr>-->
<!--                <th>商品ID</th>-->
<!--                <th>商品名</th>-->
<!--                <th>価格</th>-->
<!--                <th>説明</th>-->
<!--                <th>カテゴリ</th>-->
<!--                <th>画像</th>-->
<!--                <th>操作</th>-->
<!--              </tr>-->
<!--            </thead>-->
<!--            <tbody>-->
<!--              <c:forEach items="${productList}" var="p">-->
<!--                <tr>-->
<!--                  <td>${p.id}</td>-->
<!--                  <td>${p.productName}</td>-->
<!--                  <td><fmt:formatNumber value="${p.price}" pattern="#,###"/></td>-->
<!--                  <td>${p.productDesc}</td>-->
<!--                  <td>${p.categoryId}</td>-->
<!--                  <td>-->
<!--                    <img src="${pageContext.request.contextPath}/${p.imageUrl}"-->
<!--                         width="60" height="60"-->
<!--                         onerror="this.src='${pageContext.request.contextPath}/img/wagashi.jpg'"/>-->
<!--                  </td>-->
<!--                  <td>-->
<!--                    <button class="btn" onclick="deleteProduct(${p.id})">削除</button>-->
<!--                  </td>-->
<!--                </tr>-->
<!--              </c:forEach>-->
<!--            </tbody>-->
<!--          </table>-->
<!--        </div>-->

<!--        <hr style="margin: 40px 0; border: 2px solid #c0396a;">-->

        <div class="table-wrap">
          <table border="1" id="pTable">
            <thead>
              <tr>
                <th>商品ID</th>
                <th>商品名</th>
                <th>価格</th>
                <th>説明</th>
                <th>カテゴリ</th>
                <th>画像</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody id="pTableBody">
            </tbody>
          </table>
        </div>

        <br>

        <div class="container">
          <div id="create-form">
            <h3>新規登録</h3>
            <input name="productName" placeholder="商品名"/><br>
            <input name="price" type="number" placeholder="価格"/><br>
            <input name="productDesc" placeholder="商品説明"/><br>
            <input name="categoryId" type="number" placeholder="カテゴリID"/><br>
            <input name="imageUrl" placeholder="画像URL (例: img/wagashi.jpg)"/><br>
            <button class="btn" onclick="createProduct()">登録</button>
          </div>
        </div>

        <div class="footer-actions">
          <a href="${pageContext.request.contextPath}/home" class="btn btn-back">ホームページ戻る</a>
        </div>

      </div>
    </div>
  </div>

  <%@ include file="../../common/footer.jsp"%>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>

    // ---- DELETE ----
    function deleteProduct(id) {
        $.ajax({
            url: './delete',
            method: 'POST',
            data: { productId: id },
            success: function(result) {
                console.log("削除成功", result);
                location.reload();
            },
            error: function() {
                alert("削除失敗しました。");
            }
        });
    }

    // ---- CREATE ----
    async function createProduct() {
        var productName = document.getElementsByName('productName')[0].value;
        var price       = document.getElementsByName('price')[0].value;
        var productDesc = document.getElementsByName('productDesc')[0].value;
        var categoryId  = document.getElementsByName('categoryId')[0].value;
        var imageUrl    = document.getElementsByName('imageUrl')[0].value;

        fetch('./create/api', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                productName: productName,
                price:       parseInt(price),
                productDesc: productDesc,
                categoryId:  parseInt(categoryId),
                imageUrl:    imageUrl
            })
        })
        .then(response => response.text())
        .then(result => {
            console.log("登録成功", result);
            location.reload();
        })
        .catch(error => {
            alert("登録失敗しました。");
        });
    }

    // ---- GET LIST (API) ----
    async function getList() {
        fetch('./list/api', { method: 'GET' })
        .then(response => response.json())
        .then(result => {
            console.log("取得成功", result);
            renderTable(result);
        })
        .catch(err => {
            console.error("エラー: ", err);
            alert("取得失敗しました。");
        });
    }

    // ---- RENDER TABLE ----
    function renderTable(data) {
        const tbody = document.getElementById("pTableBody");
        tbody.innerHTML = "";

        data.forEach(function(item) {
            const row = document.createElement("tr");
            row.innerHTML =
                "<td>" + item.id          + "</td>" +
                "<td>" + item.productName + "</td>" +
                "<td>" + item.price       + "</td>" +
                "<td>" + item.productDesc + "</td>" +
                "<td>" + item.categoryId  + "</td>" +
                "<td><img src='" + (item.imageUrl ? item.imageUrl : 'img/wagashi.jpg') + "' width='60' height='60' onerror=\"this.onerror=null;this.src='img/wagashi.jpg'\"/></td>" +
                "<td><button class='btn' onclick='deleteProduct(" + item.id + ")'>削除</button></td>";
            tbody.appendChild(row);
        });
    }

    $(document).ready(function() {
        getList();
    });

  </script>

</body>
</html>