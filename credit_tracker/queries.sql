-- Query 1: Check who would be approved
SELECT 
    applicant_id,
    name,
    income,
    credit_score,
    CASE 
        WHEN credit_score > 650 AND income > 20000 THEN 'Approved'
        ELSE 'Rejected'
    END AS status,
    CASE 
        WHEN credit_score > 650 AND income > 20000 THEN 'Meets credit and income requirements'
        WHEN credit_score <= 650 THEN 'Credit score too low'
        WHEN income <= 20000 THEN 'Income too low'
    END AS reason
FROM applicants;

-- Query 2: Add approval results for new applicants
INSERT INTO application_results (applicant_id, status, reason)
SELECT 
    a.applicant_id,
    CASE 
        WHEN a.credit_score > 650 AND a.income > 20000 THEN 'Approved'
        ELSE 'Rejected'
    END,
    CASE 
        WHEN a.credit_score > 650 AND a.income > 20000 THEN 'Meets credit and income requirements'
        WHEN a.credit_score <= 650 THEN 'Credit score too low'
        WHEN a.income <= 20000 THEN 'Income too low'
    END
FROM applicants a
LEFT JOIN application_results r ON a.applicant_id = r.applicant_id
WHERE r.applicant_id IS NULL;

-- Query 3: KYC compliance report
SELECT 
    applicant_id,
    name,
    id_number,
    kyc_status,
    CASE 
        WHEN id_number IS NULL THEN 'Action: Verify ID'
        ELSE 'No action needed'
    END AS compliance_action
FROM applicants
WHERE kyc_status = 'Pending' OR id_number IS NULL;

-- Query 4: Summary of approvals
SELECT 
    status,
    COUNT(*) AS count,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS DECIMAL(5,2)) AS percentage
FROM application_results
GROUP BY status;