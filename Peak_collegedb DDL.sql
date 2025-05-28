-- Creating Entities

CREATE TABLE lecturers (lecturer_id SERIAL PRIMARY KEY, 
                        name VARCHAR, 
						qualifications VARCHAR(250),
						department_id INT (50),
						phone_number CHAR (13));

CREATE TABLE programs (program_id SERIAL PRIMARY KEY,
                       program_name VARCHAR,
					   program_level_id INT,
					   duration VARCHAR (15),
					   department_ID INT);

CREATE TABLE program_level (program_level_id SERIAL,
                            level_name VARCHAR (13));

CREATE TABLE department (department_id SERIAL PRIMARY KEY,
                         department_name VARCHAR (50),
						 head_of_department VARCHAR (100),
						 faculty_id INT);

CREATE TABLE faculty (faculty_id SERIAL PRIMARY KEY,
                      faculty_name VARCHAR (50),
					  dean_of_faculty VARCHAR (100));

CREATE TABLE major (major_id SERIAL PRIMARY KEY,
                    major_name VARCHAR (100),
					department_id INT,
					award_id INT,
					duration VARCHAR (15));


CREATE TABLE students (student_id SERIAL PRIMARY KEY,
                       full_name VARCHAR (100),
					   email VARCHAR (50),
					   DOB DATE,
					   gender VARCHAR (20),
					   major_id INT,
					   admission_date DATE,
					   level VARCHAR(30),
					   CGPA NUMERIC);
					   
CREATE TABLE course (course_id SERIAL PRIMARY KEY,
                     course_name VARCHAR (150),
					 course_description VARCHAR,
					 semester VARCHAR,
					 credit_hours VARCHAR);

CREATE TABLE major_course (major_id INT,
                           course_id INT);

CREATE TABLE lecturer_course (lecturer_id INT,
                              course_id INT,
							  semester VARCHAR (20),
							  academic_session VARCHAR (10));

CREATE TABLE student_course (student_id INT,
                             course_id INT,
							 semester VARCHAR (10),
							 academic_session VARCHAR (10),
							 grade CHAR (2) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F')));

-- Altering Entities

ALTER TABLE program_level ADD PRIMARY KEY (program_level_id);

ALTER TABLE department ADD COLUMN head_of_department INT;

ALTER TABLE lecturers ADD FOREIGN KEY (department_id) REFERENCES department (department_id);

ALTER TABLE programs ADD FOREIGN KEY (department_id) REFERENCES department (department_id);

ALTER TABLE programs ADD FOREIGN KEY (program_level_id) REFERENCES program_level (program_level_id);

ALTER TABLE department ADD FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id);

ALTER TABLE faculty ADD FOREIGN KEY (dean_of_faculty) REFERENCES lecturers (lecturer_id);

ALTER TABLE major ADD FOREIGN KEY (department_id) REFERENCES department (department_id);

ALTER TABLE major ADD FOREIGN KEY (award_id) REFERENCES programs (program_id);

ALTER TABLE students ADD FOREIGN KEY (major_id) REFERENCES major (major_id); 

ALTER TABLE major_course ADD FOREIGN KEY (major_id) REFERENCES major (major_id);

ALTER TABLE major_course ADD FOREIGN KEY (course_id) REFERENCES course (course_id);

ALTER TABLE lecturer_course ADD FOREIGN KEY (lecturer_id) REFERENCES lecturers (lecturer_id);

ALTER TABLE lecturer_course ADD FOREIGN KEY (course_id) REFERENCES course (course_id);

ALTER TABLE student_course ADD FOREIGN KEY (student_id) REFERENCES students (student_id);

ALTER TABLE student_course ADD FOREIGN KEY (course_id) REFERENCES course (course_id);