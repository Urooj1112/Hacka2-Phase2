# Phase II Todo Application

This is a full-stack web todo application built with Next.js, FastAPI, SQLModel, Neon PostgreSQL, and Better Auth.

## Table of Contents
- [Project Structure](#project-structure)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Specification-Driven Development](#specification-driven-development)
- [Contributing](#contributing)

## Project Structure

```
.
├── .claude/                 # Claude Code configuration
│   ├── claude_config.json   # Claude Code configuration
│   ├── commands/            # Claude Code command configurations
│   ├── navigation.md        # Navigation instructions for Claude Code
│   ├── monorepo.md          # Monorepo-specific Claude Code settings
│   ├── prompts/             # Claude Code prompt templates
│   │   └── monorepo-navigation.prompt
│   ├── validation.md        # Validation checks for Claude Code
│   └── CLAUDE.md            # Claude Code root instructions
├── .specify/                # Spec-Kit configuration
│   ├── memory/              # Project memory and constitution
│   │   └── constitution.md  # Project constitution and principles
│   ├── scripts/             # Spec-Kit automation scripts
│   │   ├── create-feature.sh # Feature creation script
│   │   └── powershell/      # PowerShell scripts (when available)
│   └── templates/           # Specification templates
│       ├── adr-template.md
│       ├── agent-file-template.md
│       ├── checklist-template.md
│       ├── phr-template.prompt.md
│       ├── plan-template.md
│       ├── spec-template.md
│       └── tasks-template.md
├── .gitattributes           # Git attributes configuration
├── .gitignore               # Git ignore patterns
├── .env.example            # Environment variable examples
├── CLAUDE.md               # Root Claude Code instructions
├── README.md               # Project overview
├── DEVELOPER_GUIDE.md      # Developer guide and onboarding
├── pyproject.toml          # Python project configuration
├── specs/                  # Feature specifications
│   ├── 1-phase-ii-task-crud/  # Task CRUD operations
│   │   ├── spec.md         # Feature specification
│   │   ├── plan.md         # Implementation plan
│   │   ├── tasks.md        # Implementation tasks
│   │   ├── research.md     # Technical research
│   │   ├── data-model.md   # Data model definition
│   │   └── quickstart.md   # Quick start guide
│   ├── 2-auth-security-phase-ii/  # Authentication and security
│   │   ├── spec.md         # Feature specification
│   │   ├── plan.md         # Implementation plan
│   │   ├── tasks.md        # Implementation tasks
│   │   ├── research.md     # Technical research
│   │   ├── data-model.md   # Data model definition
│   │   └── quickstart.md   # Quick start guide
│   ├── 3-monorepo-structure/  # Monorepo structure
│   │   ├── spec.md         # Feature specification
│   │   ├── plan.md         # Implementation plan
│   │   ├── tasks.md        # Implementation tasks
│   │   ├── research.md     # Technical research
│   │   ├── data-model.md   # Data model definition
│   │   └── quickstart.md   # Quick start guide
│   ├── template/           # Feature template
│   │   └── feature-template.md
│   └── CLAUDE.md.template  # Template for feature CLAUDE.md files
├── frontend/               # Next.js frontend application
│   ├── CLAUDE.md           # Frontend-specific Claude Code instructions
│   ├── package.json        # Frontend dependencies
│   ├── tsconfig.json       # TypeScript configuration
│   ├── src/
│   │   ├── app/            # Next.js App Router pages
│   │   ├── components/     # Reusable UI components
│   │   ├── lib/            # Utility functions
│   │   ├── styles/         # Global styles
│   │   ├── types/          # TypeScript type definitions
│   │   └── ...             # Other frontend source files
│   ├── public/             # Static assets
│   └── tests/              # Frontend tests
├── backend/                # FastAPI backend application
│   ├── CLAUDE.md           # Backend-specific Claude Code instructions
│   ├── requirements.txt    # Backend dependencies
│   ├── pyproject.toml      # Python project configuration
│   ├── src/
│   │   ├── api/            # API route handlers
│   │   ├── auth/           # Authentication modules
│   │   ├── models/         # Data models
│   │   ├── services/       # Business logic
│   │   ├── main.py         # Application entry point
│   │   └── ...             # Other backend source files
│   ├── tests/              # Backend tests
│   └── alembic/            # Database migration scripts
├── docs/                   # Documentation files
│   ├── structure.md        # Directory structure documentation
│   ├── spec_naming.md      # Specification naming conventions
│   └── claude_usage.md     # Claude Code usage guide
├── history/                # Development history
│   └── prompts/            # Prompt History Records
│       ├── 1-phase-ii-task-crud/  # Task CRUD PHRs
│       ├── 2-auth-security-phase-ii/  # Auth security PHRs
│       ├── 3-monorepo-structure/  # Monorepo structure PHRs
│       └── general/        # General PHRs
└── scripts/                # Common scripts (to be created)
```

## Features

- **Task Management**: Create, read, update, and delete tasks
- **Authentication**: Secure user registration and login with Better Auth
- **Authorization**: JWT-based token system for API access
- **Multi-user Support**: Tasks are isolated by user ownership
- **Responsive UI**: Modern web interface built with Next.js
- **Secure API**: Stateful authentication with token validation
- **Database Integration**: Persistent storage with Neon PostgreSQL

## Technology Stack

- **Frontend**: Next.js 16+, TypeScript, Tailwind CSS
- **Backend**: FastAPI (Python 3.11+), SQLModel ORM
- **Database**: Neon Serverless PostgreSQL
- **Authentication**: Better Auth with JWT tokens
- **Development**: Claude Code, Spec-Kit Plus
- **Testing**: Pytest (backend), Jest (frontend)

## Getting Started

### Prerequisites
- Node.js 18+ for frontend development
- Python 3.11+ for backend development
- Git 2.28+
- Basic understanding of Next.js and FastAPI

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Set up the backend:
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. Set up the frontend:
   ```bash
   cd frontend
   npm install
   ```

4. Configure environment variables:
   ```bash
   # Copy the example environment file
   cp .env.example .env
   # Edit .env with your actual values
   ```

5. Start the development servers:
   - Backend: `cd backend && uvicorn src.main:app --reload`
   - Frontend: `cd frontend && npm run dev`

## Development Workflow

This project follows a specification-driven development approach using Spec-Kit Plus:

1. **Specification**: Create detailed feature specifications in the `specs/` directory
2. **Planning**: Generate implementation plans using `/sp.plan`
3. **Task Generation**: Create detailed task breakdowns using `/sp.tasks`
4. **Implementation**: Execute tasks following the generated plan
5. **History**: Track all development activities in the `history/` directory

### Feature Development Cycle
1. Start with a specification in the `specs/` directory
2. Create numbered feature directories (e.g., `1-feature-name`, `2-another-feature`)
3. Follow the spec → plan → tasks → implement workflow
4. Track changes in the history directory

## Specification-Driven Development

This project uses Claude Code and Spec-Kit Plus for specification-driven development:
- All features are documented in the `specs/` directory before implementation
- Specifications follow a standardized format with user stories and acceptance criteria
- Implementation strictly follows approved specifications and plans
- Prompt History Records (PHRs) are created for all development activities

## Contributing

1. Follow the specification-driven development workflow
2. Create new feature specifications in the `specs/` directory
3. Use the `/sp.*` commands to generate plans and tasks
4. Ensure all changes are covered by specifications
5. Update documentation as needed

For detailed contribution instructions, see `DEVELOPER_GUIDE.md`.