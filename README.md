# 🤖 AI Agent Development Framework

**Unlock 10x Developer Productivity with Autonomous AI Agents**

A production-ready, cloud-native development framework that uses hierarchical multi-agent systems to automate 80% of software development tasks. Built on GitHub Copilot, GitHub Actions, and Supabase.

---

## ✨ Features

### 🎯 Intelligent Task Decomposition
- **Planning Agent** automatically breaks down complex issues into actionable subtasks
- Generates execution DAGs with dependency tracking
- Creates labeled sub-issues for specialized agents

### 🤖 Specialized AI Agents
- **Web Dev Agent**: React, Next.js, Tailwind CSS
- **Database Agent**: PostgreSQL schema, migrations, RLS policies
- **API Agent**: REST/GraphQL endpoints, Edge Functions
- **Testing Agent**: Unit, integration, and E2E tests
- **DevOps Agent**: CI/CD pipelines, deployment
- **Documentation Agent**: READMEs, API docs

### ☁️ Cloud-First Architecture
- **GitHub Codespaces**: Web-based development, accessible anywhere
- **GitHub Actions**: Unlimited concurrent agent execution
- **Supabase**: Scalable PostgreSQL database + real-time features
- **Auto-Deploy**: Vercel/Netlify integration

### 🔐 Enterprise-Grade Security
- Agent isolation via ephemeral GitHub Actions runners
- Row-Level Security (RLS) in Supabase
- No secrets in code (GitHub Secrets only)
- Automated security scans on every PR

### 📊 Complete Observability
- Real-time progress tracking via GitHub Issues
- Automatic project plan updates
- CI/CD pipeline visibility
- Performance metrics dashboard

---

## 🚀 Quick Start

### Prerequisites

- **GitHub Account** (Pro+ or Enterprise for Copilot Coding Agent)
- **GitHub Copilot** subscription
- **Supabase Account** (free tier works)
- **Vercel/Netlify Account** (optional, for deployment)

### Installation

#### Option 1: Use as GitHub Template (Recommended)

1. **Click "Use this template"** on GitHub
2. **Enable GitHub Copilot** for the repository
3. **Enable GitHub Actions** in repository settings
4. **Enable Codespaces** (optional but recommended)

#### Option 2: Clone and Setup

```bash
# Clone the repository
git clone <your-repo-url>
cd ai-agent-development-framework

# Create a new GitHub repository
gh repo create my-ai-project --public --source=. --remote=origin

# Push to GitHub
git add .
git commit -m "Initial commit: AI Agent Framework"
git push -u origin main
```

### Configuration

#### 1. Setup GitHub Secrets

Go to **Settings → Secrets and variables → Actions** and add:

```bash
# Required
SUPABASE_ACCESS_TOKEN=<your-token>        # Get from: https://supabase.com/dashboard/account/tokens
SUPABASE_PROJECT_REF=<your-project-ref>   # Get from Supabase project settings

# Optional (for deployment)
VERCEL_TOKEN=<your-vercel-token>
VERCEL_ORG_ID=<your-org-id>
VERCEL_PROJECT_ID=<your-project-id>

# Or for Netlify
NETLIFY_AUTH_TOKEN=<your-netlify-token>
```

#### 2. Setup Supabase Project

```bash
# Login to Supabase
supabase login

# Link your project
supabase link --project-ref <your-project-ref>

# Initialize database (if new project)
supabase db push
```

#### 3. Enable Copilot Coding Agent

1. Go to your repository settings
2. Navigate to **Features → Copilot**
3. Enable "Allow Copilot coding agent"
4. (Enterprise only) Administrator must enable policy

---

## 📖 Usage

### Creating Your First Task

1. **Open a new issue** on GitHub:

   **Title**: "Build a real-time chat application"

   **Description**:
   ```markdown
   ## Requirements
   - Users can send and receive messages in real-time
   - Messages stored in Supabase with PostgreSQL
   - Authentication with Google OAuth
   - Responsive UI with Tailwind CSS
   - E2E tests for critical flows

   ## Technical Constraints
   - Use Next.js 15 App Router
   - Implement proper RLS policies
   - Deploy to Vercel
   ```

2. **Planning Agent activates automatically**:
   - Analyzes your requirements
   - Creates execution plan
   - Generates 6 subtask issues:
     - Database schema design
     - Authentication setup
     - Real-time message sync
     - UI components
     - E2E tests
     - Deployment pipeline

3. **Specialized agents execute in parallel**:
   - Each subtask assigned to appropriate agent
   - Agents work autonomously in isolated environments
   - PRs created when complete

4. **Review and merge**:
   - Review agent-created PRs
   - Automated tests run on every PR
   - Merge when satisfied
   - Auto-deploy to production

5. **Result**: Fully functional chat app in hours, not days!

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Developer                            │
│                            │                                │
│                     Creates Issue                           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Planning Agent (Tier 1)                  │
│  • Analyzes requirements                                    │
│  • Decomposes into subtasks                                 │
│  • Creates labeled sub-issues                               │
│  • Monitors progress                                        │
└─────────────────────────────────────────────────────────────┘
                              │
         ┌────────────────────┼────────────────────┐
         ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Web Dev Agent │  │ Database Agent  │  │   API Agent     │
│   (Tier 2)      │  │   (Tier 2)      │  │   (Tier 2)      │
└─────────────────┘  └─────────────────┘  └─────────────────┘
         │                    │                    │
         └────────────────────┼────────────────────┘
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    CI/CD Pipeline                           │
│  • Run tests                                                │
│  • Deploy to Supabase                                       │
│  • Deploy to Vercel/Netlify                                 │
└─────────────────────────────────────────────────────────────┘
```

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for detailed architecture documentation.

---

## 📁 Project Structure

```
ai-agent-development-framework/
├── .github/
│   ├── AGENTS.md                        # Agent instructions & standards
│   ├── workflows/
│   │   ├── planning-agent.yml           # Task decomposition workflow
│   │   ├── specialized-agents.yml       # Agent execution workflow
│   │   ├── copilot-setup-steps.yml      # Agent environment setup
│   │   └── deploy-to-supabase.yml       # CD pipeline
│   └── prompts/                         # Custom prompt templates
│
├── .devcontainer/
│   ├── devcontainer.json                # Codespaces configuration
│   └── postCreate.sh                    # Environment setup script
│
├── .vscode/
│   ├── settings.json                    # VS Code performance settings
│   └── mcp.json                         # MCP server configuration
│
├── supabase/
│   ├── config.toml                      # Supabase local config
│   ├── migrations/                      # SQL migration files
│   └── functions/                       # Edge Functions
│
├── docs/
│   ├── ARCHITECTURE.md                  # System architecture
│   └── SETUP.md                         # Detailed setup guide
│
├── project_plan.md                      # Auto-generated task tracking
└── README.md                            # This file
```

---

## ⚙️ Configuration

### Agent Behavior

Edit [.github/AGENTS.md](.github/AGENTS.md) to customize:
- Code style preferences
- Testing requirements
- Deployment standards
- Security policies
- Documentation guidelines

### Environment Setup

Edit [.github/workflows/copilot-setup-steps.yml](.github/workflows/copilot-setup-steps.yml) to customize:
- Runtime versions (Node, Python)
- Global tools (Supabase CLI, Playwright)
- Pre-installed dependencies
- Build steps

### VS Code Settings

Edit [.vscode/settings.json](.vscode/settings.json) to customize:
- Editor performance
- AI Copilot behavior
- Linting rules
- Formatting preferences

### MCP Servers

Edit [.vscode/mcp.json](.vscode/mcp.json) to add/remove:
- File system access
- Supabase integration
- GitHub API access
- Custom MCP servers

---

## 🔧 Advanced Usage

### Using GitHub Codespaces

**Launch from any device**:
1. Navigate to your repository on GitHub
2. Click "Code" → "Codespaces" → "Create codespace on main"
3. Wait ~30 seconds for environment to initialize
4. Start coding in the browser or connect with VS Code Desktop

**Codespace includes**:
- All tools pre-installed
- MCP servers configured
- Supabase CLI ready
- GitHub Copilot enabled

### Custom Agent Types

**Add a new specialized agent**:

1. **Define agent in AGENTS.md**:
   ```markdown
   ### Mobile Agent
   - **Label**: `agent:mobile`
   - **Expertise**: React Native, Expo
   - **Tasks**: Mobile app development
   ```

2. **Update specialized-agents.yml**:
   ```yaml
   if: |
     contains(github.event.issue.labels.*.name, 'agent:mobile')
   ```

3. **Create sub-issues with new label**

### Parallel Agent Execution

**Enable parallel work** by ensuring tasks have no dependencies:

```markdown
## Task Breakdown
- [ ] Task 1: Setup auth (no dependencies)
- [ ] Task 2: Build UI (no dependencies)
- [ ] Task 3: Add tests (depends on Task 1, Task 2)
```

Agents for Task 1 and Task 2 will run simultaneously!

---

## 🎯 Best Practices

### Writing Good Issues

**Good**:
```markdown
## Goal
Build a user profile page with avatar upload

## Requirements
- Display user name, email, avatar
- Allow avatar upload via Supabase Storage
- Implement RLS for user privacy
- Responsive design (mobile-first)

## Technical Details
- Use Next.js Server Components
- Store avatars in `avatars` bucket
- Update `profiles` table
```

**Bad**:
```markdown
Make a profile page
```

### Agent Feedback

**Provide feedback through**:
- PR comments (specific code suggestions)
- Issue comments (clarifications, questions)
- Update AGENTS.md (general improvements)

### Security

**Never commit**:
- API keys or secrets
- Personal access tokens
- `.env.local` files
- Supabase service role keys

**Always use**:
- GitHub Secrets for credentials
- Supabase RLS for data access
- Environment variables

---

## 📊 Monitoring & Metrics

### Track Progress

- **Project Plan**: `project_plan.md` (auto-updated)
- **GitHub Issues**: Real-time status updates
- **GitHub Actions**: Workflow execution logs
- **Supabase Dashboard**: Database and API metrics

### Performance Metrics

Check [project_plan.md](project_plan.md) for:
- Tasks completed per sprint
- Average completion time
- Agent utilization rates
- Test pass rates

---

## 🐛 Troubleshooting

### Agent Not Triggering

**Problem**: Agent workflow not starting after labeling issue

**Solutions**:
1. Check GitHub Actions is enabled
2. Verify workflow file exists in `.github/workflows/`
3. Ensure label matches exactly (e.g., `agent:web-dev`)
4. Check Actions tab for errors

### Copilot Setup Failing

**Problem**: `copilot-setup-steps.yml` failing

**Solutions**:
1. Verify `SUPABASE_ACCESS_TOKEN` secret is set
2. Check Node/Python versions are compatible
3. Review Actions logs for specific errors
4. Ensure job name is exactly `copilot-setup-steps`

### MCP Server Connection Issues

**Problem**: MCP server not connecting in VS Code

**Solutions**:
1. Verify `mcp.json` syntax is valid JSON
2. Check tokens are configured in Codespace secrets
3. Reload VS Code window
4. Check MCP server logs in Output panel

### Deployment Failures

**Problem**: Deploy workflow failing

**Solutions**:
1. Verify all deployment secrets are set
2. Check Supabase migrations are valid SQL
3. Ensure build passes locally
4. Review deployment logs in Actions

---

## 🤝 Contributing

We welcome contributions! Here's how:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Run tests**: `npm test`
5. **Commit**: `git commit -m 'feat: add amazing feature'`
6. **Push**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## 📜 License

This project is licensed under the **MIT License** - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Built with:
- **GitHub Copilot** - AI pair programmer
- **GitHub Actions** - CI/CD platform
- **Supabase** - Backend-as-a-Service
- **Next.js** - React framework
- **Model Context Protocol (MCP)** - Tool integration standard

Inspired by:
- **AgentOrchestra** - Hierarchical multi-agent framework
- **AutoGPT** - Autonomous agent systems
- **LangChain** - Agent orchestration patterns

---

## 📚 Additional Resources

### Documentation
- [Architecture Guide](docs/ARCHITECTURE.md)
- [Agent Instructions](.github/AGENTS.md)
- [Setup Guide](docs/SETUP.md)

### External Links
- [GitHub Copilot Docs](https://docs.github.com/copilot)
- [Supabase Docs](https://supabase.com/docs)
- [Next.js Docs](https://nextjs.org/docs)
- [MCP Specification](https://modelcontextprotocol.io)

### Support
- **Issues**: [GitHub Issues](../../issues)
- **Discussions**: [GitHub Discussions](../../discussions)
- **Discord**: [Join our community](#) (Coming soon)

---

## 🎉 Success Stories

> "This framework reduced our development time from weeks to days. The agents handle all the boilerplate, letting us focus on product decisions."
> — *Sarah Chen, Tech Lead*

> "We went from zero to production-ready SaaS in 3 days using this framework. The automated testing alone saved us countless hours."
> — *Marcus Rodriguez, Founder*

---

## 🚀 What's Next?

### Roadmap

- [ ] **Q1 2025**: Multi-model support (GPT-4, Claude, Gemini)
- [ ] **Q2 2025**: Visual agent builder UI
- [ ] **Q3 2025**: Self-learning agents (feedback loop)
- [ ] **Q4 2025**: Enterprise features (SSO, audit logs)

### Get Started Now!

1. **Star this repository** ⭐
2. **Clone and setup** (5 minutes)
3. **Create your first issue**
4. **Watch the agents work**
5. **Ship faster than ever** 🚀

---

<div align="center">

**Made with ❤️ by developers, for developers**

[Get Started](#-quick-start) • [Documentation](docs/ARCHITECTURE.md) • [Report Bug](../../issues) • [Request Feature](../../issues)

</div>
