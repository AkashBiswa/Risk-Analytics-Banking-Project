CREATE Database BankDB;

USE BankDB;

-- Modified the Table created --

ALTER TABLE financial
MODIFY id INT PRIMARY KEY,
MODIFY address_state VARCHAR(50),
MODIFY application_type VARCHAR(50),
MODIFY emp_length VARCHAR(50),
MODIFY emp_title VARCHAR(255),
MODIFY grade VARCHAR(50),
MODIFY home_ownership VARCHAR(20),
MODIFY issue_date DATE,
MODIFY last_credit_pull_date DATE,
MODIFY last_payment_date DATE,
MODIFY loan_status VARCHAR(50),
MODIFY next_payment_date DATE,
MODIFY member_id INT,
MODIFY purpose VARCHAR(50),
MODIFY sub_grade VARCHAR(50),
MODIFY term VARCHAR(50),
MODIFY verification_status VARCHAR(50),
MODIFY annual_income FLOAT,
MODIFY dti FLOAT,
MODIFY installment FLOAT,
MODIFY int_rate FLOAT,
MODIFY loan_amount INT,
MODIFY total_acc INT,
MODIFY total_payment INT;

-- Inserting Large CSV to MySQl Workbench --

SET GLOBAL LOCAL_INFILE=ON;

LOAD DATA LOCAL INFILE '/Users/akashbiswas/Desktop/My Doc/DS/Projects/Bank Loan Project/Data/financial_loan.csv'
INTO TABLE financial
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- A.	BANK LOAN REPORT | SUMMARY --

-- KPI’s: --

#Total Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial;

#MTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial
WHERE MONTH(issue_date) = 12;

#PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial
WHERE MONTH(issue_date) = 11;

#Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial;

#MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial
WHERE MONTH(issue_date) = 12;

#PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial
WHERE MONTH(issue_date) = 11;

#Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial;

#MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial
WHERE MONTH(issue_date) = 12;

#PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial
WHERE MONTH(issue_date) = 11;

#Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial;

#MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM financial
WHERE MONTH(issue_date) = 12;

#PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM financial
WHERE MONTH(issue_date) = 11;

#Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM financial;

#MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial
WHERE MONTH(issue_date) = 12;

#PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial
WHERE MONTH(issue_date) = 11;


-- GOOD LOAN ISSUED --

#Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial;

#Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

#Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
 

#Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- BAD LOAN ISSUED --

#Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial;
 
#Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial
WHERE loan_status = 'Charged Off';
 
#Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial WHERE loan_status = 'Charged Off';
 
#Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial
WHERE loan_status = 'Charged Off';

-- LOAN STATUS --
	
SELECT
	loan_status,
	COUNT(id) AS LoanCount,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
    
FROM financial GROUP BY loan_status;
 
 
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;
 

-- B.	BANK LOAN REPORT | OVERVIEW --

#MONTH

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	MONTHNAME(issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

#STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
GROUP BY address_state
ORDER BY address_state;

#TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
GROUP BY term
ORDER BY term;

#EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
GROUP BY emp_length
ORDER BY emp_length;

#PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
GROUP BY purpose
ORDER BY purpose;

#HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
GROUP BY home_ownership
ORDER BY home_ownership;

# See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;




