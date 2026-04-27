<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="banner">
  <img class="banner-img" src="img/banner.png" alt="Banner Sakura堂">
  <div class="banner-inner">
    <div class="banner-tag">NEW SEASON COLLECTION</div>
    <h1 class="title">日本の心を<br>ひとつひとつ丁寧に</h1>
    <p class="desc">
      職人が心を込めた和菓子・洋菓子を全国にお届け。<br>
      
    </p>
    <div class="btn-group">
      <a href="#product-featured" class="btn btn-primary">新作を見る</a>
      <a href="#categories-featured" class="btn btn-outline">ギフトを探す</a>
    </div>
  </div>
</div>

<div id="features">
  <div class="container">
    <div class="features-grid">
      <div class="feature-item">
        <h4>全国送料無料</h4>
        <p>3,000円以上のご注文で<br>全国どこでも無料配送</p>
      </div>
      <div class="feature-item">
        <h4>ギフト包装</h4>
        <p>大切な方への贈り物に<br>丁寧な包装サービス</p>
      </div>
      <div class="feature-item">
        <h4>安心・無添加</h4>
        <p>厳選素材・無添加にこだわった<br>職人の手作り菓子</p>
      </div>
      <div class="feature-item">
        <h4>返品保証</h4>
        <p>到着後7日以内であれば<br>返品・交換対応可能</p>
      </div>
    </div>
  </div>
</div>
<div id="product-featured">
  <div class="container">
    <h2 class="section-title">おすすめ商品</h2>
    <p class="section-sub">今季人気の和菓子・洋菓子をご紹介</p>

    <div class="product-grid">

      <c:forEach items="${products}" var="p">
        <div class="product-card">
          <div class="img-wrap">
            <img src="${not empty p.imageUrl ? p.imageUrl : 'img/default.jpg'}"
                 alt="${p.productName}"
                 onerror="this.src='img/wagashi.jpg'"/>
          </div>
          <div class="card-body">
            <h3>${p.productName}</h3>
            <p class="desc-small">${p.productDesc}</p>
           <p class="price">￥<fmt:formatNumber value="${p.price}" pattern="#,###"/></p>
            <a href="${pageContext.request.contextPath}/cart/add?productId=${p.id}" class="btn-cart">カートに入れる</a>
          </div>
        </div>
      </c:forEach>

      <c:if test="${empty products}">
        <p style="text-align:center; color:#888; width:100%;">商品がありません。</p>
      </c:if>

    </div>
  </div>
</div>
      <script>
function addToCart(productId) {
    fetch('/cart/add', {
        method: 'POST',
        body: JSON.stringify({
            productId: productId
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.text())
    .then(result => console.log(result))
    .catch(err => console.error("loi: ", err));
}
</script>

      <c:if test="${empty products}">
        <p style="text-align:center; color:#888; width:100%;">商品がありません。</p>
      </c:if>

    </div>
  </div>
</div>

<div class="category-grid">
  <c:forEach items="${categoryList}" var="cat">
    <div class="category-card">
      <img src="${pageContext.request.contextPath}/${cat.imageUrl}"
           alt="${cat.categoryName}"
           onerror="this.src='${pageContext.request.contextPath}/img/wagashi.jpg'"/>
      <div class="cat-label">${cat.categoryName}</div>
    </div>
  </c:forEach>
</div>

<%@include file="common/footer.jsp" %>