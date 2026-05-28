-- ============================================
-- EdTech Student Dropout - Complete SQL Analysis
-- Author: Shatadal Chakraborty
-- Dataset: 5000 students | 15 features
-- Purpose: Identify dropout patterns and 
--          build data-driven retention strategy
-- ============================================

USE edtech_churn;

-- ============================================
-- QUERY 1: Total Student Count
-- ============================================
SELECT COUNT(*) AS total_students 
FROM student_dropout;


-- ============================================
-- QUERY 2: Dropout Rate by Status
-- ============================================
SELECT 
    label_name,
    COUNT(*) AS student_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM student_dropout
GROUP BY label_name
ORDER BY student_count DESC;


-- ============================================
-- QUERY 3: Dropout by Age Group
-- ============================================
SELECT 
    CASE 
        WHEN age BETWEEN 17 AND 20 THEN '17-20'
        WHEN age BETWEEN 21 AND 25 THEN '21-25'
        WHEN age BETWEEN 26 AND 30 THEN '26-30'
        ELSE '30+'
    END AS age_group,
    label_name,
    COUNT(*) AS count
FROM student_dropout
GROUP BY age_group, label_name
ORDER BY age_group, count DESC;


-- ============================================
-- QUERY 4: Exam Season Impact on Dropout
-- ============================================
SELECT 
    exam_season,
    label_name,
    COUNT(*) AS count,
    ROUND(AVG(dropout_score), 4) AS avg_dropout_score
FROM student_dropout
GROUP BY exam_season, label_name
ORDER BY exam_season;


-- ============================================
-- QUERY 5: Average Engagement by Dropout Status
-- Business Insight: Dropout Fingerprint
-- ============================================
SELECT 
    label_name,
    ROUND(AVG(login_frequency), 2) AS avg_logins,
    ROUND(AVG(completion_rate), 2) AS avg_completion,
    ROUND(AVG(completed_assignments), 2) AS avg_assignments,
    ROUND(AVG(last_activity_days_ago), 2) AS avg_days_inactive,
    ROUND(AVG(forum_posts_count), 2) AS avg_forum_posts
FROM student_dropout
GROUP BY label_name
ORDER BY label_name;


-- ============================================
-- QUERY 6: Cohort Analysis
-- Which Enrollment Month Has Highest Dropout?
-- ============================================
SELECT 
    DATE_FORMAT(enroll_date, '%Y-%m') AS enroll_month,
    COUNT(*) AS total_students,
    SUM(CASE WHEN label_name = 'dropped' THEN 1 ELSE 0 END) AS dropped_count,
    ROUND(SUM(CASE WHEN label_name = 'dropped' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*), 2) AS dropout_rate
FROM student_dropout
GROUP BY enroll_month
ORDER BY dropout_rate DESC
LIMIT 5;


-- ============================================
-- QUERY 7: High Risk Student Profiles
-- Students Most Likely to Drop Immediately
-- ============================================
SELECT 
    student_id,
    age,
    region,
    login_frequency,
    completion_rate,
    last_activity_days_ago,
    dropout_score,
    label_name
FROM student_dropout
WHERE login_frequency < 1.5 
    AND completion_rate < 0.15
    AND last_activity_days_ago > 9
ORDER BY dropout_score DESC
LIMIT 10;


-- ============================================
-- QUERY 8: Window Function
-- Regional Risk Ranking per Student
-- ============================================
SELECT 
    student_id,
    region,
    dropout_score,
    label_name,
    RANK() OVER (PARTITION BY region ORDER BY dropout_score DESC) AS risk_rank,
    ROUND(AVG(dropout_score) OVER (PARTITION BY region), 4) AS region_avg_risk
FROM student_dropout
ORDER BY region, risk_rank
LIMIT 20;


-- ============================================
-- QUERY 9: Regional Dropout Comparison
-- Platform-wide vs Regional Problem?
-- ============================================
SELECT 
    region,
    COUNT(*) AS total_students,
    ROUND(AVG(dropout_score), 4) AS avg_risk_score,
    SUM(CASE WHEN label_name = 'dropped' THEN 1 ELSE 0 END) AS total_dropped,
    ROUND(SUM(CASE WHEN label_name = 'dropped' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM student_dropout
GROUP BY region
ORDER BY avg_risk_score DESC;


-- ============================================
-- QUERY 10: 21-25 is the largest age group on the platform. But is it also the group that drops out most? 
-- Or does a smaller group have a higher dropout RATE?
-- ============================================
SELECT 
    CASE 
        WHEN age BETWEEN 17 AND 20 THEN '17-20'
        WHEN age BETWEEN 21 AND 25 THEN '21-25'
        WHEN age BETWEEN 26 AND 30 THEN '26-30'
        ELSE '30+'
    END AS age_group,
    COUNT(*) AS total_students,
    SUM(CASE WHEN label_name = 'dropped' THEN 1 ELSE 0 END) AS dropped_count,
    ROUND(SUM(CASE WHEN label_name = 'dropped' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM student_dropout
GROUP BY age_group
ORDER BY dropout_rate_pct DESC;
