### Case Study : 1
Suppose you are given the following requirements for a simple database for the
National Hockey League (NHL):
the NHL has many teams,

1. each team has a name, a city, a coach, a captain, and a set of players,
2. each player belongs to only one team,
3. each player has a name, a position (such as left wing or goalie), a skill level, and a set of injury records,
4. a team captain is also a player,
5. a game is played between two teams (referred to as host_team and guest_team) and has a date (such as May 11th, 1999) and a score (such as 4 to 2).

Construct a clean and concise ER diagram for the NHL database.




### Case Study : 2
A university registrar’s office maintains data about the following entities:

1. courses, including number, title, credits, syllabus, and prerequisites;
2. course offerings,  including  course  number,  year,  semester,  section  number, instructor(s), timings, and classroom;
3. students, including student-id, name, and program;
4. instructors, including identi-cation number, name, department, and title.

Further, the enrollment of students in courses and grades awarded to students in each course they are enrolled for must be appropriately modeled. Construct an E-R diagram for the registrar’s of-ce.Document all assumptions that you make about the mapping constraints.


### Case Study : 3
Consider  a  university  database  for  the  scheduling  of  classrooms  for  -final  exams. This database could be modeled as the single entity set exam, with attributes course-name, section- number, room-number, and time. Alternatively,  one or more additional entity sets could be defined, along with relationship sets to replace some of the attributes of the exam entity set, as

1. course with attributes name, department, and c-number
2. section  with  attributes  s-number  and  enrollment,  and  dependent  as  a weak entity set on course
3. room with attributes r-number, capacity, and building

Show an E-R diagram illustrating the use of all three additional entity sets listed.


### Case Study : 4
Construct an ER Diagram for Company having following details : 
 
Company organized into DEPARTMENT. Each department has unique name 
and a particular employee who  manages the department. Start date for the manager is
recorded. Department may have several locations. 
 
A department controls a number of PROJECT. Projects have a unique name, 
number and a single location. 
 
Company’s EMPLOYEE name, ssno, address, salary, sex and birth date 
are recorded. An employee is assigned to one department, but may work for several
projects (not necessarily controlled by her dept). Number of
hours/week an employee works on each project is recorded; The immediate supervisor
for the employee. 
 
Employee ’s DEPENDENT are tracked for health insurance purposes (dependent 
name, birthdate, relationship to employee).
