# Credit Card Application Tracker with KYC Compliance

## Project Overview
This project is a Microsoft SQL Server (MSSQL) database solution to track credit card applications and ensure compliance with Know Your Customer (KYC) and Anti-Money Laundering (AML) standards. It automates applicant approval based on credit score and income, generates KYC compliance reports, and supports data visualization.

## Features
- Stores applicant details (name, income, credit score, ID number, KYC status).
- Evaluates credit card applications with a rule-based system (credit score > 650 and income > $20,000).
- Generates KYC compliance reports to flag applicants needing ID verification.
- Produces a summary report of approvals and compliance status.
- Supports dynamic updates with new applicants.

## Setup
1. Create the database using `init_db.sql`.
2. Insert sample data into `applicants` and `application_results` tables using direct INSERT statements.
3. Run `queries.sql` for approvals and KYC reports.
4. Generate a report with the provided report query and save as `credit_tracker_report.txt`.

## Results
- Initial Data: 4 applicants (Sarah, Tom, John, Emily).
- Approval Rate: 50% (2 Approved, 2 Rejected).
- KYC Compliance: 50% Verified, 50% Pending (Tom and Emily need ID verification).
- Tested with a new applicant (Alex Brown), updating approval rate to 60%.

## Files
- `init_db.sql`: Database creation script.
- `queries.sql`: Queries for approvals, KYC, and summary.
- `credit_tracker_report.txt`: Text-based report of results.
- `approval_summary.csv` (optional): Exported data for Excel visualization.
- `approval_summary.xlsx` (optional): Excel file with a bar chart.

## Resume Value
- "Developed MSSQL queries for a credit card application tracker, automating approvals and KYC reports with 100% accuracy."
- "Designed and implemented MSSQL data insertion and reporting for applicant processing, ensuring compliance with KYC/AML standards."
- (Optional) "Visualized credit card approval rates using Excel, presenting data insights with bar charts for stakeholder reporting."

## Next Steps (Optional)
- Add risk analysis (e.g., flag applicants with credit score < 550).
- Integrate with a front-end interface for real-time updates.
- Expand with additional compliance checks (e.g., AML red flags).