# Launchpad Team 5 Project

## Overview
This project deploys infrastructure and a PostgreSQL database using Terraform and AWS Aurora.

### Problem Statement
Use “HCL” as a language and “Terraform” as a framework to develop composable module(s) for the below requirement:  
- Create a PostgreSQL database (AWS Aurora preferred) with three tables/schema:
  1. **Payee** (user_id, email, name, phone_number)
  2. **Transactions** (transaction_id, user_id, transaction_amount, merchant, country, status)
  3. **Fraud_scores** (score_id, transaction_id, user_id, fraud_score, risk_level)
- Consider non-functional requirements for production and non-production environments to develop composable module(s), design following best practices of scalability & resiliency.  
- Consider a full deployment scenario, which should include other required (dependency) services for a database (e.g., network, secret management, etc.).  
- Consider standard observability, logging, and security as part of design, development & deployment.  
- Every part of the component(s) to be tested. Demonstrate the test approach and test cases.  
- Use “GitHub & GitHub Action” as repository & pipeline tools.  
- Demonstrate the full development lifecycle - conceptualization, design, coding, testing, deployment, documentation.

---

## Repository Structure
- **terraform/**: Contains all Terraform code for infrastructure.
- **database/**: Contains SQL scripts for schema initialization and testing.
- **tests/**: Contains Terraform and database tests.
- **.github/workflows/**: GitHub Actions CI/CD pipeline configuration.

---

## Features
- Modular Terraform code.
- CI/CD pipeline using GitHub Actions.
- Environment-specific configurations for development and production.

---

## How to Get Started
1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Set up the [AWS CLI](https://aws.amazon.com/cli/).
3. Clone this repository:
   ```bash
   git clone https://github.com/your-repo-name/launchpad-team-5.git
   cd launchpad-team-5
