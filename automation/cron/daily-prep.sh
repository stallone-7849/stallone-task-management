#!/bin/bash
# Location: ~/opt/local/code/stallone-task-management/automation/cron/daily-prep.sh

echo "=== Industriousness Action Plan Generation Starting at $(date) ==="

# Configuration
GITHUB_ORG="stallone-7849"              # ← Correct organization name
GITHUB_PROJECT_NUMBER=1                 # "Atlas IDP" project
ASSIGNEE="vanheemstra"                  # Your GitHub username

# Repository paths - all stallone repos in ~/opt/local/code/
REPOS_BASE=~/opt/local/code
PROJECT_MGMT=$REPOS_BASE/stallone-project-management
THEME_MGMT=$REPOS_BASE/stallone-theme-management
STORY_MGMT=$REPOS_BASE/stallone-story-management
FLOW_MGMT=$REPOS_BASE/stallone-flow-management
TASK_MGMT=$REPOS_BASE/stallone-task-management

AUTOMATION=$TASK_MGMT/automation

# Ensure GitHub token
if [ -z "$GITHUB_TOKEN" ]; then
  echo "ERROR: GITHUB_TOKEN not set"
  exit 1
fi

echo "Organization: stallone-7849"
echo "Querying Atlas IDP project..."

# Step 0: Query GitHub Project
python3 $AUTOMATION/scripts/project_collector.py \
  --org "$GITHUB_ORG" \
  --project-number $GITHUB_PROJECT_NUMBER \
  --assignee "$ASSIGNEE" \
  --project-mgmt-repo "$PROJECT_MGMT" \
  --output $AUTOMATION/temp/github-project-hierarchy.yaml

# ... rest of script
