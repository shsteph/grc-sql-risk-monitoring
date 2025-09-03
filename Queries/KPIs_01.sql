-- Filename: KPIs_01.sql
-- Description: KPI queries
-- Category: KPIs
-- Author: Sam Stephens
-- Last Updated: 2025-09-02

-- =====================
-- Query starts below
-- =====================

-- % of flagged transactions; Descriptipon: Rate of potentially risky transactions (Daily, Monthly?)
SELECT ac.customer_id AS CustomerID, t.account_id
FROM transactions t
LEFT JOIN accounts ac
ON t.account_id = ac.account_id
WHERE t.is_flagged = 'yes'
ORDER BY CustomerID
;

-- High-Severity Alert Rate; Description: % of alerts with high-severity (might need to define further with rolling time frame)
SELECT
	count(alert_id) AS AlertCount,
	(SELECT count(alert_id)
		FROM alerts
		WHERE severity = 'high'
	) AS HighSeverityCount,
	(SELECT count(alert_id)
		FROM alerts
		WHERE severity = 'high'
	) /
	count(alert_id) AS HighSeverityAlertRate
FROM alerts
;

-- Average Transactions per Account (add a rolling period)
SELECT account_id AS AccountID, count(transaction_id) AS TransactionCount
FROM transactions
GROUP BY account_id
ORDER BY TransactionCount DESC
;

-- Customers with multiple flagged transactions
SELECT ac.customer_id, count(t.is_flagged) AS FlaggedTransactionCount
FROM transactions t
LEFT JOIN accounts ac
ON t.account_id = ac.account_id
WHERE t.is_flagged = 'yes'
GROUP BY ac.customer_id
ORDER BY FlaggedTransactionCount DESC
;

SELECT risk_rating
