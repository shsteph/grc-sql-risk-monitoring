-- Filename: Business_Insights_Analysis_01.sql
-- Description: These queries are meant to find insights in available data
-- Category: Business Insights
-- Author: Sam Stephens
-- Last Updated: 2025-09-02

-- =====================
-- Query starts below
-- =====================

-- What's the severity count by customer?-- How many customers have more than one account type?
SELECT customer_id AS CustomerID, count(account_id) AS AccountCount, sum(balance) AS TotalBalance
FROM accounts
WHERE AccountCount > 1
GROUP BY customer_id
ORDER BY TotalBalance DESC
;

-- Who are our top customers by total transaction amount?
SELECT
	a.customer_id AS CustomerID, 
	sum(t.amount) AS TransactionsAmount, 
	count(a.account_id) AS AccountCount,
	round(sum(t.amount) / count(a.account_id), 2) AS TransactionsPerAccount,
	round(sum(a.balance), 2) AS TotalBalance
FROM accounts a
LEFT JOIN transactions t
ON a.account_id = t.account_id
GROUP BY a.customer_id
ORDER BY TransactionsAmount DESC
LIMIT 20
;

-- Trends over time (monthly alerts/transactions).
-- Had to add round to prevent rounding up and resulting zeroes!!
SELECT 
	transaction_type, 
	count(CASE WHEN is_flagged = 'yes' then 1 END) AS Flagged_Count,
	count(CASE WHEN is_flagged = 'no' then 1 END) AS Not_Flagged_Count,
	count(transaction_type) AS TotalTransactions,
	round(
		count(CASE WHEN is_flagged = 'yes' then 1 END) * 100.0
		/ count(transaction_type), 2
	) AS PercentFlagged
FROM transactions
GROUP BY transaction_type
;