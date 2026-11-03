# VivaPoint: Viva and Quiz Portal (Java Servlets, JSP, MySQL)

Sign up, log in, take 20-question timed quizzes (graded on the server) and see your own attempts.

## Stack
- Java 17+, Jakarta Servlets 6 and JSP 3.1 with JSTL, JDBC
- MySQL 8, Maven (WAR), Apache Tomcat 10.1 (needs the `jakarta.*` namespace; Tomcat 9 will not work)

## Setup
1. Create the database and load the 60 questions:
   `mysql --default-character-set=utf8mb4 -u root -p < sql/schema.sql`
2. Set your database login (defaults are `root` with an empty password and `jdbc:mysql://localhost:3306/vivapoint`):
   `DB_URL`, `DB_USER`, `DB_PASS` environment variables, set before starting Tomcat.
3. Build: `mvn clean package`
4. Copy `target/vivapoint.war` into Tomcat's `webapps` folder, start Tomcat, then open
   `http://localhost:8080/vivapoint/`

In Eclipse or IntelliJ you can instead import it as a Maven project and run it on a Tomcat 10.1 server.

## Structure
- `sql/schema.sql`: tables `users`, `questions`, `attempts`, plus seed questions
- `src/main/java/com/vivapoint`: servlets (`AuthServlet`, `DashboardServlet`, `QuizServlet`), filters (`AuthFilter`, `EncodingFilter`), DAOs, `PasswordUtil` (salted PBKDF2)
- `src/main/webapp`: public pages (`index.jsp`, `about.jsp`), `WEB-INF/views` (header, footer, login, register, dashboard, quiz, result), CSS and JS

## Ideas to extend
CSRF tokens on forms, an admin page to add questions, viva questions in the database, password reset.

## Upgrading an existing database
If you already ran `sql/schema.sql` earlier, run only `mysql --default-character-set=utf8mb4 -u root < sql/new-questions.sql` once. It adds the new subjects and questions. Running `schema.sql` again would duplicate the first 60 questions. Fresh installs just run `schema.sql`, which now includes everything.
