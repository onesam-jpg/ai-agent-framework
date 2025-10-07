#!/bin/bash

echo "🚀 Setting up AI Agent Development Environment..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Install global tools
echo -e "${BLUE}📦 Installing global tools...${NC}"
npm install -g supabase pnpm vercel netlify-cli

# Setup Git configuration
echo -e "${BLUE}🔧 Configuring Git...${NC}"
git config --global init.defaultBranch main
git config --global pull.rebase false

# Install project dependencies if package.json exists
if [ -f "package.json" ]; then
    echo -e "${BLUE}📦 Installing Node.js dependencies...${NC}"
    npm install
    echo -e "${GREEN}✅ Node.js dependencies installed${NC}"
fi

# Install Python dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo -e "${BLUE}🐍 Installing Python dependencies...${NC}"
    pip install -r requirements.txt
    echo -e "${GREEN}✅ Python dependencies installed${NC}"
fi

# Setup Supabase if config exists
if [ -d "supabase" ]; then
    echo -e "${BLUE}🗄️ Supabase detected - initializing...${NC}"

    # Check if linked to remote project
    if [ -n "$SUPABASE_PROJECT_REF" ] && [ -n "$SUPABASE_ACCESS_TOKEN" ]; then
        echo -e "${YELLOW}Linking to Supabase project...${NC}"
        supabase link --project-ref "$SUPABASE_PROJECT_REF" || echo "Link failed - you can link manually later"

        # Generate types
        echo -e "${YELLOW}Generating TypeScript types from database...${NC}"
        mkdir -p types
        supabase gen types typescript --linked > types/supabase.ts 2>/dev/null || echo "Type generation skipped - link manually first"
    else
        echo -e "${YELLOW}⚠️  Supabase credentials not found. To link your project:${NC}"
        echo "   1. Set SUPABASE_PROJECT_REF in your Codespace secrets"
        echo "   2. Set SUPABASE_ACCESS_TOKEN in your Codespace secrets"
        echo "   3. Run: supabase link --project-ref YOUR_PROJECT_REF"
    fi

    # Start local Supabase (optional - for development)
    echo -e "${YELLOW}To start local Supabase, run: supabase start${NC}"
else
    echo -e "${YELLOW}No Supabase configuration found - skipping Supabase setup${NC}"
fi

# Setup Playwright if installed
if grep -q "@playwright/test" package.json 2>/dev/null; then
    echo -e "${BLUE}🎭 Installing Playwright browsers...${NC}"
    npx playwright install --with-deps
    echo -e "${GREEN}✅ Playwright browsers installed${NC}"
fi

# Create .env.local template if it doesn't exist
if [ ! -f ".env.local" ] && [ -f ".env.example" ]; then
    echo -e "${BLUE}📝 Creating .env.local from template...${NC}"
    cp .env.example .env.local
    echo -e "${YELLOW}⚠️  Remember to fill in your environment variables in .env.local${NC}"
elif [ ! -f ".env.local" ] && [ ! -f ".env.example" ]; then
    echo -e "${BLUE}📝 Creating .env.local template...${NC}"
    cat > .env.local << 'EOF'
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Optional: Other services
# VERCEL_TOKEN=
# NETLIFY_AUTH_TOKEN=
EOF
    echo -e "${YELLOW}⚠️  Created .env.local template - please fill in your values${NC}"
fi

# Setup pre-commit hooks (if using Husky)
if [ -d ".husky" ]; then
    echo -e "${BLUE}🪝 Setting up Git hooks...${NC}"
    npx husky install
fi

# Run initial build if build script exists
if grep -q "\"build\"" package.json 2>/dev/null; then
    echo -e "${BLUE}🏗️  Running initial build...${NC}"
    npm run build || echo "Build failed - you can run 'npm run build' manually later"
fi

# Display helpful information
echo ""
echo -e "${GREEN}✅ Environment setup complete!${NC}"
echo ""
echo -e "${BLUE}📚 Quick Start Guide:${NC}"
echo ""
echo "  🤖 AI Agent System:"
echo "     - Open an issue to trigger the Planning Agent"
echo "     - Planning Agent will decompose tasks and create sub-issues"
echo "     - Specialized agents will handle each subtask"
echo ""
echo "  💻 Development:"
echo "     - Run dev server: npm run dev"
echo "     - Run tests: npm test"
echo "     - Run linter: npm run lint"
echo ""
echo "  🗄️ Supabase:"
echo "     - Start local: supabase start"
echo "     - Studio: http://localhost:54321"
echo "     - Generate types: supabase gen types typescript --linked > types/supabase.ts"
echo ""
echo "  📖 Documentation:"
echo "     - Agent Instructions: .github/AGENTS.md"
echo "     - Architecture: docs/ARCHITECTURE.md"
echo "     - README: README.md"
echo ""
echo -e "${YELLOW}🎉 Happy coding with AI agents!${NC}"
