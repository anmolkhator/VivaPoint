<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="${subjectName} quiz"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main>
<form method="post" action="${ctx}/quiz" id="qz">
  <input type="hidden" name="subject" value="${subject}">
  <div class="top"><span><c:out value="${subjectName}"/> quiz, ${questions.size()} questions</span><span class="timer" id="tm">15:00</span></div>
  <c:forEach var="q" items="${questions}" varStatus="st">
    <fieldset class="qcard">
      <legend>Question ${st.count} of ${questions.size()}</legend>
      <input type="hidden" name="qid" value="${q.id}">
      <p class="q"><c:out value="${q.question}"/></p>
      <c:forEach var="o" items="${q.options}" varStatus="os">
        <label class="optl"><input type="radio" name="a${q.id}" value="${q.order[os.index]}"><b>&#${64 + os.count};</b><span><c:out value="${o}"/></span></label>
      </c:forEach>
    </fieldset>
  </c:forEach>
  <div class="row"><button class="primary" type="submit">Submit answers</button></div>
</form>
</main>
<script>
(function () {
  var t = 900, el = document.getElementById('tm'), f = document.getElementById('qz');
  function show() { var m = Math.floor(t / 60), s = t % 60; el.textContent = m + ':' + (s < 10 ? '0' : '') + s; el.classList.toggle('low', t <= 60); }
  show();
  var id = setInterval(function () { t--; show(); if (t <= 0) { clearInterval(id); f.submit(); } }, 1000);
})();
</script>
<%@ include file="/WEB-INF/views/footer.jspf" %>
