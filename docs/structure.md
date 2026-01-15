# Directory Structure Documentation

## Overview

This document describes the monorepo structure of the Phase II Todo Application, which combines a Next.js frontend and FastAPI backend in a single repository with centralized specifications and development history.

## Root Directory Structure

```
.
├── .claude/                 # Claude Code configuration
├── .specify/                # Spec-Kit configuration
├── specs/                   # Feature specifications
│   ├── 1-phase-ii-task-crud/
│   ├── 2-auth-security-phase-ii/
│   └── 3-monorepo-structure/
├── frontend/                # Next.js frontend application
│   ├── src/
│   │   ├── app/            # Next.js App Router pages
│   │   ├── components/     # Reusable UI components
│   │   ├── lib/            # Utility functions
│   │   ├── styles/         # Global styles
│   │   └── types/          # TypeScript type definitions
│   ├── public/             # Static assets
│   ├── tests/              # Frontend tests
│   ├── package.json
│   └── tsconfig.json
├── backend/                 # FastAPI backend application
│   ├── src/
│   │   ├── api/            # API route handlers
│   │   ├── auth/           # Authentication modules
│   │   ├── models/         # Data models
│   │   ├── services/       # Business logic
│   │   └── main.py         # Application entry point
│   ├── tests/              # Backend tests
│   ├── requirements.txt
│   └── alembic/            # Database migration scripts
├── history/                 # Development history
│   └── prompts/            # Prompt History Records
├── docs/                   # Documentation files
├── CLAUDE.md               # Root Claude Code instructions
├── README.md               # Project overview
├── .env.example           # Environment variable examples
└── pyproject.toml         # Python project configuration
```

## Directory Descriptions

### `.claude/`
Contains Claude Code configuration files that guide AI-assisted development in this repository.

### `.specify/`
Contains Spec-Kit Plus configuration files, templates, and scripts for specification-driven development.

### `specs/`
Centralized location for all feature specifications, organized by feature number and name:
- `spec.md` - Feature requirements and user stories
- `plan.md` - Implementation architecture and technical decisions
- `tasks.md` - Detailed implementation tasks
- `research.md` - Technical research and feasibility studies
- `data-model.md` - Data structure definitions
- `quickstart.md` - Quick start guide for the feature

### `frontend/`
Next.js application implementing the user interface and client-side logic:
- `src/app/` - Next.js App Router pages and layouts
- `src/components/` - Reusable React components
- `src/lib/` - Client-side utility functions and helpers
- `src/styles/` - Global styles and Tailwind configuration
- `src/types/` - TypeScript type definitions
- `public/` - Static assets like images and icons
- `tests/` - Client-side tests and test utilities

### `backend/`
FastAPI application implementing server-side logic and API endpoints:
- `src/api/` - API route handlers and endpoint definitions
- `src/auth/` - Authentication and authorization modules
- `src/models/` - Database models and schema definitions
- `src/services/` - Business logic and service layers
- `src/main.py` - Application entry point and configuration
- `tests/` - Server-side tests and test utilities
- `alembic/` - Database migration scripts

### `history/`
Development history tracking for all project activities:
- `prompts/` - Prompt History Records for all AI interactions
- Subdirectories organized by feature name

### `docs/`
Documentation files for the project, including this structure document.

## File Organization Principles

1. **Separation of Concerns**: Frontend and backend code are kept in separate directories
2. **Centralized Specifications**: All feature specs are in one location (`specs/`)
3. **Hierarchical Configuration**: Configuration files at appropriate levels
4. **Feature Isolation**: Each feature has its own complete set of artifacts
5. **Traceability**: Clear relationships between specifications, plans, and implementations

## Navigation Guidelines

- All frontend development occurs within the `frontend/` directory
- All backend development occurs within the `backend/` directory
- All feature specifications are stored in `specs/<feature-name>/`
- Documentation is stored in the `docs/` directory
- Configuration files are placed at the appropriate level (root, frontend, or backend)
- History records are automatically generated in `history/prompts/`