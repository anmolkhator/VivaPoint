<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="Log in"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main><section class="auth">
  <div class="authimg" role="img" aria-label=""></div>
  <h1 style="font-size:clamp(2rem,7vw,3rem)">Welcome back</h1>
  <p class="mute">Log in to start a quiz and see your attempts.</p>
  <form class="card" method="post" action="${ctx}/login">
    <label>Email<input name="email" type="email" autocomplete="email" required value="<c:out value='${email}'/>"></label>
    <label>Password<input name="password" type="password" autocomplete="current-password" required></label>
    <p class="err" role="alert"><c:out value="${error}"/></p>
    <button class="primary" type="submit">Log in</button>
  </form>
  <p class="mute">New here? <a href="${ctx}/register">Create an account</a></p>
</section></main>
<%@ include file="/WEB-INF/views/footer.jspf" %>
