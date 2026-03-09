# Task Management

# 1. Create base directory
```
mkdir -p ~/opt/local/code
cd ~/opt/local/code
```

# 2. Clone all repositories from stallone-7849 organization
```
git clone git@github.com:stallone-7849/stallone-project-management.git  
git clone git@github.com:stallone-7849/stallone-theme-management.git  
git clone git@github.com:stallone-7849/stallone-story-management.git  
git clone git@github.com:stallone-7849/stallone-flow-management.git  
git clone git@github.com:stallone-7849/stallone-task-management.git  
```

# 3. Verify structure
```
ls -la ~/opt/local/code/
# Expected output:
#   stallone-project-management/
#   stallone-theme-management/
#   stallone-story-management/
#   stallone-flow-management/
#   stallone-task-management/
```

# 4. Set up GitHub authentication
```
# If using SSH:
ssh -T git@github.com
# Should see: Hi stallone-7849! You've successfully authenticated...

# If using HTTPS with Personal Access Token:
gh auth login
# Follow prompts, select stallone-7849 organization
```

# 5. Verify repository access
```
cd ~/opt/local/code/stallone-task-management
git remote -v
# Should show: git@github.com:stallone-7849/stallone-task-management.git
```

# 6. Set up environment
```
cat >> ~/.bashrc << 'EOF'
# Stallone organization configuration
export GITHUB_TOKEN="your_personal_access_token_here"
export GITHUB_ORG="stallone-7849"
export REPOS_BASE=~/opt/local/code
EOF

source ~/.bashrc
```
# 7. Install Python dependencies
```
cd ~/opt/local/code/stallone-task-management/automation
pip install -r requirements.txt
```

# 8. Create necessary directories
```
mkdir -p ~/opt/local/code/stallone-task-management/automation/temp
mkdir -p ~/opt/local/code/stallone-task-management/automation/logs
```

# 9. Make scripts executable
```
chmod +x ~/opt/local/code/stallone-task-management/automation/cron/*.sh
```

# 10. Test manually
```
cd ~/opt/local/code/stallone-task-management
./automation/cron/daily-prep.sh
```
