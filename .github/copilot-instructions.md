# GitHub Copilot Instructions (Backup Format)

**Note**: This is a backup format. The primary instructions are in `AGENTS.md`.

This file is automatically included by GitHub Copilot when you use `@workspace` or chat features.

---

## Project Context

This is an **AI Agent Development Framework** that uses hierarchical multi-agent systems for autonomous software development.

## Core Technologies

- **Frontend**: Next.js 15 (App Router), React 19, TypeScript, Tailwind CSS
- **Backend**: Supabase (PostgreSQL, Auth, Storage, Edge Functions)
- **Testing**: Jest, Playwright
- **CI/CD**: GitHub Actions
- **Deployment**: Vercel/Netlify + Supabase

## Code Style

- Use TypeScript strict mode
- Functional components with hooks
- Server Components by default
- Client components only when needed (`'use client'`)
- Tailwind for all styling

## Security

- Never hardcode secrets
- Always use environment variables
- Implement Supabase RLS policies
- Validate and sanitize inputs

## Testing

- Write tests before marking tasks complete
- Minimum 80% code coverage
- E2E tests for critical flows

## Documentation

- JSDoc for public APIs
- README for new features
- Update types after schema changes

---

For complete guidelines, see `.github/AGENTS.md`.
