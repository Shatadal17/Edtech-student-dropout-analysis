# EdTech Student Dropout Analysis

## Business Problem
An online learning platform is losing 33% of students. 
This analysis identifies WHY students drop out, WHO is most 
at risk, and WHEN to intervene to save them.

## Dataset
- 5,000 students | 15 features | 0 missing values
- Source: Kaggle (Online Learning Student Dropout Dataset)
- Labels: Active (34%) | At-Risk (33%) | Dropped (33%)

## Key Findings
1. Login frequency drops 87% from active to dropped students
2. Intervention window is only 7 days before student is gone
3. Dropout spikes predictably in October (40%) and April (39%)
4. December enrollments show lowest dropout (32%) — high intent students
5. Dropout is platform-wide, not regional (only 6% spread across 8 regions)

## Business Recommendations
- Trigger automated alert when student inactive for 7+ days
- Launch retention campaigns in September and March (before seasonal spike)
- Focus on platform-wide engagement improvements, not regional fixes

## Files
- `sql/edtech_dropout_complete_analysis.sql` — 9 business queries
- `SQL_Analysis_Summary.md` — Complete findings document
- `notebooks/` — Python EDA (coming soon)
- `dashboards/` — Power BI Dashboard (coming soon)

## Tools Used
MySQL | Python (coming) | Power BI (coming)

---
**By Shatadal Chakraborty**  
[https://www.linkedin.com/in/shatadal-chakraborty-569903212/] | [https://github.com/Shatadal17]
