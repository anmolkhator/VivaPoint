<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="About"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main>
  <section class="aboutgrid"><div><h1 style="font-size:clamp(2.2rem,7vw,3.4rem)">About VivaPoint</h1>
    <p style="font-size:1.2rem;max-width:34em">VivaPoint is a practice portal for students preparing for written tests and exams. It turns revision into short, timed sessions with instant feedback, so you find your weak spots before the exam does.</p></div><div class="aimg" role="img" aria-label="Quiz card and progress chart"></div></section>
  <section class="sec"><h2>Why we built it</h2><p>Reading notes feels productive, but exams ask you to recall and explain. Practising with questions, under a clock, is a quick way to see what you really know. VivaPoint puts that practice in one simple place, free to join and ready on any device.</p></section>
  <section class="sec"><h2>What you can do here</h2><div class="g3">
    <div class="card"><h3>Timed quizzes</h3><p>Twenty shuffled questions per subject with a countdown, graded on the server, with an explanation for every answer.</p></div>
    <div class="card"><h3>Six subjects</h3><p>Python, Java, Web Technologies, Database Systems, Computer Networks and Operating Systems, covering core concepts that come up again and again.</p></div>
    <div class="card"><h3>Your own record</h3><p>Every session is saved under your account with its date and score, so you can watch your results improve.</p></div></div></section>
  <section class="sec"><h2>Your privacy</h2><p>VivaPoint asks only for your name and email. Passwords are salted and hashed, and each student can see only their own attempts.</p></section>
  <section class="cta"><h2>Ready to start?</h2><p>Create a free account and take your first quiz.</p><a class="btn primary" href="${ctx}/register">Sign up free</a></section>
</main>
<%@ include file="/WEB-INF/views/footer.jspf" %>
