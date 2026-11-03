<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="Sign up"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main><section class="auth">
  <div class="authimg" role="img" aria-label=""></div>
  <h1 style="font-size:clamp(2rem,7vw,3rem)">Create your account</h1>
  <p class="mute">Sign-up is free.</p>
  <form class="card" method="post" action="${ctx}/register">
    <label>Full name<input name="name" autocomplete="name" required maxlength="100" value="<c:out value='${name}'/>"></label>
    <label>Email<input name="email" type="email" autocomplete="email" required maxlength="150" value="<c:out value='${email}'/>"></label>
    <label>Password<input name="password" type="password" autocomplete="new-password" required minlength="8"></label>
    <label>Confirm password<input name="confirm" type="password" autocomplete="new-password" required minlength="8"></label>
    <p class="err" role="alert"><c:out value="${error}"/></p>
    <button class="primary" type="submit">Create account</button>
  </form>
  <p class="mute">Already registered? <a href="${ctx}/login">Log in</a></p>
</section></main>
<%@ include file="/WEB-INF/views/footer.jspf" %>
