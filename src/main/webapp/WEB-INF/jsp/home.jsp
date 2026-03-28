<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div id="content">
			<!--banner-->
			<div id="banner">
				<p class="title">期間限定セール開催中！</p>
				<p class="desc">最大５０％OFF。最新のガジェツトをお得に手を入れよう。</p>
				<p>
					<button class="btn">link1</button>
					<button class="btn">link2</button>
				</p>
			</div>
			<!--product featured-->
			<div id="product-fetured" class="container" >
				<h2 class="section-title">おすすめ商品</h2>
				<div class="product-grid">
					<!--lap 6 san pham-->
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
						
					</div>
					
					<div class="product-card">
						<img src="https://picsum.photos/seed/picsum/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
						
					</div>
					
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
										
					</div>
					
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
										
					</div>
					
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
										
					</div>
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
										
					</div>
					
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
										
					</div>
					<div class="product-card">
						<img src="https://picsum.photos/200/200"/>
						<h3>高性能スマートフォン Pro Max</h3>
						<p class="price">￥128,000</p>
						<a href="#" class="btn btn-cart">カードに入れる</a>
										
					</div>
					</div>
				</di>
					<!--category-->
					
					<div id="categories-featured" class="container">
			          <h2 class="section-title">カテゴリーから探す</h2>
			          <div class="category-grid">
			              <!-- category 1 -->
			              <div class="category-card">
			                  <img src="https://picsum.photos/seed/picsum/200/200"/>
			                  <h3>PC・パソコン</h3>
			              </div>
			              <!-- category 2 -->
			              <div class="category-card">
			                  <img src="https://picsum.photos/seed/picsum/200/200"/>
			                  <h3>スマートフォン</h3>
			              </div>
			              <!-- category 3 -->
			              <div class="category-card">
			                  <img src="https://picsum.photos/seed/picsum/200/200"/>
			                  <h3>オーディオ</h3>
			              </div>
			              <!-- category 4 -->
			              <div class="category-card">
			                  <img src="https://picsum.photos/seed/picsum/200/200"/>
			                  <h3>ウォッチ</h3>
			              </div>
			              
			         
				</div>
				
			</div>
		</div>
		<c:forEach items="${ categoryList}" var="c">
			<li>${c.categoryName}</li>
			
		</c:forEach>
		
		<footer>
			<div id="footer">
				<p>Copyinght © 2026 Developer by Liu</p>
			</div>
		</footer>

	</body>
</html>