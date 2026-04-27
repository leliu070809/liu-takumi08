<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/define.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ログイン — さくら堂</title>
  <link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;600;700&family=Zen+Kaku+Gothic+New:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css">
</head>
<body>
  <div class="card">

    <div class="card-top">
      <span class="brand-icon">🍡</span>
      <span class="brand-name">さくら堂</span>
      <span class="brand-sub">SAKURA SWEETS JAPAN</span>
    </div>

    <div class="card-body">

      <div class="deco-line">✿ ✿ ✿</div>
      <h1 class="form-title">ログイン</h1>
      <p class="form-hint">アカウント情報を入力してください</p>

      <form:form id="loginForm" action="/auth" modelAttribute="loginForm"
                 method="post" onsubmit="handleSubmit(event)">

        <div class="form-group">
          <label class="form-label" for="username">ユーザー名 / メール</label>
          <div class="input-wrap">
            <span class="input-icon">👤</span>
            <form:input path="username" id="username" class="form-input"
                        placeholder="例: sakura@example.com" autocomplete="username" />
          </div>
          <span class="error-msg" id="usernameError">ユーザー名を入力してください</span>
        </div>

        <div class="form-group">
          <label class="form-label" for="password">パスワード</label>
          <div class="input-wrap">
            <span class="input-icon">🔑</span>
            <form:input type="password" path="password" id="password" class="form-input"
                        placeholder="Nhập mật khẩu" />
            <button type="button" class="btn-eye" onclick="togglePw()">👁</button>
          </div>
          <span class="error-msg" id="passwordError">パスワードを入力してください</span>
        </div>

        <div class="form-options">
          <label class="remember">
            <input type="checkbox" id="rememberMe" name="remember">
            <div class="checkbox-box"></div>
            <span class="remember-label">ログイン状態を保持</span>
          </label>
          <a href="/forgot-password" class="forgot-link">パスワードを忘れた？</a>
        </div>

        <button type="submit" class="btn-login" id="btnLogin">
          <div class="btn-inner">
            <div class="spinner"></div>
            <span class="btn-text">ログイン　🌸</span>
          </div>
        </button>

      </form:form>

      <div class="divider">または</div>

<!--      <div class="social-row">-->
<!--        <button type="button" class="btn-social">🇬 Google</button>-->
<!--        <button type="button" class="btn-social">📘 LINE</button>-->
<!--      </div>-->

      <div class="register-row">
        アカウントをお持ちでない方は <a href="/register">新規登録</a>
      </div>

    </div>
  </div>

  <script>
    function togglePw() {
      const pw = document.getElementById('password');
      pw.type = pw.type === 'password' ? 'text' : 'password';
    }

    document.querySelectorAll('.remember').forEach(label => {
      label.addEventListener('click', () => {
        const cb = label.querySelector('input');
        cb.checked = !cb.checked;
      });
    });

    function handleSubmit(e) {
      e.preventDefault();
      let ok = true;
      const u    = document.getElementById('username');
      const p    = document.getElementById('password');
      const uErr = document.getElementById('usernameError');
      const pErr = document.getElementById('passwordError');

      u.classList.remove('error'); uErr.style.display = 'none';
      p.classList.remove('error'); pErr.style.display = 'none';

      if (!u.value.trim()) { u.classList.add('error'); uErr.style.display = 'block'; ok = false; }
      if (!p.value.trim()) { p.classList.add('error'); pErr.style.display = 'block'; ok = false; }

      if (ok) {
        const btn = document.getElementById('btnLogin');
        btn.classList.add('loading');
        btn.disabled = true;
        setTimeout(() => e.target.submit(), 1200);
      }
    }

    ['username','password'].forEach(id => {
      document.getElementById(id).addEventListener('input', function() {
        this.classList.remove('error');
      });
    });
  </script>

</body>
</html>