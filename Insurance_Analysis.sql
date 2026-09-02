use insurance ;

USE insurance;

-- =========================
-- 7 KPIs
-- =========================

-- KPI 1: Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer_information;


-- KPI 2: Total Policies
SELECT COUNT(DISTINCT policy_id) AS total_policies
FROM policy_details;


-- KPI 3: Total Premium Amount
SELECT CONCAT(ROUND(SUM(premium_amount) / 1000000, 2), "M") AS total_premium
FROM policy_details;


-- KPI 4: Total Coverage Amount
SELECT CONCAT(ROUND(SUM(coverage_amount) / 10000000, 2), "M") AS total_coverage
FROM policy_details;


-- KPI 5: Total Claim Amount
SELECT CONCAT(ROUND(SUM(claim_amount) / 10000000, 2), "M") AS total_claim_amount
FROM claims;


-- KPI 6: Total Amount Paid
SELECT CONCAT(ROUND(SUM(amount_paid) / 1000000, 2), "M") AS total_amount_paid
FROM payment_history;


-- KPI 7: Total Claims
SELECT COUNT(claim_id) AS total_claims
FROM claims;


-- =========================
-- 5 CHARTS
-- =========================

-- Chart 1: Policies by Policy Type
SELECT 
    policy_type,
    COUNT(*) AS total_policies
FROM policy_details
GROUP BY policy_type
ORDER BY total_policies DESC;


-- Chart 2: Claims by Claim Status
SELECT 
    claim_status,
    COUNT(*) AS total_claims
FROM claims
GROUP BY claim_status;


-- Chart 3: Premium Amount by Policy Type
SELECT 
    policy_type,
    CONCAT(ROUND(SUM(premium_amount) / 1000000, 2), "M") AS total_premium
FROM policy_details
GROUP BY policy_type
ORDER BY SUM(premium_amount) DESC;


-- Chart 4: Monthly Claim Amount Trend
SELECT 
    DATE_FORMAT(date_of_claim, '%Y-%m') AS claim_month,
    CONCAT(ROUND(SUM(claim_amount) / 1000000, 2), "M") AS total_claim_amount
FROM claims
GROUP BY DATE_FORMAT(date_of_claim, '%Y-%m')
ORDER BY claim_month;


-- Chart 5: Policies by Renewal Status
SELECT 
    renewal_status,
    COUNT(*) AS total_policies
FROM additional_fields
GROUP BY renewal_status;