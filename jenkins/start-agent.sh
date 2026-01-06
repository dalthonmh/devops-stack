#!/bin/bash
# start-agent.sh
# Created: 2026-01-05, dalthonmh
# Description:
#   This script connects a Jenkins agent to a Jenkins controller using WebSocket.
#   It tunnels traffic through HTTPS (port 443), eliminating the need to expose
#   port 50000 on the controller.
#
# Prerequisites:
#   1. Java Runtime Environment (JRE) 11 or 17 installed.
#   2. 'agent.jar' downloaded from your Jenkins controller.
#   3. Jenkins must be accessible via HTTPS
#
# Setup:
#   1. Create directory: mkdir -p /usr/local/jenkins-service
#   2. Copy 'start-agent.sh' and 'agent.jar' to this directory.
#   3. Make executable: chmod +x /usr/local/jenkins-service/start-agent.sh
#
# Configuration (Environment Variables):
#   Create a file '/usr/local/jenkins-service/jenkins-agent.ini' with the following content:
#     ENV_JENKINS_URL="https://jenkins.domain.com/"
#     ENV_JENKINS_SECRET="secret"
#     ENV_JENKINS_AGENT_NAME="agent-name"
#
# Usage - Manual Testing:
#   You can run the script manually to verify connectivity before setting up the service.
#   Export the required variables first:
#     export ENV_JENKINS_URL="https://jenkins.domain.com/"
#     export ENV_JENKINS_SECRET="secret"
#     export ENV_JENKINS_AGENT_NAME="test-agent"
#     ./start-agent.sh
#
# Usage - Systemd Service (Auto-start):
#   To run as a service, create '/etc/systemd/system/jenkins-agent.service':
#     [Unit]
#     Description=Jenkins Agent connection
#     After=network.target
#
#     [Service]
#     User=root
#     WorkingDirectory=/usr/local/jenkins-service
#     EnvironmentFile=/usr/local/jenkins-service/jenkins-agent.ini
#     ExecStart=/usr/local/jenkins-service/start-agent.sh
#     Restart=always
#     RestartSec=10
#
#     [Install]
#     WantedBy=multi-user.target
#
#   Then enable and start:
#     systemctl daemon-reload
#     systemctl enable --now jenkins-agent
#

# --- Configuration ---
set -e

# --- Variables ---
JENKINS_URL="${ENV_JENKINS_URL}"
JENKINS_SECRET="${ENV_JENKINS_SECRET}"
JENKINS_AGENT_NAME="${ENV_JENKINS_AGENT_NAME}"
WORK_DIR="/home/jenkins/remoting"

# --- Execution ---
cd /usr/local/jenkins-service
echo "Starting Jenkins agent for ${JENKINS_AGENT_NAME}..."
echo "Connecting to ${JENKINS_URL} via WebSocket..."

exec java -jar agent.jar \
  -url "${JENKINS_URL}" \
  -secret "${JENKINS_SECRET}" \
  -name "${JENKINS_AGENT_NAME}" \
  -workDir "${WORK_DIR}" \
  -webSocket

exit 0
