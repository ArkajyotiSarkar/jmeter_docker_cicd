# jmeter_docker_cicd
Integrating Docker with CICD and GIT

📄 Overview
This project sets up a fully containerized Apache JMeter master-slave performance testing framework integrated with Jenkins CI/CD pipeline. It enables you to run distributed performance tests using Docker containers, aggregate test results, and publish detailed HTML reports through Jenkins.

🧰 Features
🐳 Dockerized JMeter Master-Slave Setup

Master container orchestrates test execution.

Multiple slave (agent) containers execute distributed test threads.

🛠 Custom Jenkins Pipeline (Declarative)

Cleans workspace and Docker resources.

Builds images and starts containers.

Executes test plan and waits for report generation.

Collects and publishes the JMeter HTML report.

📁 Volume Mounting

Results and test plans are mounted into the container, ensuring persistence and easy access.

🔐 RMI SSL Disabled by Default

Simplifies JMeter remote connections using:

bash
Copy
Edit
jmeter-server -Dserver.rmi.ssl.disable=true
🕵️‍♂️ Debugging Enhancements

Detailed logging for each Jenkins pipeline stage.

PowerShell script (wait-for-report.ps1) waits until the test report is available.

📦 Repository Structure
graphql
Copy
Edit
jmeter_docker_cicd/
├── docker-compose.yml
├── Dockerfile.master
├── Dockerfile.agent
├── run-jmeter.sh
├── wait-for-report.ps1
├── BlazeDemoFlight_removed.jmx     # Sample JMeter test plan
├── agent1/
│   └── data.txt
├── agent2/
│   └── data.txt
└── Jenkinsfile                     # Full CI pipeline
✅ Prerequisites
Docker Desktop (Linux container mode)

Jenkins (with Publish HTML Reports plugin)

PowerShell (for report waiting logic on Windows)

🧪 How It Works (Summary Flow)
Jenkins Pipeline triggers build.

Docker Images for master and agents are built and started.

Master runs run-jmeter.sh, which:

Verifies agents.

Launches JMeter test plan in non-GUI distributed mode.

Generates a report in HTML format.

A PowerShell script waits until the report is generated.

Report is copied to Jenkins workspace.

HTML report is archived and published via Jenkins.

📈 Sample Output
After successful run, you can view:

results/report_<date>_session<build_number>/html/index.html

JMeter logs and execution details in Jenkins console

