# Launchpad Team 5 Project

## Overview
This project deploys infrastructure and a PostgreSQL database using Terraform and AWS Aurora.

---

## Problem Statement
Use “HCL” as a language and “Terraform” as a framework to develop composable module(s) for the below requirement:
- Create a PostgreSQL database (AWS Aurora preferred) with three tables/schema:
  1. **Payee** (user_id, email, name, phone_number)
  2. **Transactions** (transaction_id, user_id, transaction_amount, merchant, country, status)
  3. **Fraud_scores** (score_id, transaction_id, user_id, fraud_score, risk_level)
- Consider non-functional requirements for production and non-production environments to develop composable module(s), designed following best practices of scalability & resiliency.
- Consider a full deployment scenario, including other required (dependency) services for a database (e.g., network, secret management, etc.).
- Include observability, logging, and security as part of the design, development & deployment.
- Demonstrate test approach and test cases for every part of the component(s).
- Use GitHub & GitHub Actions as repository & pipeline tools.

---

## Setup on a Clean macOS Installation

### 1. Install Homebrew
Homebrew is a package manager for macOS that simplifies software installation.

1. Open the Terminal app.
2. Run the following command to install Homebrew:
   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
3. Verify the installation by checking the Homebrew version:
   ```
   brew --version
   ```

---

### 2. Install Terraform
Terraform is the infrastructure-as-code tool used for this project.

1. Use Homebrew to install Terraform:
   ```
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```
2. Verify the Terraform installation:
   ```
   terraform -version
   ```

---

### 3. Set Up AWS CLI
The AWS CLI is required to interact with AWS resources.

1. Install the AWS CLI using Homebrew:
   ```
   brew install awscli
   ```
2. Verify the AWS CLI installation:
   ```
   aws --version
   ```
3. Configure the AWS CLI with your credentials:
   ```
   aws configure
   ```
   Provide your:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region (e.g., `us-east-1`)

---

### 4. Clone the Repository
Clone the project repository to your local machine.

1. Use Git to clone the repository:
   ```
   git clone https://github.com/your-repo-name/launchpad-team-5.git
   cd launchpad-team-5
   ```

---

### 5. Initialize Terraform
Prepare the Terraform environment.

1. Navigate to the `dev` environment:
   ```
   cd terraform/environments/dev
   ```
2. Initialize Terraform:
   ```
   terraform init
   ```

---

### 6. Run Basic Terraform Commands
Verify that Terraform is working correctly.

1. Generate a Terraform execution plan:
   ```
   terraform plan
   ```
   This command shows the actions Terraform will take to create your infrastructure.

2. Apply the Terraform configuration:
   ```
   terraform apply
   ```
   Type `yes` when prompted to confirm.

3. Destroy the infrastructure (for testing purposes):
   ```
   terraform destroy
   ```
   Type `yes` when prompted to confirm.

---

## Running the Full Workflow
Once you've verified the local setup, you can push changes to GitHub to trigger the CI/CD pipeline defined in `.github/workflows/ci-cd-pipeline.yml`.

---

## Troubleshooting
- **Terraform Not Found**: Ensure Homebrew is installed and `brew install terraform` was successful.
- **AWS CLI Issues**: Verify your AWS credentials and region configuration using `aws configure`.
- **Terraform Apply Errors**: Check the Terraform output for errors in your configuration or AWS account.

---

## License
MIT License

