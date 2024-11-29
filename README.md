# Launchpad Team 5 Project

![Build and Validate](https://github.com/DerDangla/launchpad-team-5/actions/workflows/build.yml/badge.svg)

## Overview

This project deploys infrastructure and a PostgreSQL database using Terraform and AWS Aurora.

---

## Problem Statement

Use “HCL” as a language and “Terraform” as a framework to develop composable module(s) for the below requirement:

- Create a PostgreSQL database (AWS Aurora preferred) with three tables/schema:
  1. **Payee** (user\_id, email, name, phone\_number)
  2. **Transactions** (transaction\_id, user\_id, transaction\_amount, merchant, country, status)
  3. **Fraud\_scores** (score\_id, transaction\_id, user\_id, fraud\_score, risk\_level)
- Consider non-functional requirements for production and non-production environments to develop composable module(s), designed following best practices of scalability & resiliency.
- Consider a full deployment scenario, including other required (dependency) services for a database (e.g., network, secret management, etc.).
- Include observability, logging, and security as part of the design, development & deployment.
- Demonstrate test approach and test cases for every part of the component(s).
- Use GitHub & GitHub Actions as repository & pipeline tools.

---

## Terraform Modules

[Aurora Postgres](https://github.com/DerDangla/launchpad-team-5/tree/emander/modules/aurora_postgres)

[Montioring](https://github.com/DerDangla/launchpad-team-5/tree/emander/modules/monitoring)

[Networking](https://github.com/DerDangla/launchpad-team-5/tree/emander/modules/networking)

[Secrets Manager](https://github.com/DerDangla/launchpad-team-5/tree/emander/modules/secrets_manager)