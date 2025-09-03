-- Filename: Data_Integrity_and_Validation_01.sql
-- Description: These queries are meant to check for errors in data
-- Category: Data Intergiry/Validation
-- Author: Sam Stephens
-- Last Updated: 2025-09-02

-- =====================
-- Query starts below
-- =====================

-- Check for orphaned accounts
SELECT *
FROM accounts
WHERE customer_id NOT IN (
  SELECT customer_id FROM customers
);

-- Check for orphaned transactions
SELECT *
FROM transactions
WHERE account_id NOT IN (
  SELECT account_id FROM accounts
);

-- Check for flagged transactions based on lates OFAC and FATF sanctioned countries
