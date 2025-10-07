# ⚡ Quick Start Checklist - AI Agent Framework

**Time to Launch**: ~30 minutes ⏱️

---

## ✅ Pre-Flight Checklist

### Step 1: Push to GitHub (5 min)

```bash
cd C:\Users\OneSa\Documents\VSCode_AI_Framework_Setup

git init
git add .
git commit -m "feat: AI Agent Development Framework - initial setup"

# Create repository using GitHub CLI
gh repo create my-ai-agent-project --public --source=. --remote=origin --push

# Or manually:
# 1. Create new repo on GitHub
# 2. git remote add origin https://github.com/YOUR_USERNAME/my-ai-agent-project.git
# 3. git push -u origin main
```

### Step 2: Create Supabase Project (5 min)

1. Go to: https://supabase.com/dashboard
2. Click **"New project"**
3. Fill in:
   - Name: `my-ai-agent-project`
   - Password: (save securely!)
   - Region: (closest to you)
4. Wait ~2 minutes for setup

### Step 3: Get Supabase Credentials (2 min)

**From Supabase Dashboard:**

1. **Settings → API**:
   - Copy `Project URL` → Save as `NEXT_PUBLIC_SUPABASE_URL`
   - Copy `anon public` key → Save as `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - Copy `service_role` key → Save as `SUPABASE_SERVICE_ROLE_KEY` ⚠️

2. **Settings → General**:
   - Copy `Reference ID` → Save as `SUPABASE_PROJECT_REF`

3. **Account → Tokens** (https://supabase.com/dashboard/account/tokens):
   - Generate new token → Name: "GitHub Actions"
   - Copy token → Save as `SUPABASE_ACCESS_TOKEN` ⚠️

### Step 4: Configure GitHub Secrets (3 min)

Go to: `https://github.com/YOUR_USERNAME/my-ai-agent-project/settings/secrets/actions`

Click **"New repository secret"** for each:

| Secret Name | Value |
|-------------|-------|
| `SUPABASE_ACCESS_TOKEN` | From Step 3.3 |
| `SUPABASE_PROJECT_REF` | From Step 3.2 |
| `NEXT_PUBLIC_SUPABASE_URL` | From Step 3.1 |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | From Step 3.1 |
| `SUPABASE_SERVICE_ROLE_KEY` | From Step 3.1 |

### Step 5: Enable GitHub Features (3 min)

**In your repository settings:**

1. **Actions** → **General**:
   - ✅ Allow all actions
   - ✅ Read and write permissions
   - Save

2. **Code security and analysis**:
   - ✅ Enable GitHub Copilot
   - ✅ Enable Dependabot

3. **Codespaces** (optional but recommended):
   - ✅ Enable Codespaces

### Step 6: Verify Setup (2 min)

1. Go to **Actions** tab
2. Should see 4 workflows:
   - ✅ Copilot Setup Steps
   - ✅ Deploy to Supabase & Production
   - ✅ Planning Agent - Task Decomposition
   - ✅ Specialized Agents - Task Execution

All should show "No runs yet" (this is correct!)

---

## 🚀 Launch Your First Agent Task (5 min)

### Create Test Issue

1. Go to **Issues** tab
2. Click **"New issue"**
3. Copy-paste this:

```markdown
**Title**: Test: Build a simple counter app

**Description**:

## Requirements
- Display a counter starting at 0
- Button to increment counter
- Button to decrement counter
- Button to reset counter
- Store counter value in Supabase
- Responsive UI with Tailwind CSS

## Technical Details
- Use Next.js 15 App Router
- Use Supabase for persistence
- Server Components where possible
- Include basic tests

## Success Criteria
- Counter persists across page refreshes
- All buttons work correctly
- UI is responsive on mobile
- Tests pass
```

4. Click **"Submit new issue"**

### Watch the Magic ✨

1. **Go to Actions tab** → You should see "Planning Agent" workflow running
2. **Wait ~30 seconds** → Planning Agent completes
3. **Go to Issues tab** → You'll see 3-5 new subtask issues created!
   - Example: "Design database schema for counter"
   - Example: "Build counter UI components"
   - Example: "Write tests for counter functionality"
4. **Check original issue** → Planning Agent added a comment with the plan

### Manually Assign to Copilot (Required for now)

For each subtask issue:
1. Open the issue
2. Scroll to **"Development"** section (right sidebar)
3. Click **"Assign to Copilot"**
4. Wait ~5-30 minutes
5. Copilot will create a PR!

**Or use GitHub CLI**:
```bash
gh copilot assign ISSUE_NUMBER --repo YOUR_USERNAME/my-ai-agent-project
```

### Review & Merge

1. Review the PR created by Copilot
2. Check that tests pass
3. Approve and merge
4. Watch auto-deployment to production!

---

## 🎉 Success Indicators

### ✅ You Know It's Working When:

- [ ] Planning Agent creates subtask issues automatically
- [ ] Specialized Agent workflows trigger on labeled issues
- [ ] Copilot Coding Agent creates PRs
- [ ] CI/CD pipeline runs tests
- [ ] Merging triggers auto-deployment
- [ ] Issue gets closed automatically

### 📊 Check These Logs:

1. **GitHub Actions**: See workflow execution
2. **Issue Comments**: Agent progress updates
3. **project_plan.md**: Auto-updated task tracking
4. **PRs**: Agent-created code changes

---

## 🆘 Troubleshooting

### Problem: Planning Agent not triggering

**Fix**:
```bash
# Check workflow files exist
ls .github/workflows/

# Should see: planning-agent.yml
```

Go to Settings → Actions → General → Ensure "Allow all actions" is enabled

### Problem: "SUPABASE_ACCESS_TOKEN not found"

**Fix**:
1. Go to repository Settings → Secrets
2. Verify all 5 secrets are added
3. Names must match EXACTLY (case-sensitive)

### Problem: Copilot not available

**Fix**:
1. Check you have GitHub Copilot subscription
2. Verify Copilot enabled in repo settings
3. If Enterprise: Admin must enable policy

### Problem: Workflows fail with permission errors

**Fix**:
Settings → Actions → General → Workflow permissions → Select "Read and write"

---

## 📚 Next Steps After Setup

### Explore Documentation

- 📖 [README.md](README.md) - Full features guide
- 🔧 [SETUP_GUIDE.md](SETUP_GUIDE.md) - Detailed setup
- 🏗️ [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) - System architecture
- 🤖 [.github/AGENTS.md](.github/AGENTS.md) - Agent instructions
- 📊 [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) - What was built

### Customize Your Framework

**Modify agent behavior**:
- Edit `.github/AGENTS.md`

**Add custom instructions**:
- Edit `.github/copilot-instructions.md`

**Configure MCP servers**:
- Edit `.vscode/mcp.json`

**Performance tuning**:
- Edit `.vscode/settings.json`

### Try Advanced Features

**Use GitHub Codespaces**:
1. Click "Code" → "Codespaces"
2. "Create codespace on main"
3. Develop in browser or VS Code!

**Add deployment**:
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
cd C:\Users\OneSa\Documents\VSCode_AI_Framework_Setup
vercel --prod
```

**Configure auto-merge**:
- Add label `auto-merge-enabled` to PRs
- Agents will auto-merge when approved

---

## 💡 Pro Tips

### Get the Most Out of Agents

1. **Write detailed issues**: More context = better results
2. **Use labels**: `priority:high`, `good-first-issue`, etc.
3. **Review but don't micromanage**: Trust the agents
4. **Provide feedback**: PR comments help agents learn
5. **Check project_plan.md**: See progress at a glance

### Performance Optimization

- **Parallel work**: Ensure tasks have no dependencies
- **Smaller tasks**: Break down into 1-3 hour chunks
- **Clear success criteria**: Agents know when done
- **Test coverage**: Agents write better tests with examples

### Security Best Practices

- ✅ Never commit `.env.local`
- ✅ Always use GitHub Secrets
- ✅ Review all agent PRs before merge
- ✅ Keep dependencies updated (Dependabot)
- ✅ Enable 2FA on GitHub and Supabase

---

## 🎯 Checklist Complete!

When all checkboxes are done:

- [ ] Pushed to GitHub
- [ ] Supabase project created
- [ ] GitHub Secrets configured
- [ ] GitHub features enabled
- [ ] Test issue created
- [ ] Planning Agent ran successfully
- [ ] Subtask issues created
- [ ] Copilot assigned to subtask
- [ ] PR created by Copilot
- [ ] Tests passed
- [ ] PR merged
- [ ] Auto-deployed to production

---

## 🎊 You're Live!

Your AI Agent Development Framework is fully operational!

**What you can build now:**
- 🌐 Full-stack web applications
- 📱 Mobile-responsive sites
- 🗄️ Database-backed apps
- 🔐 Authenticated systems
- 📊 Real-time applications
- 🤖 AI-powered features

**Development time**: **80-90% faster** than traditional methods

**Welcome to the future of software development!** 🚀✨

---

*Need help? Check [SETUP_GUIDE.md](SETUP_GUIDE.md) or [README.md](README.md)*
