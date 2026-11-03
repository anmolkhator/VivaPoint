<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="title" value="Viva and quiz portal"/>
<%@ include file="/WEB-INF/views/header.jspf" %>
<main>
  <section class="lh">
    <div>
      <h1>Walk into your exam prepared.</h1>
      <p>VivaPoint gives you 20-question timed quizzes with instant explanations, and keeps a record of every attempt you make.</p>
      <div class="row"><a class="btn primary" href="${ctx}/register">Start practising</a><a class="btn" href="#how">See how it works</a></div>
    </div>
    <div class="hv"><div class="heroimg" role="img" aria-label="Student practising a quiz on a laptop"></div></div>
  </section>
  <div class="stats"><div><b>20</b>questions per quiz</div><div><b>6</b>subjects to start</div><div><b>Free</b>to sign up</div></div>
  <section class="sec" id="how"><h2>How it works</h2><div class="g3">
    <div class="card step"><span class="n">1</span><div><h3>Create an account</h3><p>Sign up with your name and email.</p></div></div>
    <div class="card step"><span class="n">2</span><div><h3>Take a quiz</h3><p>Answer 20 shuffled questions against the clock.</p></div></div>
    <div class="card step"><span class="n">3</span><div><h3>Review and improve</h3><p>Read the explanations and track your scores.</p></div></div>
  </div></section>
  <section class="sec"><h2>Choose your subject</h2><div class="subjects" style="margin-top:20px">
    <div class="card subj"><img class="simg" alt="" src="${ctx}/img/python.svg"><div class="t"><h3>Python</h3><p class="mute">Syntax, data structures and core concepts.</p></div><div class="b"><a class="btn primary" href="${ctx}/quiz?subject=python">Start quiz</a></div></div>
    <div class="card subj"><img class="simg" alt="" src="${ctx}/img/dbms.svg"><div class="t"><h3>Database Systems</h3><p class="mute">SQL, keys, normalisation and transactions.</p></div><div class="b"><a class="btn primary" href="${ctx}/quiz?subject=dbms">Start quiz</a></div></div>
    <div class="card subj"><img class="simg" alt="" src="${ctx}/img/net.svg"><div class="t"><h3>Computer Networks</h3><p class="mute">Layers, protocols and addressing.</p></div><div class="b"><a class="btn primary" href="${ctx}/quiz?subject=net">Start quiz</a></div></div>
    <div class="card subj"><img class="simg" alt="" src="${ctx}/img/java.svg"><div class="t"><h3>Java Programming</h3><p class="mute">OOP, collections, exceptions and servlets.</p></div><div class="b"><a class="btn primary" href="${ctx}/quiz?subject=java">Start quiz</a></div></div>
    <div class="card subj"><img class="simg" alt="" src="${ctx}/img/web.svg"><div class="t"><h3>Web Technologies</h3><p class="mute">HTML, CSS, JavaScript and web basics.</p></div><div class="b"><a class="btn primary" href="${ctx}/quiz?subject=web">Start quiz</a></div></div>
    <div class="card subj"><img class="simg" alt="" src="${ctx}/img/os.svg"><div class="t"><h3>Operating Systems</h3><p class="mute">Processes, scheduling, memory and files.</p></div><div class="b"><a class="btn primary" href="${ctx}/quiz?subject=os">Start quiz</a></div></div>
  </div></section>
  <section class="sec"><h2>Why practise with questions</h2><p class="mute">Rereading notes feels productive but can hide gaps. Practising with questions shows you what you really know.</p><div class="g3">
<div class="card"><h3>Recall beats rereading</h3><p>Pulling an answer out of memory tends to strengthen it more than reading the same page again.</p></div>
<div class="card"><h3>The clock builds confidence</h3><p>Timed sets get you used to answering under pressure, so exam day feels familiar.</p></div>
<div class="card"><h3>Feedback finds your gaps</h3><p>Every question comes with an explanation, so a wrong answer becomes something you learn from.</p></div></div></section>
<section class="sec"><h2>What you get</h2><div class="g3">
<div class="card"><h3>20-question quizzes</h3><p>Each quiz draws 20 questions from a bigger pool, with the answer order shuffled too, so no two attempts are the same.</p></div>
<div class="card"><h3>Instant explanations</h3><p>See the right answer and the reasoning behind it as soon as you finish.</p></div>
<div class="card"><h3>Your own record</h3><p>Every attempt is saved with its subject, score, date and time.</p></div>
<div class="card"><h3>Six core subjects</h3><p>Python, Java, Web Technologies, Database Systems, Computer Networks and Operating Systems, with more to come.</p></div>
<div class="card"><h3>Works everywhere</h3><p>Use it on a phone between classes or on a laptop at your desk.</p></div>
<div class="card"><h3>Private accounts</h3><p>Each student sees only their own sessions and results.</p></div></div></section>
<section class="sec"><h2>Inside each subject</h2><p class="mute">The questions focus on the core ideas that exams return to again and again.</p><div class="g3">
<div class="card"><h3>Python</h3><ul><li>Data types and mutability</li><li>Loops and control flow</li><li>Functions, lambdas, generators</li><li>Classes and objects</li><li>Files, modules and packages</li></ul></div>
<div class="card"><h3>Database Systems</h3><ul><li>SQL commands and joins</li><li>Keys and relationships</li><li>Normal forms</li><li>Transactions and ACID</li><li>Indexes and views</li></ul></div>
<div class="card"><h3>Computer Networks</h3><ul><li>OSI layers and devices</li><li>TCP, UDP and ports</li><li>IP addressing and NAT</li><li>DNS, DHCP and ARP</li><li>HTTP, HTTPS and TLS</li></ul></div><div class="card"><h3>Java Programming</h3><ul><li>Classes, inheritance, interfaces</li><li>Collections and generics</li><li>Exceptions</li><li>JDBC and servlets</li><li>Strings and loops</li></ul></div><div class="card"><h3>Web Technologies</h3><ul><li>HTML structure and forms</li><li>CSS selectors and layout</li><li>JavaScript basics</li><li>The DOM and events</li><li>HTTP, JSON and AJAX</li></ul></div><div class="card"><h3>Operating Systems</h3><ul><li>Processes and threads</li><li>CPU scheduling</li><li>Memory and paging</li><li>Deadlocks and synchronisation</li><li>Files and Linux commands</li></ul></div></div></section>
<section class="sec"><h2>A typical session</h2><div class="g3">
<div class="card step"><span class="n">1</span><div><h3>Sign up</h3><p>Create a free account in under a minute.</p></div></div>
<div class="card step"><span class="n">2</span><div><h3>Pick a subject</h3><p>Choose the topic you want to work on.</p></div></div>
<div class="card step"><span class="n">3</span><div><h3>Answer 20 questions</h3><p>Work against the clock, one question at a time.</p></div></div>
<div class="card step"><span class="n">4</span><div><h3>Read the explanations</h3><p>Check each answer and learn from the ones you missed.</p></div></div>
<div class="card step"><span class="n">5</span><div><h3>Retake and compare</h3><p>Try again and watch your score improve in your history.</p></div></div></div></section>
<section class="sec"><h2>Who it is for</h2><div class="g3">
<div class="card"><h3>Students before exams</h3><p>Turn the last weeks of revision into focused daily practice.</p></div>
<div class="card"><h3>Learners building basics</h3><p>Check your understanding as you move through a new subject.</p></div>
<div class="card"><h3>Anyone brushing up</h3><p>Refresh concepts quickly before an interview, lab or viva.</p></div></div></section>
<section class="sec"><h2>Five tips for better practice</h2><ul>
<li><strong>Practise little and often.</strong> A quiz a day beats a long session once a week.</li>
<li><strong>Read every explanation.</strong> Even correct answers can be right for the wrong reason.</li>
<li><strong>Retake the same subject.</strong> Repetition is where the answers start to stick.</li>
<li><strong>Review your history.</strong> Spot which subjects need more time.</li>
<li><strong>Explain answers aloud.</strong> If you can say it simply, you know it.</li></ul></section>
<section class="sec"><h2>Track your progress</h2><p class="mute">Your dashboard turns every attempt into something you can measure.</p><div class="g3">
<div class="card"><h3>Score trend</h3><p>A chart of your last ten attempts shows whether you are improving.</p></div>
<div class="card"><h3>Key numbers</h3><p>See your attempts, average score and best score at a glance.</p></div>
<div class="card"><h3>Badges</h3><p>Earn five badges as you practise, from your first attempt to a perfect score.</p></div></div>
<ul style="margin-top:20px"><li><strong>First steps:</strong> complete your first attempt.</li><li><strong>Sharp:</strong> score 80% or more.</li><li><strong>Consistent:</strong> complete five attempts.</li><li><strong>All-rounder:</strong> try every subject.</li><li><strong>Perfect:</strong> score 100%.</li></ul></section>
<section class="sec"><h2>Designed to be dependable</h2><div class="g3">
<div class="card"><h3>Keyboard friendly</h3><p>Every page can be used without a mouse, using Tab, arrow keys and Enter.</p></div>
<div class="card"><h3>Light and dark themes</h3><p>Switch themes from the header. Your choice is remembered.</p></div>
<div class="card"><h3>Responsive layout</h3><p>The same site adapts to phones, tablets and desktops.</p></div></div></section>
<section class="sec"><h2>Frequently asked questions</h2>
    <details><summary>Do I need an account?</summary><p>Yes, but it is free. Sign up with your name and email to start practising.</p></details>
    <details><summary>Where are my results stored?</summary><p>In the database, under your own account. Each student sees only their own attempts.</p></details>
    <details><summary>Is my password safe?</summary><p>Passwords are salted and hashed before they are stored, and are never saved as plain text.</p></details>
<details><summary>How long does a quiz take?</summary><p>You have 15 minutes to answer all 20 questions, and the quiz submits itself when time runs out.</p></details>
<details><summary>Can I retake a quiz?</summary><p>Yes, as often as you like. Questions are shuffled each time and every attempt is saved to your record.</p></details>
<details><summary>Which devices does it work on?</summary><p>Any modern browser on a phone, tablet or computer.</p></details>
  </section>
  <section class="cta"><h2>Ready for your first attempt?</h2><p>Create a free account and take your first 20-question quiz today.</p><a class="btn primary" href="${ctx}/register">Sign up free</a></section>
</main>
<%@ include file="/WEB-INF/views/footer.jspf" %>
