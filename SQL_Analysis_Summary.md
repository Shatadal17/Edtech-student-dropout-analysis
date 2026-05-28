# EdTech Student Dropout - SQL Analysis Summary

## Dataset
5,000 students | 15 features | 0 missing values
Labels: Active (34%) | At-Risk (33%) | Dropped (33%)

## Key Business Findings

### Finding 1: The Dropout Fingerprint
Dropped students show dramatically different behavior from active students:
- Login frequency:  6.67 (active) vs 0.86 (dropped) — 87% decline
- Completion rate:  0.51 (active) vs 0.09 (dropped) — 82% decline
- Assignments done: 10.21 (active) vs 1.68 (dropped) — 84% decline
- Days inactive:    8.23 (active) vs 10.87 (dropped) — clear progression

LOGIN FREQUENCY is the strongest leading indicator of dropout.

### Finding 2: Intervention Window is 7 Days
At-risk students (avg 9.02 days inactive) are only 1.85 days away 
from dropped status (avg 10.87 days inactive).
Intervention must trigger within 7 days of inactivity.
Day 30 intervention is too late — student has already left mentally.

### Finding 3: Dropout is Seasonal and Predictable
October: 40.05% dropout rate (highest)
April:   38.92% dropout rate (2nd highest)
Pattern: Dropout spikes coincide with semester exam periods.
Recommendation: Launch retention campaigns in September and March,
one month BEFORE the seasonal spike — not reactively after.

### Finding 4: December Enrollments are High Intent
December shows lowest dropout rate (32.30%) despite highest 
enrollment volume (452 students).
Post-exam enrollees have clear goals → higher completion rates.
Recommendation: Marketing should prioritize quality enrollment 
messaging over volume-based campaigns.

### Finding 5: Dropout is a Platform Problem, Not Regional
Dropout rates across 8 regions range only 30-36% (6% spread).
Beirut: 36.13% | Tunis: 30.06% | All others: 32-34%
Conclusion: This is a systemic platform engagement issue.
Region-specific campaigns will have minimal impact.
Platform-wide onboarding and engagement improvements needed.

### Finding 6: Youngest students drop out most
17-20 age group has highest dropout RATE (36.19%)
despite not being the largest group by count.
21-25 year olds have most dropouts by count (584)
but lower rate (30.62%).

## Business Recommendations

1. IMMEDIATE: Flag any student with login < 2/week for automated outreach
2. EARLY WARNING: Trigger intervention at Day 7 of inactivity (not Day 30)
3. SEASONAL: Pre-emptive retention campaign every September and March
4. ENROLLMENT: Prioritize post-exam enrollment campaigns (December/January)
5. STRATEGY: Fix platform engagement globally, not region by region
6. Design specific onboarding support for 17-20 age group. They are likely first-time online learners with less self-discipline and study structure.

## SQL Skills Demonstrated
- GROUP BY, HAVING, aggregate functions
- CASE WHEN conditional logic
- DATE_FORMAT for cohort analysis
- Window functions: RANK(), AVG() OVER (PARTITION BY)
- Multi-condition WHERE filtering
- Subquery logic and percentage calculations
