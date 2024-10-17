-- Create a database named 'Student'
CREATE DATABASE Student;

-- Create a table 'Chetan' in the 'Student' database with various columns such as Roll_no, First_Name, Last_Name, etc.
CREATE TABLE Student.Chetan
(
  Roll_no int,           -- Student's roll number (integer)
  First_Name varchar(25), -- Student's first name (up to 25 characters)
  Last_Name varchar(25),  -- Student's last name (up to 25 characters)
  Course_Name varchar(35), -- Name of the course the student is enrolled in (up to 35 characters)
  Fee int,               -- Course fee (integer)
  Age int,               -- Student's age (integer)
  Gender varchar(10),    -- Gender (up to 10 characters)
  Phone_No int           -- Phone number (currently set as an integer, may cause issues for large numbers)
);

-- Describe the structure of the table 'Chetan', showing all columns and their data types
DESC Student.Chetan;

-- Add a new column 'Father_Name' to the 'Chetan' table to store the student's father's name
ALTER TABLE Student.Chetan ADD Father_Name varchar(50);

-- Drop the 'Gender' column from the 'Chetan' table (removing it from the structure)
ALTER TABLE Student.Chetan DROP COLUMN Gender;

-- Drop the 'Chetan' table entirely, deleting its structure and data
DROP TABLE Student.Chetan;

-- Attempt to select all data from the 'Chetan' table (this will fail because the table was dropped in the previous step)
SELECT * FROM Student.Chetan;

-- Insert a new record into the 'Chetan' table with specific values (after recreating the table if needed)
-- Note: The 'Gender' column was removed earlier, so this will cause an error if the table wasn't recreated with it.
INSERT INTO Student.Chetan 
  (Roll_no, First_Name, Last_Name, Course_Name, Fee, Age, Gender, Phone_No, Father_Name) 
VALUES 
  (2001, 'Chetan', 'Kumar', 'CSE', 40000, 21, 'Male', 123456789, 'Mr.Singh');

-- Insert another record into the 'Chetan' table
INSERT INTO Student.Chetan 
VALUES 
  (2002, 'Gautam', 'Singh', 'CSE', 363000, 21, 'Male', 1235682, 'Mr.Singh');

-- Insert a third record into the 'Chetan' table
INSERT INTO Student.Chetan 
VALUES 
  (2003, 'Queen', 'Kaur', 'CSE', 346000, 21, 'Female', 12899567, 'Mr.Barbrain');

-- Modify the 'Phone_No' column to change its data type from 'int' to 'varchar(15)' to store larger phone numbers
ALTER TABLE Student.Chetan MODIFY Phone_No VARCHAR(15);

-- Select specific columns (Roll_no, First_Name, Last_Name, Course_Name) from the 'Chetan' table
SELECT Roll_no, First_Name, Last_Name, Course_Name FROM Student.Chetan;

-- Update the phone number for the student with Roll_no = 2001
UPDATE Student.Chetan 
SET Phone_No = '9464743515' -- Phone number is updated as a string now that it's a VARCHAR field
WHERE Roll_no = 2001;

-- Delete the record where Roll_no = 2003 (removes the student with Roll_no 2003 from the table)
DELETE FROM Student.Chetan WHERE Roll_no = 2003;

-- Disable safe update mode, which prevents updates/deletes without key columns in the WHERE clause
SET SQL_SAFE_UPDATES = 0;

-- Re-enable safe update mode for security reasons after performing necessary updates
SET SQL_SAFE_UPDATES = 1;

-- Select all records from the 'Chetan' table to view the current data after the update and deletion
SELECT * FROM Student.Chetan;

-- Truncate the table, which removes all rows but keeps the table structure intact (faster than DELETE)
TRUNCATE TABLE Student.Chetan;
