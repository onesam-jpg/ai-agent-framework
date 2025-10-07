# 🚀 Complete Setup Guide - AI Agent Development Framework

This guide walks you through setting up the AI Agent Development Framework from scratch.

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Step 1: GitHub Repository Setup](#step-1-github-repository-setup)
3. [Step 2: Supabase Project Setup](#step-2-supabase-project-setup)
4. [Step 3: GitHub Secrets Configuration](#step-3-github-secrets-configuration)
5. [Step 4: Enable GitHub Features](#step-4-enable-github-features)
6. [Step 5: Local Development Setup](#step-5-local-development-setup)
7. [Step 6: Deploy to Production](#step-6-deploy-to-production)
8. [Step 7: Test the Framework](#step-7-test-the-framework)
9. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Accounts Required

- ✅ **GitHub Account** (Free or Pro+)
- ✅ **GitHub Copilot Subscription** (Individual, Business, or Enterprise)
- ✅ **Supabase Account** (Free tier works)
- ⚠️ **Vercel or Netlify Account** (Optional, for deployment)

### Tools to Install (for local development)

- **Node.js 20+**: https://nodejs.org/
- **Git**: https://git-scm.com/
- **GitHub CLI** (optional but recommended): https://cli.github.com/
- **VS Code**: https://code.visualstudio.com/

---

## Step 1: GitHub Repository Setup

### Option A: Use This as a Template

1. Click **"Use this template"** button on GitHub
2. Choose a repository name (e.g., `my-ai-project`)
3. Select visibility (Public or Private)
4. Click **"Create repository"**

### Option B: Clone and Push to New Repo

```bash
# Navigate to the framework directory
cd C:\Users\OneSa\Documents\VSCode_AI_Framework_Setup

# Initialize git (if not already)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: AI Agent Framework setup"

# Create GitHub repository (using GitHub CLI)
gh repo create my-ai-project --public --source=. --remote=origin

# Push to GitHub
git push -u origin main
```

---

## Step 2: Supabase Project Setup

### 2.1 Create a Supabase Project

1. Go to https://supabase.com/dashboard
2. Click **"New project"**
3. Fill in details:
   - **Name**: my-ai-project
   - **Database Password**: (save this securely!)
   - **Region**: Choose closest to you
4. Click **"Create new project"**
5. Wait ~2 minutes for provisioning

### 2.2 Get Your Credentials

1. Go to **Settings → API** in your Supabase dashboard
2. Copy these values (you'll need them later):
   - **Project URL** (`NEXT_PUBLIC_SUPABASE_URL`)
   - **Anon Key** (`NEXT_PUBLIC_SUPABASE_ANON_KEY`)
   - **Service Role Key** (`SUPABASE_SERVICE_ROLE_KEY`) ⚠️ Keep secret!

3. Go to **Settings → General**
4. Copy **Reference ID** (`SUPABASE_PROJECT_REF`)

### 2.3 Generate Personal Access Token

1. Go to https://supabase.com/dashboard/account/tokens
2. Click **"Generate new token"**
3. Name: "GitHub Actions"
4. Click **"Generate token"**
5. Copy the token (`SUPABASE_ACCESS_TOKEN`) ⚠️ Save it now - you can't see it again!

---

## Step 3: GitHub Secrets Configuration

### 3.1 Navigate to Secrets Settings

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **"New repository secret"**

### 3.2 Add Required Secrets

Add each of the following secrets:

| Secret Name | Value | Where to Get It |
|-------------|-------|-----------------|
| `SUPABASE_ACCESS_TOKEN` | Personal Access Token | Step 2.3 |
| `SUPABASE_PROJECT_REF` | Project Reference ID | Step 2.2 |
| `NEXT_PUBLIC_SUPABASE_URL` | Project URL | Step 2.2 |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Anon Key | Step 2.2 |
| `SUPABASE_SERVICE_ROLE_KEY` | Service Role Key | Step 2.2 |

### 3.3 Add Deployment Secrets (Optional)

**For Vercel**:
1. Go to https://vercel.com/account/tokens
2. Generate new token
3. Add to GitHub Secrets:
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID` (from Vercel settings)
   - `VERCEL_PROJECT_ID` (from project settings)

**For Netlify**:
1. Go to https://app.netlify.com/user/applications#personal-access-tokens
2. Generate new token
3. Add to GitHub Secrets:
   - `NETLIFY_AUTH_TOKEN`

---

## Step 4: Enable GitHub Features

### 4.1 Enable GitHub Actions

1. Go to **Settings** → **Actions** → **General**
2. Under "Actions permissions", select:
   - ✅ **Allow all actions and reusable workflows**
3. Under "Workflow permissions", select:
   - ✅ **Read and write permissions**
4. Click **"Save"**

### 4.2 Enable GitHub Copilot (Required!)

1. Go to **Settings** → **Code security and analysis**
2. Scroll to **GitHub Copilot**
3. Click **"Enable"**
4. ⚠️ If you have GitHub Copilot Enterprise:
   - Organization admin must enable policy
   - Go to Organization Settings → Copilot → Policies

### 4.3 Enable GitHub Codespaces (Optional but Recommended)

1. Go to **Settings** → **Codespaces**
2. Under "Codespace access", ensure enabled for repository

### 4.4 Enable Issues

1. Go to **Settings** → **General**
2. Under "Features", ensure **Issues** is checked

---

## Step 5: Local Development Setup

### 5.1 Clone Repository

```bash
# Clone your repository
git clone https://github.com/YOUR_USERNAME/my-ai-project.git
cd my-ai-project
```

### 5.2 Install Dependencies

```bash
# Install Node dependencies
npm install

# Install Supabase CLI globally
npm install -g supabase
```

### 5.3 Configure Environment Variables

```bash
# Copy the example environment file
cp .env.example .env.local

# Edit .env.local with your values
# (Use the values from Step 2.2)
```

**Your `.env.local` should look like**:
```bash
NEXT_PUBLIC_SUPABASE_URL=https://xxxxxxxxxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_PROJECT_REF=xxxxxxxxxxxx
```

### 5.4 Link Supabase Project

```bash
# Login to Supabase CLI
supabase login

# Link your project (use Project Reference ID from Step 2.2)
supabase link --project-ref YOUR_PROJECT_REF
```

### 5.5 Start Local Development

**Option A: Local Supabase (Recommended for development)**
```bash
# Start local Supabase (requires Docker)
supabase start

# This will spin up:
# - PostgreSQL on port 54322
# - Supabase Studio on http://localhost:54323
# - Edge Functions runtime
# - Auth server

# Run Next.js dev server
npm run dev
```

**Option B: Use Remote Supabase**
```bash
# Just run Next.js dev server
npm run dev
```

Visit http://localhost:3000 to see your app!

---

## Step 6: Deploy to Production

### 6.1 Deploy Database

```bash
# Push migrations to production (if you created any)
supabase db push
```

### 6.2 Deploy Frontend

**Option A: Vercel (Recommended)**
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

**Option B: Netlify**
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Build
npm run build

# Deploy
netlify deploy --prod
```

**Option C: Automatic via GitHub Actions**

Just merge to `main` branch - the `deploy-to-supabase.yml` workflow will handle everything!

---

## Step 7: Test the Framework

### 7.1 Test Planning Agent

1. Go to your GitHub repository
2. Click **Issues** → **New issue**
3. Create a test issue:

   **Title**: "Build a simple todo list"

   **Description**:
   ```markdown
   ## Requirements
   - Users can create, read, update, delete todos
   - Store todos in Supabase
   - Simple UI with Tailwind CSS

   ## Technical
   - Use Next.js App Router
   - Implement RLS policies
   - Add basic tests
   ```

4. Click **"Submit new issue"**
5. Watch the **Actions** tab - you should see:
   - "Planning Agent - Task Decomposition" workflow triggered
   - Planning Agent analyzes the issue
   - Creates subtask issues (you'll see new issues created)
   - Comments on your issue with the plan

### 7.2 Test Specialized Agent

1. Go to one of the subtask issues created by Planning Agent
2. The issue should already have a label (e.g., `agent:database`)
3. The "Specialized Agents" workflow should trigger automatically
4. Check the issue comments for agent status updates

### 7.3 Manually Assign to Copilot

⚠️ **Important**: As of 2025, you need to manually assign issues to GitHub Copilot Coding Agent:

**Option 1 - GitHub UI**:
1. Open the subtask issue
2. Look for "Development" section on the right
3. Click **"Assign to Copilot"**
4. Wait for Copilot to create a PR

**Option 2 - GitHub CLI**:
```bash
gh copilot assign ISSUE_NUMBER --repo YOUR_USERNAME/my-ai-project
```

---

## Troubleshooting

### Issue: GitHub Actions Not Triggering

**Symptoms**: Workflow doesn't run when issue is created

**Solutions**:
1. Check that Actions are enabled (Step 4.1)
2. Verify workflow files are in `.github/workflows/`
3. Check Actions tab for errors
4. Make sure branch is `main` (not `master`)

### Issue: Supabase Connection Failed

**Symptoms**: Can't connect to Supabase locally

**Solutions**:
1. Verify `.env.local` has correct values
2. Check Supabase dashboard - project must be "Active"
3. Regenerate anon key if you suspect it's wrong
4. Make sure URL includes `https://`

### Issue: MCP Server Not Working

**Symptoms**: MCP server connection errors in VS Code

**Solutions**:
1. Reload VS Code window (Cmd/Ctrl + Shift + P → "Reload Window")
2. Check `.vscode/mcp.json` syntax
3. Verify Supabase token is valid
4. Open Output panel → Select "MCP" to see logs

### Issue: Copilot Not Creating PRs

**Symptoms**: Assigned to Copilot but no PR created

**Solutions**:
1. Verify Copilot subscription is active
2. Check Copilot is enabled for repository (Step 4.2)
3. Ensure `copilot-setup-steps.yml` job passes (check Actions tab)
4. Wait - it can take 5-30 minutes for complex tasks

### Issue: Deployment Failed

**Symptoms**: Deploy workflow fails

**Solutions**:
1. Check all secrets are configured (Step 3)
2. Verify Vercel/Netlify tokens are valid
3. Check build passes locally: `npm run build`
4. Review deployment logs in Actions tab

### Issue: Permission Errors

**Symptoms**: Workflows fail with permission errors

**Solutions**:
1. Go to Settings → Actions → General
2. Under "Workflow permissions", select:
   - ✅ Read and write permissions
3. Re-run failed workflows

---

## Next Steps

### 🎉 You're All Set!

Your AI Agent Development Framework is now fully configured. Here's what you can do:

1. **Create Issues** → Watch agents work automatically
2. **Explore Codespaces** → Cloud development from anywhere
3. **Customize AGENTS.md** → Tailor agent behavior to your needs
4. **Add Custom Agents** → Extend the framework
5. **Build Your Product** → Focus on what matters, let agents handle the rest

### 📚 Learn More

- Read [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for deep dive
- Review [.github/AGENTS.md](.github/AGENTS.md) for agent guidelines
- Check [README.md](README.md) for usage examples

### 💬 Get Help

- **Issues**: https://github.com/YOUR_USERNAME/my-ai-project/issues
- **Discussions**: https://github.com/YOUR_USERNAME/my-ai-project/discussions

---

**Happy coding with AI agents! 🤖✨**
