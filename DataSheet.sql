-- SET SCHEMA '"D:WT CODEWT 1 2017VISUAL STUDIO 2015PROJECTSDATASHEETDATASHEETAPP_DATADATASHEET.MDF"';
 
/* SQLINES DEMO *** le [dbo].[Courses]    Script Date: 10/8/2018 9:42:36 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Courses(
	CourseId SERIAL,
	Code varchar(8) NULL,
	Title varchar(100) NULL,
	CrHr int NULL,
	Semester int NULL,
    PRIMARY KEY(CourseId) 
);
/* SQLINES DEMO *** le [dbo].[Grades]    Script Date: 10/8/2018 9:42:36 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Grades(
	GradeId int NOT NULL,
	Start int NULL,
	"End" int NULL,
	Grade varchar(4) NULL,
	Points varchar(5) NULL,
    PRIMARY KEY(GradeId) 
);
/* SQLINES DEMO *** le [dbo].[Registration]    Script Date: 10/8/2018 9:42:36 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Registration(
	RegId SERIAL,
	CourseId int NULL,
	RegNo varchar(10) NULL,
	GradeId int NULL,
    PRIMARY KEY(RegId) 
);
/* SQLINES DEMO *** le [dbo].[Students]    Script Date: 10/8/2018 9:42:36 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Students(
	RegNo varchar(10) NOT NULL,
	StudentName varchar(100) NULL,
	FatherName varchar(100) NULL,
    PRIMARY KEY(RegNo) 
);
/* SET IDENTITY_INSERT [dbo].[Courses] ON */ 

INSERT INTO Courses (CourseId, Code, Title, CrHr, Semester) VALUES
(1, 'CS1102', 'Calculus and Analytical Geometry', 3, 1),
(2, 'CS1111', 'English Composition and Comprehension', 3, 1),
(3, 'CS1114', 'Introduction to Computer Sciences', 4, 1),
(4, 'CS1118', 'Fundamentals of Programming', 4, 1),
(5, 'CS1206', 'Islamiat and Pakistan Studies / Humanities', 3, 1),
(6, 'CS1108', 'Object Oriented Programming', 3, 2),
(7, 'CS1211', 'Technical and Business Writing', 3, 2),
(8, 'CS1215', 'Physics and Basic Electronics', 4, 2),
(9, 'CS2414', 'Multivariate Calculus', 3, 2),
(10, 'CS3505', 'Discrete Mathematical Structures', 3, 2),
(11, 'CS1205', 'Oral Communication and Presentation Skills', 3, 3),
(12, 'CS2305', 'Linear Algebra and Differential Equations', 3, 3),
(13, 'CS2313', 'Data Structures and Algorithms', 3, 3),
(14, 'CS2317', 'Digital Logic Design', 4, 3),
(15, 'CS2318', 'Operating Systems Concepts', 4, 3),
(16, 'CS1212', 'Statistics and Probability', 3, 4),
(17, 'CS2411', 'Computer Organization and Assembly Language', 3, 4),
(18, 'CS2417', 'Introduction to Software Development', 4, 4),
(19, 'CS2418', 'Computer Data Communications and Networks', 4, 4),
(20, 'CS2421', 'Relational Database Systems', 4, 4),
(21, 'CS2314', 'Finite Automata Theory and Formal Languages', 3, 5),
(22, 'CS2315', 'Web Engineering', 3, 5),
(23, 'CS2415', 'Human Computer Interaction', 3, 5),
(24, 'CS3517', 'Software Engineering Concepts', 4, 5),
(25, 'CS3521', 'Computer Architecture', 4, 5),
(26, 'CS3607', 'Advanced Web Technologies', 3, 6),
(27, 'CS3611', 'Analysis of Algorithms', 3, 6),
(28, 'CS3612', 'Software Engineering-II', 3, 6),
(29, 'CS3619', 'Numerical and Symbolic Computation', 3, 6),
(30, 'CS3624', 'Compiler Construction', 3, 6),
(31, 'CS4615', 'Android Application Development', 3, 7),
(32, 'CS4702', 'Artificial Intelligence', 3, 7),
(33, 'CS4704', 'Project-I', 3, 7),
(34, 'CS4805', 'Professional Practices', 3, 7),
(35, 'CS4828', 'Auditing Information Systems', 3, 7),
(36, 'CS4617', 'iOS Development', 3, 8),
(37, 'CS4619', 'Data Warehouse Techniques', 3, 8),
(38, 'CS4732', 'Software Quality Assurance', 3, 8),
(39, 'CS4802', 'Research Report', 3, 8),
(40, 'CS4804', 'Project-II', 3, 8);

INSERT INTO Grades (GradeId, Start, "End", Grade, Points) VALUES 
(1, 95, 100, 'A+', '4.00'),
(2, 91, 94, 'A', '3.75'),
(3, 87, 90, 'A-', '3.50'),
(4, 83, 86, 'B+', '3.25'),
(5, 79, 82, 'B', '3.00'),
(6, 75, 78, 'B-', '2.75'),
(7, 71, 74, 'C+', '2.50'),
(8, 68, 70, 'C', '2.25'),
(9, 65, 67, 'C-', '2.00'),
(10, 60, 64, 'D', '1.00'),
(11, 0, 59, 'F', '0.00');

INSERT INTO Students (RegNo, StudentName, FatherName) VALUES 
('1112101', 'Abdul Majeed Memon', 'Abdul Sattar Memon'),
('1112102', 'Abdullah Shabbir Ahmed', 'Shabbir Ahmed'),
('1112103', 'Ali Zaman Khan', 'Ghulam Shabir'),
('1112104', 'Aroon Kumar Pirwani', 'Saturgun Pirwani'),
('1112105', 'Changez Khan', 'Irshad Ali'),
('1112106', 'Farrukh Shuja', 'Shuja Uddin'),
('1112107', 'Gulandam Shireen', 'Farrukh Aqil'),
('1112108', 'Haider Ali', 'Sarfraz Ahmed'),
('1112109', 'Hamdah Khan', 'Ehtisham Ahmed Khan'),
('1112110', 'Haseeb Ashfaq', 'Ashfaq Ahmed'),
('1112111', 'Karim Shaheen Sopariwala', 'Shaheen'),
('1112112', 'Mahaveer Lakhani', 'Mahander Dev'),
('1112113', 'Mawis Anis', 'Anis Ul Hassan'),
('1112114', 'Mohammad Anas Gulahmed Sandia', 'Gulahmed'),
('1112115', 'Mohammed Emad Zain', 'Zainul Abedin'),
('1112116', 'Muhammad Waqas Suboor', 'Mohd Zafar Us Suboor'),
('1112117', 'Muhammed Sabat Akhtar', 'Shamim'),
('1112118', 'Munawar Janat Ali', 'Janat Ali'),
('1112119', 'Nabeel Ali Sheikh', 'Viqar'),
('1112120', 'Nabil Noor Ali Sunesara', 'Noor Ali'),
('1112121', 'Qaim Karim Bhai Maknojia', 'Karim Bhai Maknojia'),
('1112122', 'Rahul Rai Aswani', 'Nathur Mal'),
('1112123', 'Safwan Ummar Butt', 'Ummar Abdullah'),
('1112124', 'Salima Abdul Aziz Golani', 'Abdul Aziz Golani'),
('1112125', 'Sana Shivani', 'Saleem Shivani'),
('1112126', 'Sandesh Kumar Talib', 'Dr Partab Rai'),
('1112127', 'Shahzad Khoja', 'Karim'),
('1112128', 'Sidra Aziz', 'Abdul Aziz'),
('1112129', 'Sumair Saleem Roudani', 'Salem'),
('1112130', 'Syed Muhammad Owais Qadri', 'Syed Inayatullah Qadri'),
('1112131', 'Syed Muhammad Umer Rizvi', 'Shahtaj Rizvi'),
('1112132', 'Syeda Maleeha Taqi', 'Syed Mohammad Taqi'),
('1112133', 'Zubair Islam', 'Muhmmad Islam'),
('1112134', 'Adeel Hussain', 'Imtiaz'),
('1112135', 'Ali Mobin Memon', 'Mobin Ahmed'),
('1112136', 'Azeem Rafiq Ali Maradya', 'Rafiq Ali'),
('1112137', 'Bilal Soulat', 'Soulat Sikander'),
('1112138', 'Danish Abdul Waheed', 'Abdul Waheed'),
('1112139', 'Daniyal Ahmed', 'Afzal Ahmed'),
('1112140', 'Fahim Nasir', 'Muhammad Nasir'),
('1112141', 'Faisal Ahmed', 'Maula Bakhsh'),
('1112142', 'Farooq Khan', 'Iqbal Khan'),
('1112143', 'Ghazanfar Ali Khatyani', 'Muzaffar Ali Khatyan'),
('1112144', 'Hammad Hassan', 'Nasarullah Khan'),
('1112145', 'Hassaan Masood', 'Muhammad Masood'),
('1112146', 'Javeria Aslam', 'Syed Aslam Ali'),
('1112147', 'Mansoor Ali Khoso', 'Mahboob Ali Khoso'),
('1112148', 'Mashmuma Qurban Ali', 'Qurban Ali'),
('1112149', 'Moomal Mahar', 'Abdul Razak Mahar'),
('1112150', 'Muhammad Adnan', 'Yaqub Ali'),
('1112151', 'Muhammad Mushahid Ansari', 'Muhammad Khalid'),
('1112152', 'Muhammad Talha Dhedhi', 'Haji Abdul Ghani Dhe'),
('1112153', 'Nadeem Ahmed Channa', 'Shahzado Channa'),
('1112154', 'Nimra Mir Arshad', 'Arshad Iqbal Mir'),
('1112155', 'Omaid Zunnoon Farooqui', 'Zunnoon Farooqui'),
('1112156', 'Prem Kumar', 'Partab Rai'),
('1112157', 'Rabilshah Rahim Ali Karedia', 'Rahim Ali'),
('1112158', 'Saad Rafiq Manai', 'Rafiq Manai'),
('1112159', 'Saba Altaf Mirani', 'Altaf Mirani'),
('1112160', 'Shaheryar Mirza', 'Pervez Iqbal Mirza'),
('1112161', 'Shahrukh Ahmed Qureshi', 'Kamran Qureshi'),
('1112162', 'Shahzad Ahsan Soomro', 'Allah Rakhyo'),
('1112163', 'Shariq Tahir', 'Tahir Yusuf'),
('1112164', 'Talha Zafar Kazi', 'Zafar Raza Kazi'),
('1112165', 'Umair Ahmed', 'Manzoor Ahmed'),
('1112166', 'Zeeshan Mehboob Alam Nathwani', 'Mehboob Alam'),
('1112167', 'Abbas Saifuddin Mundrawala', 'Saifuddin'),
('1112168', 'Abdul Zahir Magsi', 'Wahid Bakhsh Magsi'),
('1112169', 'Ali Ahmed Momin', 'Ali Ahmed'),
('1112170', 'Ali Hussain Piyar Ali Momin', 'Piyar Ali'),
('1112171', 'Arooba Qamar', 'Qamar Uz Zaman Khan'),
('1112172', 'Azlan Shahid Allahwala', 'Shahid Allahwala'),
('1112173', 'Batool Ghulam Abbas', 'Ghulam Abbas'),
('1112174', 'Deepak Kumar Pirwani', 'Sham Lal'),
('1112175', 'Syed Fahad Ali Shah', 'Syed Aftab Ali Shah'),
('1112176', 'Fahad Rehman Soomro', 'Aziz Ul Rehman'),
('1112177', 'Ghulam Akber', 'Umer Farooq'),
('1112178', 'Humnah Shahwar', 'Muhammad Muslim Sidd'),
('1112179', 'Junaid Naveed Gaju', 'Jadam Gaju'),
('1112180', 'Malik Muhammad Kaleem', 'Mushtaq Ahmed'),
('1112181', 'Khizar Khalid', 'Khalid Bashir'),
('1112182', 'Laraib Vaqar Patoli', 'Vaqar Ahmed Patoli'),
('1112183', 'Maahin Ahmad Khan', 'Farrukh Ahmad Khan'),
('1112184', 'Mirza Hassan Baig', 'Mirza Naseem Baig'),
('1112185', 'Mirza Ahsan Baig', 'Mirza Naseem Biag'),
('1112186', 'Mohammad Saad Abdul Rahim', 'Abdul Rahim'),
('1112187', 'Mohammadali Heidarian', 'Saeed Heidarian'),
('1112188', 'Muhammad Bilal Akhund', 'Fareed Ahmed'),
('1112189', 'Muhammad Farrukh Ali', 'Muhammad Ali Bhabha'),
('1112190', 'Muhammad Saad Akhtar', 'Saleem Akhtar'),
('1112191', 'Pir Faraz Ali', 'Pir Saifullah'),
('1112192', 'Rabia Farid Malik', 'Farid Masud Malik'),
('1112193', 'Saad Aftab', 'Aftab Nabi'),
('1112194', 'Sana Hanifa Yaqoob', 'Yaqoob Yosuf'),
('1112195', 'Syed Haider Hassan', 'Kausar Hassan'),
('1112196', 'Syed Muhammad Hasnain Haider', 'Syed Mohammad Haider'),
('1112197', 'Syed Muhammad Waheeb Ul Hassan', 'Syed Muhammad Qsim'),
('1112198', 'Umair Junaid Patel', 'Junaid Patel'),
('1112199', 'Vikash Kumar', 'Har Kirshan'),
('1112200', 'Asad Farooq', 'Nadeem Farooq'),
('1112201', 'Hussain Mustafa', 'Mustafa Hussain'),
('1112202', 'Marium Jawaid Dost Muhammad', 'Jawaid Dost Muhammad'),
('1112203', 'Shaheer Sohail', 'Muhammad Sohail'),
('1112204', 'Asfand Yar Ahmed', ''),
('1112205', 'Muhammad Shoaib', 'Muhammad Amjad');

ALTER TABLE Registration ADD FOREIGN KEY(CourseId)
REFERENCES Courses (CourseId);
 
ALTER TABLE Registration ADD FOREIGN KEY(GradeId)
REFERENCES Grades (GradeId);
 
ALTER TABLE Registration ADD FOREIGN KEY(RegNo)
REFERENCES Students (RegNo);
 
