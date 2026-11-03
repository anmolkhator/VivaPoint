<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="Results"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main>
  <h1 style="font-size:clamp(1.8rem,6vw,2.6rem)"><c:out value="${subjectName}"/> quiz complete</h1>
  <p class="score">${score}/${total}</p>
  <p><c:choose>
    <c:when test="${percent >= 80}">Strong result. You are well prepared for this topic.</c:when>
    <c:when test="${percent >= 50}">A fair start. Review the misses below and try again.</c:when>
    <c:otherwise>Keep going. Read the answers below, then retake the quiz.</c:otherwise>
  </c:choose> This attempt has been saved to your account.</p>
  <c:forEach var="q" items="${review}" varStatus="st">
    <div class="card" style="margin-top:14px">
      <p class="q" style="font-size:1.15rem">${st.count}. <c:out value="${q.question}"/></p>
      <c:choose>
        <c:when test="${q.chosen == q.correct}"><p><strong style="color:var(--ok)">Correct.</strong> <c:out value="${q.options[q.correct]}"/></p></c:when>
        <c:otherwise><p><strong style="color:var(--bad)"><c:choose><c:when test="${q.chosen < 0}">Not answered.</c:when><c:otherwise>Not quite.</c:otherwise></c:choose></strong>
          <c:if test="${q.chosen >= 0}"> You chose: <c:out value="${q.options[q.chosen]}"/>.</c:if>
          Correct answer: <c:out value="${q.options[q.correct]}"/>.</p></c:otherwise>
      </c:choose>
      <p class="mute"><c:out value="${q.explanation}"/></p>
    </div>
  </c:forEach>
  <div class="row"><a class="btn primary" href="${ctx}/quiz?subject=${subject}">Retake quiz</a><a class="btn" href="${ctx}/dashboard">Back to dashboard</a></div>
</main>
<%@ include file="/WEB-INF/views/footer.jspf" %>
