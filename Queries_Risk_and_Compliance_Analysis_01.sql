-- Filename: Risk_and_Compliance_Analysis_01.sql
-- Description: These queries are meant to check current state of risk and compliance
-- Category: Risk and Compliance Analysis / Business Insights / Data Validation / KPIs / KCIs>
-- Author: Sam Stephens
-- Last Updated: 2025-09-02

-- =====================
-- Query starts below
-- =====================

-- What's the severity count by customer?
SELECT severity AS Severity, count(DISTINCT customer_id) AS CustomerCount
FROM alerts a
GROUP BY severity
;

-- What are reasons customer's accounts have high severity?
SELECT reason AS SeverityReason, count(reason) AS ReasonCount
FROM alerts a
WHERE severity = 'high'
GROUP BY reason
ORDER BY ReasonCount DESC
;

-- What are the countries that fall into the "High-Risk Jurisdiction"? 
-- Is the list accurate per Policy? Therefore, contributing to inaccurate numbers?
SELECT
	t.country AS Country, count(t.country) AS HighRiskCount
FROM alerts a
LEFT JOIN transactions t
ON a.transaction_id = t.transaction_id
WHERE a.reason = 'High-risk jurisdiction'
	AND a.severity = 'high'
GROUP BY t.country
ORDER BY HighRiskCount DESC
;

-- Show transactions per account and the country that are flagged.
SELECT t.account_id AS AccountID, count(t.account_id) AS AccountCount, ac.customer_id, t.country
FROM transactions t
LEFT JOIN accounts ac
ON t.account_id = ac.account_id
WHERE t.is_flagged = 'yes'
GROUP BY t.account_id
ORDER BY AccountCount DESC
;
-- Any transaction volume spikes in short periods per account? Define "short period".
