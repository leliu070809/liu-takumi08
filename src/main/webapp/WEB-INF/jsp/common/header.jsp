<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:eval expression="@cartDto" var="cartDto" />

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>さくら堂 | 和菓子・洋菓子オンラインショップ</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@300;400;600&family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<nav>
  <div class="nav-logo">さくら<span>堂</span></div>
  <ul class="nav-links">
    <li><a href="${pageContext.request.contextPath}/home"><spring:message code="nav.home"/></a></li>
    <li><a href="#"><spring:message code="nav.wagashi"/></a></li>
    <li><a href="#"><spring:message code="nav.yogashi"/></a></li>
    <li><a href="#"><spring:message code="nav.candy"/></a></li>
    <li><a href="#"><spring:message code="nav.gift"/></a></li>

    <!-- cart tu hien thi so luong -->
    <li>
      <a href="${pageContext.request.contextPath}/cart/list">
        🛒<spring:message code="nav.cart"/>（${fn:length(cartDto.productList)}）
      </a>
    </li>

    <!-- logged -->
    <sec:authorize access="hasRole('ROLE_MEMBER')">
      <li>
        <sec:authentication property="principal.member.lastName"/>
        <sec:authentication property="principal.member.firstName"/>
        <spring:message code="customer.sama"/>
      </li>
      <li><a href="${pageContext.request.contextPath}/my-account"><spring:message code="nav.mypage"/>👤</a></li>
    </sec:authorize>

  </ul>

  <div class="nav-actions">

    <!-- Language switcher -->
    <div class="lang-switcher">
      <a href="?lang=ja">日本語</a>
      <a href="?lang=vi">Tiếng Việt</a>
    </div>

    <!-- not logged -->
    <sec:authorize access="!hasRole('ROLE_MEMBER')">
      <a href="${pageContext.request.contextPath}/login" class="btn-nav btn-login"><spring:message code="nav.login"/></a>
      <a href="${pageContext.request.contextPath}/register" class="nav-register"><spring:message code="nav.register"/></a>
    </sec:authorize>

    <!-- logged -->
    <sec:authorize access="hasRole('ROLE_MEMBER')">
      <a href="${pageContext.request.contextPath}/logout" class="btn-nav btn-login"><spring:message code="nav.logout"/></a>
    </sec:authorize>

  </div>
</nav>