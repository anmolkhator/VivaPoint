CREATE DATABASE IF NOT EXISTS vivapoint CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE vivapoint;

CREATE TABLE IF NOT EXISTS users (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  email         VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS questions (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  subject     VARCHAR(20)  NOT NULL,
  question    VARCHAR(500) NOT NULL,
  opt_a       VARCHAR(255) NOT NULL,
  opt_b       VARCHAR(255) NOT NULL,
  opt_c       VARCHAR(255) NOT NULL,
  opt_d       VARCHAR(255) NOT NULL,
  correct     TINYINT      NOT NULL,          -- 0 = A, 1 = B, 2 = C, 3 = D
  explanation VARCHAR(500),
  INDEX idx_subject (subject)
);

CREATE TABLE IF NOT EXISTS attempts (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  user_id  INT         NOT NULL,
  subject  VARCHAR(20) NOT NULL,
  score    INT         NOT NULL,
  total    INT         NOT NULL,
  taken_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user (user_id)
);

-- Question bank (subject keys: python, dbms, net)
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which data type is immutable?','list','dict','tuple','set',2,'Tuples cannot be changed after creation; lists, dicts and sets can.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does len({1, 2, 2, 3}) return?','4','3','2','Error',1,'A set removes duplicates, so it holds 1, 2 and 3.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which keyword defines a function?','func','define','def','lambda only',2,'Functions are defined with def.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What is the output of 7 // 2?','3.5','3','4','2',1,'// is floor division, so 7 // 2 is 3.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which statement handles an exception?','catch','except','rescue','handle',1,'Python uses try / except.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which of these is a valid variable name?','2x','my_var','my-var','class',1,'Names use letters, digits and underscores, and cannot start with a digit.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','type([]) returns which type?','tuple','list','dict','array',1,'[] is an empty list.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which method adds an item to the end of a list?','add()','push()','append()','insert_end()',2,'append() adds one item at the end.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does range(3) produce?','1, 2, 3','0, 1, 2','0, 1, 2, 3','3 only',1,'range starts at 0 and stops before 3.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which keyword skips to the next loop iteration?','break','pass','continue','next',2,'continue jumps to the next iteration.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What is the result of "ab" * 3?','ab3','ababab','Error','a b a b a b',1,'String repetition joins the copies together.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which module handles regular expressions?','regex','re','rx','string',1,'The built-in re module.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does self refer to in a method?','The class','The current instance','The parent class','A global',1,'self is the object the method is called on.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which operator checks identity, not equality?','==','is','=','in',1,'is compares object identity.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','How do you open a file so it closes automatically?','open() only','with open()','file.start()','try only',1,'A with block closes the file for you.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What is a lambda?','A loop','An anonymous function','A module','A class',1,'lambda creates a small unnamed function.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which collection stores key-value pairs?','list','tuple','dict','set',2,'A dict maps keys to values.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does pip do?','Compiles code','Installs packages','Formats code','Runs tests',1,'pip installs and manages packages.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What is bool("")?','True','False','None','Error',1,'Empty strings are falsy.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which keyword makes a generator produce a value?','return','yield','emit','gen',1,'yield pauses and hands back a value.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which key uniquely identifies each row in a table?','Foreign key','Primary key','Candidate index','Super column',1,'A primary key uniquely identifies each record.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which SQL clause filters grouped results?','WHERE','ORDER BY','HAVING','LIMIT',2,'HAVING filters after GROUP BY; WHERE filters rows before grouping.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What does the “A” in ACID stand for?','Availability','Atomicity','Accuracy','Authority',1,'Atomicity means a transaction happens fully or not at all.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which normal form removes partial dependencies?','1NF','2NF','3NF','BCNF only',1,'2NF removes partial dependency on part of a composite key.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which join returns all rows from the left table?','INNER JOIN','RIGHT JOIN','LEFT JOIN','CROSS JOIN',2,'LEFT JOIN keeps every row from the left table.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which command removes a table completely?','DELETE','TRUNCATE','DROP','REMOVE',2,'DROP deletes the table and its structure.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which command adds new rows?','INSERT','UPDATE','ALTER','SELECT',0,'INSERT adds rows.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What does SELECT DISTINCT do?','Sorts rows','Removes duplicate rows','Counts rows','Joins tables',1,'It returns unique rows only.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','A foreign key is used to…','Speed up sorting','Link two tables','Encrypt data','Store backups',1,'It references a key in another table.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which aggregate function counts rows?','SUM','COUNT','AVG','MAX',1,'COUNT returns the number of rows.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which normal form removes transitive dependency?','1NF','2NF','3NF','4NF',2,'3NF removes transitive dependencies.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What does DDL stand for?','Data Definition Language','Data Delivery Layer','Direct Data Link','Database Design Logic',0,'DDL defines structure: CREATE, ALTER, DROP.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which command saves a transaction permanently?','ROLLBACK','COMMIT','SAVE','CLOSE',1,'COMMIT makes changes permanent.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which structure do most indexes use?','Stack','B-tree','Queue','Array',1,'B-trees keep lookups fast.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What is a view?','A copy of a table','A stored query shown as a virtual table','A backup file','A user role',1,'A view is a saved query.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which operator matches a text pattern?','LIKE','MATCHES','IN','BETWEEN',0,'LIKE works with % and _ wildcards.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What is a deadlock?','Two transactions waiting on each other forever','A full table','A slow query','A missing index',0,'Each holds a lock the other needs.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which relationship needs a junction table?','One-to-one','One-to-many','Many-to-many','Self only',2,'A junction table links both sides.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which command changes existing rows?','MODIFY','UPDATE','CHANGE','SET ROW',1,'UPDATE changes existing data.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What is a candidate key?','Any column','A minimal set of columns that identifies a row','A repeated value','A foreign key',1,'The primary key is chosen from candidate keys.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','How many layers does the OSI model have?','4','5','7','9',2,'OSI has seven layers, from physical to application.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which protocol resolves domain names to IP addresses?','DHCP','DNS','ARP','FTP',1,'DNS maps names to IP addresses.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which transport protocol is connectionless?','TCP','UDP','HTTP','SMTP',1,'UDP sends datagrams without a connection.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What is the default port for HTTPS?','80','21','443','8080',2,'HTTPS uses port 443.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which device forwards packets between networks?','Hub','Switch','Router','Repeater',2,'Routers forward packets between different networks.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which OSI layer handles routing?','Data link','Network','Transport','Session',1,'The network layer routes packets.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does an IP address identify?','An application','A device on a network','A page title','A user',1,'It identifies a network interface.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which protocol assigns IP addresses automatically?','DNS','DHCP','SNMP','ICMP',1,'DHCP leases addresses.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','How many bits is an IPv4 address?','16','32','64','128',1,'IPv4 uses 32 bits.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which protocol sends email?','SMTP','FTP','SNMP','HTTP',0,'SMTP sends mail between servers.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which tool uses ICMP to test reachability?','ping','scp','telnet','nslookup',0,'ping sends ICMP echo requests.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does ARP map?','IP to MAC address','Name to IP','Port to protocol','URL to file',0,'ARP finds a MAC for an IP.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which topology connects every node to a central device?','Bus','Ring','Star','Mesh',2,'Star topology uses a hub or switch.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What is the default SSH port?','22','23','25','53',0,'SSH uses port 22.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which device works at the data link layer?','Router','Switch','Repeater','Modem only',1,'Switches forward frames by MAC address.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does NAT do?','Encrypts traffic','Translates private to public addresses','Assigns names','Blocks viruses',1,'NAT shares one public address.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which protocol encrypts web traffic?','TLS','ARP','RIP','UDP',0,'HTTPS runs over TLS.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What is the IPv4 loopback address?','10.0.0.1','127.0.0.1','192.168.0.1','255.255.255.0',1,'127.0.0.1 points to your own machine.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does latency measure?','Data size','Delay in delivery','Signal colour','Cable length only',1,'Latency is the time data takes to arrive.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which protocol transfers web pages?','HTTP','POP3','SSH','DHCP',0,'HTTP transfers web content.');

-- Extra questions and subjects (java, web, os)
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does len("Hello") return?','4','5','6','Error',1,'It counts characters: 5.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which symbol starts a single-line comment?','//','#','--','/*',1,'Python comments start with #.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What is the output of 2 ** 3?','6','8','9','5',1,'** is exponentiation.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which function reads user input as a string?','scan()','input()','read()','get()',1,'input() returns text.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does list(range(1, 4)) give?','[1, 2, 3]','[1, 2, 3, 4]','[0, 1, 2, 3]','[2, 3, 4]',0,'The stop value is excluded.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which method removes and returns the last list item?','remove()','pop()','delete()','discard()',1,'pop() takes the last item by default.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does "abc".upper() return?','abc','ABC','Abc','None',1,'upper() returns an uppercase copy.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','Which keyword is used to import a module?','include','using','import','require',2,'Python uses import.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What is the type of 3.14?','int','float','double','decimal',1,'Decimal numbers are float.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('python','What does __init__ do in a class?','Deletes an object','Initialises a new object','Imports a module','Defines a loop',1,'It runs when an object is created.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which SQL clause sorts the result?','GROUP BY','ORDER BY','SORT','WHERE',1,'ORDER BY sorts rows.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which command creates a new table?','MAKE TABLE','CREATE TABLE','NEW TABLE','ADD TABLE',1,'CREATE TABLE defines a table.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What does DML stand for?','Data Manipulation Language','Data Mapping Layer','Direct Modelling Language','Database Management Logic',0,'DML covers INSERT, UPDATE and DELETE.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which function returns the highest value in a column?','TOP()','MAX()','HIGH()','LARGEST()',1,'MAX() returns the maximum.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What does the I in ACID stand for?','Integrity','Isolation','Indexing','Inheritance',1,'Isolation keeps concurrent transactions apart.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which constraint prevents NULL values?','UNIQUE','NOT NULL','CHECK','DEFAULT',1,'NOT NULL rejects missing values.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What is an ER diagram used for?','Writing queries','Modelling entities and relationships','Backing up data','Encrypting tables',1,'It models data before tables are built.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','Which join returns only matching rows from both tables?','FULL JOIN','INNER JOIN','LEFT JOIN','CROSS JOIN',1,'INNER JOIN keeps matches only.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What does ROLLBACK do?','Saves changes','Undoes uncommitted changes','Deletes the table','Creates an index',1,'It reverts the transaction.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('dbms','What is a super key?','A key stored in a view','A set of columns that uniquely identifies a row','Only the primary key','A foreign key',1,'It may include extra columns.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which OSI layer does TCP work at?','Network','Transport','Session','Application',1,'TCP is a transport layer protocol.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What is the purpose of a subnet mask?','Encrypt data','Separate network and host parts of an address','Assign names','Speed up DNS',1,'It splits network and host bits.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which protocol retrieves email from a server?','SMTP','IMAP','FTP','ARP',1,'IMAP and POP3 retrieve mail.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does FTP transfer?','Emails','Files','Web pages only','Domain names',1,'FTP is the File Transfer Protocol.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which address is unique to a network card?','IP address','MAC address','Port number','Gateway',1,'MAC addresses belong to the hardware.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','How many bits is an IPv6 address?','32','64','128','256',2,'IPv6 uses 128 bits.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which device connects a LAN to the internet?','Switch','Router','Hub','Repeater',1,'Routers connect different networks.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does a firewall do?','Assigns IPs','Filters network traffic','Resolves names','Boosts signal',1,'It allows or blocks traffic by rules.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','Which port does DNS use?','25','53','80','110',1,'DNS uses port 53.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('net','What does HTTP status 404 mean?','Server error','Not found','Redirect','Unauthorised',1,'The resource was not found.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which keyword creates a subclass?','implements','extends','inherits','super',1,'extends sets the parent class.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What is the entry point of a Java program?','start()','main()','run()','init()',1,'public static void main.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which type stores true or false?','int','boolean','bit','char',1,'boolean holds true or false.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What does JVM stand for?','Java Virtual Machine','Java Variable Method','Joint Verification Module','Java Visual Manager',0,'The JVM runs bytecode.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which keyword prevents a class from being inherited?','static','final','abstract','private',1,'A final class cannot be extended.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which collection does not allow duplicates?','ArrayList','HashSet','LinkedList','Vector',1,'Sets store unique elements.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What does the static keyword mean?','Belongs to the class, not an object','Cannot change','Is private','Runs once',0,'Static members belong to the class.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which exception is thrown for an invalid array index?','NullPointerException','ArrayIndexOutOfBoundsException','IOException','ClassCastException',1,'The index is beyond the array length.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which blocks handle exceptions in Java?','try-catch','try-except','catch-throw','handle-error',0,'Use try and catch blocks.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What is method overloading?','Same name, different parameters','Same signature in a subclass','Calling a method twice','Hiding a method',0,'Overloads differ in their parameters.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which interface makes objects sortable by Collections.sort?','Runnable','Comparable','Serializable','Cloneable',1,'Comparable defines natural order.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What is the default value of an int field?','null','0','1','undefined',1,'Numeric fields default to 0.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which keyword refers to the current object?','self','this','current','me',1,'this refers to the current instance.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What does JDBC stand for?','Java Database Connectivity','Java Data Base Control','Joint Database Code','Java Direct Binding',0,'JDBC connects Java to databases.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which class is the root of all Java classes?','Main','Object','Class','Root',1,'Every class extends Object.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which statement exits a loop immediately?','stop','break','exit','skip',1,'break leaves the loop.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which access modifier is visible everywhere?','private','protected','public','default',2,'public has no restriction.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What is an abstract class?','A class that cannot be instantiated','A class with no methods','A final class','A static class',0,'It may declare abstract methods.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which package contains the Scanner class?','java.io','java.util','java.lang','java.net',1,'Scanner is in java.util.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which keyword is used to implement an interface?','extends','implements','inherits','uses',1,'A class implements interfaces.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What does a constructor return?','void','Nothing, it has no return type','int','The object name',1,'Constructors have no return type.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which of these is a checked exception?','IOException','NullPointerException','ArithmeticException','IndexOutOfBoundsException',0,'Checked exceptions must be handled.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which loop always runs at least once?','for','while','do-while','foreach',2,'do-while tests after the body.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which method compares string content?','==','equals()','compare()','same()',1,'equals() compares the text.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What does garbage collection do?','Deletes files','Frees unused objects from memory','Compiles code','Closes the JVM',1,'It reclaims unreachable objects.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which servlet method handles an HTTP GET request?','doGet()','getRequest()','handleGet()','service()',0,'doGet handles GET requests.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What is the extension of compiled Java code?','.java','.class','.exe','.obj',1,'javac produces .class files.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which keyword calls the parent constructor?','parent','super','base','this',1,'super() calls the parent constructor.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','What does a JSP page compile into?','A servlet','A JAR file','A CSS file','A SQL script',0,'JSP pages become servlets.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('java','Which collection stores key-value pairs?','List','Map','Set','Queue',1,'A Map stores keys and values.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does HTML stand for?','HyperText Markup Language','High Text Machine Language','HyperTool Markup Logic','Home Text Markup Language',0,'HTML structures web pages.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which tag creates a hyperlink?','link','a','href','url',1,'The a element with href makes a link.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which CSS property changes text colour?','font-color','color','text-color','foreground',1,'Use the color property.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which tag makes the largest heading?','h6','h1','head','title',1,'h1 is the top heading level.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','How do you write a comment in CSS?','// comment','/* comment */','# comment','-- comment',1,'CSS comments use /* and */.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which JavaScript keyword declares a block-scoped variable?','var','let','def','dim',1,'let is block scoped.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does CSS stand for?','Cascading Style Sheets','Creative Style System','Computer Style Sheets','Colourful Style Syntax',0,'CSS styles HTML.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which HTTP method suits submitting a form with a password?','GET','POST','HEAD','TRACE',1,'POST keeps data out of the URL.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which tag holds the title shown in the browser tab?','title','h1','meta','header',0,'title goes inside head.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does === check in JavaScript?','Value only','Value and type','Type only','Reference only',1,'Strict equality compares both.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which CSS layout module arranges items in rows or columns?','Flexbox','Float','Table','Frames',0,'Flexbox is a one-dimensional layout.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which attribute gives an image alternative text?','title','alt','src','caption',1,'alt describes the image.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does DOM stand for?','Document Object Model','Data Object Method','Display Output Mode','Document Order Map',0,'The DOM represents the page as objects.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which method selects an element by its id?','getElementById()','selectId()','queryId()','findElement()',0,'Use document.getElementById().');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which CSS unit is relative to the root font size?','px','rem','pt','cm',1,'rem is relative to the root element.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which tag creates a bulleted list?','ol','ul','li','list',1,'ul is an unordered list.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does the viewport meta tag help with?','Sound','Responsive layout on mobile','Security','Caching',1,'It controls mobile scaling.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which method adds an item to the end of an array?','push()','add()','append()','insert()',0,'push() adds to the end.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which HTTP status code means success?','200','301','404','500',0,'200 means OK.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What is JSON?','A programming language','A text format for data','A database','A style sheet',1,'JavaScript Object Notation.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which CSS selector targets elements with class box?','#box','.box','box','*box',1,'Class selectors start with a dot.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which tag embeds JavaScript in a page?','js','script','code','javascript',1,'The script element holds JavaScript.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does AJAX allow?','Reloading the whole page','Updating parts of a page without reloading','Styling pages','Compiling Java',1,'Asynchronous requests update content.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which input type hides typed characters?','text','password','hidden','secret',1,'Use type password.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which CSS property controls space outside the border?','padding','margin','spacing','gap',1,'Margin sits outside the border.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which function converts a JSON string to an object?','JSON.parse()','JSON.stringify()','JSON.object()','parseJSON()',0,'JSON.parse() reads JSON text.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does HTTPS add to HTTP?','Speed','Encryption','Caching','Compression',1,'It encrypts traffic using TLS.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which HTML5 element holds main navigation links?','nav','menu','links','navigate',0,'The nav element marks navigation.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','What does a media query do?','Plays video','Applies CSS based on screen conditions','Loads images','Validates forms',1,'It adapts styles to the device.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('web','Which event fires when a button is clicked?','onhover','onclick','onpress','onselect',1,'onclick runs on a click.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is the main role of an operating system?','Edit documents','Manage hardware and software resources','Browse the web','Compile code only',1,'It manages the computer''s resources.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is a process?','A program in execution','A stored file','A CPU core','A device driver',0,'A running instance of a program.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which scheduling algorithm runs the shortest job first?','FCFS','SJF','Round Robin','Priority only',1,'SJF picks the shortest burst.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does Round Robin scheduling use?','Priorities only','A time quantum','Job length','Memory size',1,'Each process gets a time slice.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is a deadlock?','Processes waiting on each other forever','A crashed disk','A full cache','A slow CPU',0,'Circular waiting blocks progress.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which is a necessary condition for deadlock?','Mutual exclusion','Preemption','Overflow','Paging',0,'Mutual exclusion is one of four conditions.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is virtual memory?','Extra RAM chips','Using disk space to extend memory','A cache type','A BIOS setting',1,'Disk space acts as an extension of RAM.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is paging?','Splitting memory into fixed-size blocks','Compressing files','Encrypting data','Sorting processes',0,'Memory is divided into pages and frames.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is thrashing?','Excessive paging that slows the system','A virus','Disk formatting','Fast booting',0,'Too much swapping wastes time.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does a semaphore help manage?','Synchronisation','File naming','Disk size','Boot order',0,'Semaphores coordinate access.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is a thread?','A lightweight unit of execution in a process','A disk sector','A network packet','A file type',0,'Threads share their process memory.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does the kernel do?','Runs only games','Is the OS core that manages hardware','Stores user files','Draws the desktop only',1,'The kernel is the core of the OS.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which page replacement policy removes the oldest page?','LRU','FIFO','Optimal','Random',1,'First In, First Out.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is a context switch?','Changing the screen','Saving one process state and loading another','Rebooting','Changing a file',1,'The CPU switches between processes.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does FCFS stand for?','First Come First Served','Fast CPU First Schedule','First Cache First Store','File Control File System',0,'Processes run in arrival order.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which memory is the fastest?','Hard disk','RAM','Cache','SSD',2,'Cache is faster than RAM.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is the critical section?','Code that accesses shared resources','The boot sector','A priority level','A kernel module',0,'Only one process should run it at a time.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is a system call?','A request from a program to the OS','A phone feature','A BIOS beep','A network ping',0,'Programs ask the kernel for services.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which Linux command lists files?','dir','ls','show','list',1,'ls lists files.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is spooling?','Queuing jobs for a slow device such as a printer','Defragmenting a disk','Booting from USB','Compiling code',0,'Jobs wait in a queue for the device.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is fragmentation?','Wasted or scattered memory','A virus','A network fault','A shell script',0,'Space is divided inefficiently.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which file system is native to Windows?','ext4','NTFS','APFS','XFS',1,'NTFS is the Windows file system.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does the shell do?','Provides a command interface to the OS','Manages disk blocks','Draws icons only','Cools the CPU',0,'It interprets user commands.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is a zombie process?','A finished process whose entry remains','A virus','A paused thread','A hidden file',0,'It has ended but has not been cleaned up.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does chmod do in Linux?','Changes file permissions','Changes the owner name','Moves files','Deletes files',0,'chmod sets permissions.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which allocation method gives a file one contiguous block?','Contiguous allocation','Linked allocation','Indexed allocation','Hashing',0,'The file occupies adjacent blocks.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is the bootloader?','A program that loads the OS at startup','A virus scanner','A file manager','A driver',0,'It starts the operating system.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What is mutual exclusion?','Only one process uses a resource at a time','Two processes share memory freely','A scheduling order','A type of cache',0,'It prevents simultaneous access.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','What does a Process Control Block store?','Process state and information','Only the file name','Network settings','Screen resolution',0,'The PCB tracks each process.');
INSERT INTO questions(subject,question,opt_a,opt_b,opt_c,opt_d,correct,explanation) VALUES ('os','Which Linux command shows running processes?','ps','ls','cd','mkdir',0,'ps lists processes.');
