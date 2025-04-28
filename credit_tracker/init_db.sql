CREATE DATABASE credit_tracker;
GO
USE credit_tracker;
GO

-- Create applicants table for KYC and user data
CREATE TABLE applicants (
    applicant_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    income DECIMAL(10,2) NOT NULL,
    credit_score INT NOT NULL,
    id_number NVARCHAR(50),
    kyc_status NVARCHAR(20) DEFAULT 'Pending'
);

-- Create application_results table for approval decisions
CREATE TABLE application_results (
    result_id INT IDENTITY(1,1) PRIMARY KEY,
    applicant_id INT,
    status NVARCHAR(20) NOT NULL,
    reason NVARCHAR(200),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id)
);

-- Insert sample data into applicants
INSERT INTO applicants (name, income, credit_score, id_number, kyc_status)
VALUES ('Sarah Miller', 45000.00, 720, 'ID789', 'Verified'),
       ('Tom Lee', 25000.00, 600, NULL, 'Pending');

-- Insert sample data into application_results
INSERT INTO application_results (applicant_id, status, reason)
VALUES (1, 'Approved', 'High credit score and sufficient income'),
       (2, 'Rejected', 'Credit score below threshold');

	   SELECT * FROM applicants;
	   SELECT * FROM application_results;