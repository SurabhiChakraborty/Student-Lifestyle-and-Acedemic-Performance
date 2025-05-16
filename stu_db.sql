----------- STUDENT HABBIT PERFORMANCE ------------

------------Creating Table-------------
CREATE TABLE stu(
	student_id INT PRIMARY KEY,
	age INT,
	gender VARCHAR(10),
	study_hours_per_day FLOAT,
	social_media_hours FLOAT,
	netflix_hours FLOAT,
	part_time_job VARCHAR(10),
	attendance_percentage FLOAT,	
	sleep_hours FLOAT,
	diet_quality VARCHAR(10),	
	exercise_frequency INT,
	parental_education_level VARCHAR(15),
	internet_quality VARCHAR(10),
	mental_health_rating INT,
	extracurricular_participation VARCHAR(10),
	exam_score FLOAT

);


------------------------ Finding Null Values -------------------------------
SELECT * FROM stu;

SELECT * FROM stu
WHERE student_id IS NULL;

SELECT * FROM stu
WHERE age IS NULL;

SELECT * FROM stu
WHERE gender IS NULL;

SELECT * FROM stu
WHERE study_hours_per_day IS NULL;


---------------------- DATA ANALYSIS---------------------

-- 1. Show the list of all student records.
SELECT * FROM stu;


-- 2. Display the number of male and female students.
SELECT gender, COUNT(*) AS total_students
FROM stu
GROUP BY gender;


-- 3. What is the average study time per day among students?
SELECT AVG(study_hours_per_day) AS avg_study_hours
FROM stu;


-- 4. List students who study more than 4 hours per day.
SELECT * FROM stu
WHERE study_hours_per_day > 4;


-- 5. Find the average exam score.
SELECT AVG(exam_score) AS avg_exam_score
FROM stu;


-- 6. Show the total number of students with a part-time job.
SELECT COUNT(*) AS part_time_students
FROM stu
WHERE part_time_job = 'Yes';


-- 7. Retrieve the highest and lowest exam scores.
SELECT MAX(exam_score) AS highest_score, MIN(exam_score) AS lowest_score
FROM stu;


-- 8. List all students with attendance below 75%.
SELECT * FROM stu
WHERE attendance_percentage < 75;


-- 9. Show students who sleep less than 6 hours.
SELECT * FROM stu
WHERE sleep_hours < 6;


-- 10. Display the count of students by parental education level.
SELECT parental_education_level, COUNT(*) AS total
FROM stu
GROUP BY parental_education_level;


-- 11. Find the average exam score grouped by gender.
SELECT gender, AVG(exam_score) AS avg_score
FROM stu
GROUP BY gender;


-- 12. List students who study more and use social media less than the average.
SELECT * FROM stu
WHERE study_hours_per_day > (SELECT AVG(study_hours_per_day) FROM stu)
  AND social_media_hours < (SELECT AVG(social_media_hours) FROM stu);


-- 13. Which diet quality group has the highest average exam score?
SELECT diet_quality, AVG(exam_score) AS avg_score
FROM stu
GROUP BY diet_quality
ORDER BY avg_score DESC
LIMIT 1;


-- 14. Rank students by their exam scores (highest to lowest).
SELECT student_id, exam_score,
       RANK() OVER (ORDER BY exam_score DESC) AS rank
FROM stu;


-- 15. Show students with both high mental health rating and high exam score.
SELECT * FROM stu
WHERE mental_health_rating >= 8 AND exam_score >= 85;


-- 16. Analyze average sleep hours by exercise frequency.
SELECT exercise_frequency, AVG(sleep_hours) AS avg_sleep
FROM stu
GROUP BY exercise_frequency;


-- 17. Check if extracurricular participation impacts average exam score.
SELECT extracurricular_participation, AVG(exam_score) AS avg_score
FROM stu
GROUP BY extracurricular_participation;

-------------------------------------------------------------------------------------------------------------------------












