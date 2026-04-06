<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 1. Nhúng Header (Đã bao gồm <head>, CSS ) --%>
<%@include file="common/header.jsp" %>

<div id="banner">
  <img class="banner-img" src="img/banner.png" alt="Banner Sakura堂">
  <div class="banner-inner">
    <div class="banner-tag">NEW SEASON COLLECTION</div>
    <h1 class="title">日本の心を<br>ひとつひとつ丁寧に</h1>
    <p class="desc">
      職人が心を込めた和菓子・洋菓子を全国にお届け。<br>
      春の新作が続々登場。最大50%OFFセール開催中！
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
<!--    <div class="section-divider"><span>🌸</span></div>-->
    <h2 class="section-title">おすすめ商品</h2>
    <p class="section-sub">今季人気の和菓子・洋菓子をご紹介</p>
    
    <div class="product-grid">
      
      <c:forEach items="${products}" var="p">
          <div class="product-card">
            <div class="img-wrap">
                <img src="${p.imageUrl}" alt="${p.productName}"/>
            </div>
          
            <c:if test="${not empty p.status}">
                <span class="badge">${p.status}</span>
            </c:if>
            <div class="card-body">
              <h3>${p.productName}</h3>
              <p class="desc-small">${p.description}</p>
              <p class="price">￥${p.price}</p>
              <a href="cart?action=add&id=${p.id}" class="btn-cart">🛒 カートに入れる</a>
            </div>
          </div>
      </c:forEach>

      <c:if test="${empty products}">
          <div class="product-card">
            <div class="img-wrap"><img src="img/sakuramochi-set.jpg" alt="春限定 桜餅セット"></div>
            <span class="badge">人気No.1</span>
            <div class="card-body">
              <h3>春限定 桜餅セット</h3>
              <p class="desc-small">道明寺粉の優しい甘さ、塩漬け桜葉の香り</p>
              <p class="price">￥1,280</p>
              <a href="#" class="btn-cart">カートに入れる</a>
            </div>
          </div>
          <div class="product-card">
	  <div class="img-wrap"><img src="img/uji-matcha-daifuku.jpg" alt="宇治抹茶大福"></div>
	  <span class="badge">新作</span>
	  <div class="card-body">
	    <h3>宇治抹茶大福 </h3>
	    <p class="desc-small">濃厚な抹茶あんと、とろけるようなお餅のハーモニー</p>
	    <p class="price">￥980</p>
	    <a href="#" class="btn-cart">カートに入れる</a>
	  </div>
	</div>
	
	<div class="product-card">
	  <div class="img-wrap"><img src="img/tokusei-dorayaki.jpg" alt="特製 どら焼き"></div>
	  <div class="card-body">
	    <h3>特製 どら焼き</h3>
	    <p class="desc-small">北海道産小豆を贅沢に使用したふっくら食感</p>
	    <p class="price">￥1,100</p>
	    <a href="#" class="btn-cart">カートに入れる</a>
	  </div>
	</div>
	
	<div class="product-card">
	  <div class="img-wrap"><img src="img/honneri-yokan-set.jpg" alt="本練り 羊羹セット"></div>
	  <span class="badge">SALE 10%</span>
	  <div class="card-body">
	    <h3>本練り 羊羹セット </h3>
	    <p class="desc-small">伝統的な製法で練り上げた、口当たりの良い一品</p>
	    <p class="price">￥1,540</p>
	    <a href="#" class="btn-cart">カートに入れる</a>
	  </div>
	</div>
      </c:if>
    </div>
  </div>
</div>

<div id="categories-featured">
  <div class="container">

    <h2 class="section-title">カテゴリーから探す</h2>
    <p class="section-sub">お好みのジャンルからお気に入りを見つけてください</p>
    <div class="category-grid">
      <div class="category-card">
        <img src="img/wagashi.jpg" alt="和菓子"/>
        <div class="cat-label">和菓子</div>
      </div>
      <div class="category-card">
        <img src="img/uji-matcha-sweets.png" alt="抹茶スイーツ"/>
        <div class="cat-label">抹茶スイーツ</div>
      </div>
      <div class="category-card">
        <img src="img/candy.jpg" alt="飴・キャンディ"/>
        <div class="cat-label">飴・キャンディ</div>
      </div>
      <div class="category-card">
        <img src="img/gift.jpg" alt="ギフトセット"/>
        <div class="cat-label">ギフトセット</div>
      </div>
    </div>
  </div>
</div>

<%-- 2. Nhúng Footer (Đã bao gồm Copyright và đóng các thẻ </body> </html>) --%>
<%@include file="common/footer.jsp" %>