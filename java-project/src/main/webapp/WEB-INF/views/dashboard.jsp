<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="Dashboard"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main>
  <div class="banner">
    <h1 style="font-size:clamp(2rem,6vw,3rem)">Welcome, <c:out value="${sessionScope.uname}"/></h1>
    <p class="mute">Choose a subject to start a 20-question timed quiz.</p>
  </div>
  <div class="subjects" style="margin-top:20px">
    <c:forEach var="s" items="${subjects}">
      <div class="card subj"><img class="simg" alt="" src="${ctx}/img/${s.key}.svg"><div class="t"><h2><c:out value="${s.value}"/></h2><p class="mute">20 shuffled questions</p></div>
        <div class="b"><a class="btn primary" href="${ctx}/quiz?subject=${s.key}">Start quiz</a></div></div>
    </c:forEach>
  </div>
  <c:if test="${count > 0}">
  <div class="kpis"><div><b>${count}</b>attempts</div><div><b>${avg}%</b>average</div><div><b>${best}%</b>best</div><div><b>${subjectsTried}</b>subjects tried</div></div>
  <h3 class="subh">Score trend (last ${trend.size()})</h3>
  <div class="chart" role="img" aria-label="Score trend chart"><c:forEach var="a" items="${trend}"><div class="bc" title="${a.percent}%"><i style="height:${a.percent < 3 ? 3 : a.percent}%"></i><span>${a.percent}</span></div></c:forEach></div>
  <h3 class="subh">Badges</h3>
  <div class="badges"><c:forEach var="b" items="${badges}"><div class="badge ${b[2] ? 'on' : ''}"><strong><c:out value="${b[0]}"/></strong><span><c:out value="${b[1]}"/></span></div></c:forEach></div>
  </c:if>
  <h2 style="margin-top:36px">Your attempts</h2>
  <c:choose>
    <c:when test="${empty attempts}"><p class="mute">No attempts yet. Pick a subject above to begin.</p></c:when>
    <c:otherwise>
      <div class="table-wrap"><table>
        <tr><th>Subject</th><th>Score</th><th>Percent</th><th>Date and time</th></tr>
        <c:forEach var="a" items="${attempts}">
          <tr><td><c:out value="${a.subject}"/></td><td>${a.score}/${a.total}</td><td>${a.percent}%</td><td><c:out value="${a.takenAt}"/></td></tr>
        </c:forEach>
      </table></div>
    </c:otherwise>
  </c:choose>
</main>
<%@ include file="/WEB-INF/views/footer.jspf" %>
