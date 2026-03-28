# Bank Loan Report Dashboard

## Project Summary

This project presents an end-to-end data analytics solution for monitoring and evaluating a bank’s loan portfolio. By combining SQL-based data analysis with interactive Tableau dashboards, it delivers actionable insights into loan performance, borrower behavior, and financial risk.

## Objectives

* Track loan application trends over time
* Evaluate funding and repayment performance
* Distinguish between good and bad loans
* Identify key factors influencing lending decisions
* Support data-driven financial strategy


## Tech Stack

* MySQL
* Tableau


## Dataset

* File: `financial_loan_data_excel.xlsx`


## Key KPIs

### Lending Performance

* Total Loan Applications
* Total Funded Amount
* Total Amount Received
* Month-to-Date (MTD) Metrics
* Month-over-Month (MoM) Changes

### Risk Metrics

* Average Interest Rate
* Average Debt-to-Income Ratio (DTI)

### Loan Quality

**Good Loans (Fully Paid, Current)**

* Percentage of Good Loans
* Total Applications
* Funded Amount
* Amount Received

**Bad Loans (Charged Off)**

* Percentage of Bad Loans
* Total Applications
* Funded Amount
* Amount Received

### Dashboard Interation

* [View Dashboard](https://public.tableau.com/views/BankLoanReportDashboard_17746858234880/Summary?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


## Project Workflow

### 1. Data Import

* Loaded CSV data into MySQL using `LOAD DATA INFILE`

### 2. Data Preparation

* Cleaned and validated data
* Standardized categorical fields
* Checked for missing or inconsistent values

### 3. Data Analysis

* Used SQL aggregations (SUM, COUNT, AVG)
* Created time-based metrics (MTD, PMTD, MoM)
* Segmented loans into good and bad categories

### 4. Data Visualization

Developed three interactive dashboards in Tableau:

#### Summary Dashboard

* KPI overview
* Good vs Bad loan comparison
* Loan status breakdown

#### Overview Dashboard

* Monthly trends
* Regional distribution
* Loan term analysis
* Employment length insights
* Loan purpose breakdown
* Home ownership distribution

#### Details Dashboard

* Consolidated loan-level data
* Interactive filtering for detailed exploration


## Key Insights

* Most loans fall under the good loan category, indicating a stable portfolio
* Charged-off loans represent a smaller share but carry higher financial risk
* Loan applications show noticeable monthly trends
* Lending activity is concentrated in specific regions
* Employment length positively correlates with loan volume
* Debt consolidation is the most common loan purpose
* Home ownership status influences borrowing patterns


## Conclusion

This project demonstrates how structured data analysis and visualization can provide a clear understanding of lending operations. The dashboards enable effective monitoring of loan performance, identification of risk factors, and support informed decision-making.


## Usage Instructions

1. Import the dataset into MySQL
2. Execute SQL queries to generate KPIs
3. Connect Tableau to the database
4. Build or explore dashboards


## Future Enhancements

* Predictive modeling for loan default risk
* Real-time data integration
* Deployment as an interactive web application


