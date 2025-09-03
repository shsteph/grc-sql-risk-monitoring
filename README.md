# grc-sql-risk-monitoring
# Financial Crime Risk & Compliance Analysis (SQLite)

## 🔍 Overview
A simulated SQL-based GRC project focused on analyzing customer transactions, alerts, and risk rules. Includes data based on FATF and OFAC sanction lists.

This project reflects my interest in Governance, Risk, and Compliance (GRC) and serves as a hands-on exploration of Financial Crimes, KYC, and AML—one of several areas where I’m actively deepening my understanding. It brings together SQL, risk analytics, and real-world risk scenarios using simulated data to model monitoring and detection logic. My goal is to demonstrate how a BA/GRC practitioner might initially approach building risk controls, querying for anomalies, and preparing actionable insights through dashboards, quickly allowing decisions to occur.

🛠️ Tools & Technologies Used
SQLite – Lightweight relational database used to store and query simulated financial data 
DB Browser for SQLite – GUI tool for managing database structure and executing SQL queries
Mockaroo – Data generator used to create realistic simulated data for tables like customers, transactions, and alerts
Power BI – Used for visualizing KPIs, trends, and flagged activity across accounts and jurisdictions
Git & GitHub – For version control, documentation, and portfolio publishing

## 📂 What's Inside
- `compliance_db.sqlite`: SQLite database with fake financial data
- `queries/`: Contains SQL for KPIs and KCIs
- `docs/`: Schema diagrams and rule documentation

## 🚀 Features
- Risk scoring by severity and transaction patterns
- Alerts from sanctioned countries
- Compliance-focused control checks (KCIs)

## 🧠 Next Steps
- Build a Power BI dashboard from key queries
- Add audit logs and follow-up tracking
- Add SQL clauses for alert triggers
- Link monitoring to specific NIST/ISO Controls
- Create procedures for remediation
