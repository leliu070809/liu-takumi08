<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/define.jsp"%>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/category.css">
<title>サプライヤー一覧</title>

</head>
<body>

    <div id="content">
        <div class="main-content">
            <div class="page-wrapper">
                <div class="top-page">
                    <h1>サプライヤー一覧画面</h1>
                    <button class="btn btn-back" onclick="getList()">サプライヤー一覧収得</button>
                </div>

               
                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>サプライヤーID</th>
                                <th>サプライヤー名</th>
                                <th>電話番号</th>
                                <th>住所</th>
                                <th>メール</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${supplierList}" var="c">
                                <tr class="${c.supplierId > 2 ? 'highlight' : ''}">
                                    <td>${c.supplierId}</td>
                                    <td>${c.supplierName}</td>
                                    <td>${c.tel}</td>
                                    <td>${c.address}</td>
                                    <td>${c.email}</td>
                                    <td>
                                        <button class="btn" onclick="deleteSupplier(${c.supplierId})">削除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <hr style="margin: 40px 0; border: 2px solid #c0396a;">

                
                <div class="table-wrap">
                    <table border="1" id="sTable">
                        <thead>
                            <tr>
                                <th>サプライヤーID</th>
                                <th>サプライヤー名</th>
                                <th>電話番号</th>
                                <th>住所</th>
                                <th>メール</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="sTableBody">
                        </tbody>
                    </table>
                </div>

                <br>

               
                <div class="container">
                    <div id="create-form">
                        <h3>新規登録</h3>
                        <input name="supplierName" placeholder="サプライヤー名" /><br>
                        <input name="tel" type="tel" maxlength="11" placeholder="電話番号" /><br>
                        <input name="address" placeholder="住所" /><br>
                        <input name="email" type="email" placeholder="メール" /><br>
                        <button class="btn" onclick="createSupplier()">登録</button>
                    </div>
                </div>

                <div class="footer-actions">
                    <a href="${pageContext.request.contextPath}/home"
                        class="btn btn-back">ホームページ戻る</a>
                </div>

            </div>
        </div>
    </div>

    <%@ include file="../../common/footer.jsp"%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>

 // ---- DELETE ----
    function deleteSupplier(id) {
        $.ajax({
            url: './delete',
            method: 'POST',
            data: { supplierId: id },
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
    async function createSupplier() {
        var supplierName = document.getElementsByName('supplierName')[0].value;
        var tel          = document.getElementsByName('tel')[0].value;
        var address      = document.getElementsByName('address')[0].value;
        var email        = document.getElementsByName('email')[0].value;

        fetch('./create', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                supplierName: supplierName,
                tel:          tel,
                address:      address,
                email:        email
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
        const tbody = document.getElementById("sTableBody");
        tbody.innerHTML = "";

        data.forEach(function(item) {
            const row = document.createElement("tr");
            row.innerHTML =
                "<td>" + item.supplierId + "</td>" +
                "<td>" + item.supplierName + "</td>" +
                "<td>" + item.tel + "</td>" +
                "<td>" + item.address + "</td>" +
                "<td>" + item.email + "</td>" +
                "<td><button class='btn' onclick='deleteSupplier(" + item.supplierId + ")'>削除</button></td>";
            tbody.appendChild(row);
        });
    }

    $(document).ready(function() {
       getList();  
    });

    </script>

</body>
</html>