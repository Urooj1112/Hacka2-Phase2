# Data Model: Phase II Monorepo Project Structure

## Overview
Data model for the monorepo structure of the Phase II todo application, defining the organizational entities and relationships.

## Entity Definitions

### Monorepo Root
Represents the top-level directory of the monorepo project.

**Fields**:
- `name`: String (Project name - "Phase II Todo Application")
- `configuration`: Map (Global configuration files like package.json, pyproject.toml)
- `documentation`: Map (Top-level documentation files like README.md)
- `tooling`: Map (Shared tool configurations like .gitignore, .env.example)

**Relationships**:
- Contains multiple Feature Directories
- Contains Frontend Module
- Contains Backend Module
- Contains Specifications Directory
- Contains History Directory

### Frontend Module
Represents the self-contained frontend application within the monorepo.

**Fields**:
- `type`: String (Fixed: "Next.js application")
- `src_dir`: String (Path: "frontend/src/")
- `public_dir`: String (Path: "frontend/public/")
- `config_files`: Array (Files: ["package.json", "tsconfig.json", "next.config.js"])
- `test_dir`: String (Path: "frontend/tests/")

**Relationships**:
- Belongs to Monorepo Root
- Contains Frontend Components
- Contains Frontend Pages
- Contains Frontend Utilities

### Backend Module
Represents the self-contained backend application within the monorepo.

**Fields**:
- `type`: String (Fixed: "FastAPI application")
- `src_dir`: String (Path: "backend/src/")
- `model_dir`: String (Path: "backend/src/models/")
- `api_dir`: String (Path: "backend/src/api/")
- `config_files`: Array (Files: ["requirements.txt", "alembic.ini"])
- `test_dir`: String (Path: "backend/tests/")

**Relationships**:
- Belongs to Monorepo Root
- Contains Backend Models
- Contains Backend Services
- Contains Backend API Endpoints

### Specifications Directory
Centralized location for all feature specifications, plans, and tasks.

**Fields**:
- `type`: String (Fixed: "Specifications directory")
- `path`: String (Path: "specs/")
- `features`: Array (List of feature directories with numbering)

**Relationships**:
- Belongs to Monorepo Root
- Contains Feature Directories

### Feature Directory
Organized subdirectory containing all artifacts for a single feature.

**Fields**:
- `feature_id`: String (Unique identifier with numbering, e.g., "1-phase-ii-task-crud")
- `spec_file`: String (Path to spec.md)
- `plan_file`: String (Path to plan.md)
- `tasks_file`: String (Path to tasks.md)
- `contracts_dir`: String (Path to contracts/ directory)
- `checklists_dir`: String (Path to checklists/ directory)

**Relationships**:
- Belongs to Specifications Directory
- Contains Feature Artifacts

### CLAUDE Configuration
Configuration file that guides Claude Code's behavior in different contexts.

**Fields**:
- `level`: String (Scope: "root", "frontend", "backend", "feature")
- `instructions`: String (Specific instructions for Claude Code)
- `constraints`: Array (List of constraints and guidelines)
- `path`: String (File path to the CLAUDE.md file)

**Relationships**:
- Belongs to Directory Level (Root, Frontend, Backend, or Feature)

### History Directory
Location for prompt history records and architecture decision records.

**Fields**:
- `type`: String (Fixed: "History records directory")
- `prompts_dir`: String (Path: "history/prompts/")
- `adrs_dir`: String (Path: "history/adrs/")

**Relationships**:
- Belongs to Monorepo Root
- Contains Prompt History Records
- Contains Architecture Decision Records

## Relationships Summary

```
Monorepo Root
├── Frontend Module
│   ├── Frontend Components
│   ├── Frontend Pages
│   └── Frontend Utilities
├── Backend Module
│   ├── Backend Models
│   ├── Backend Services
│   └── Backend API Endpoints
├── Specifications Directory
│   └── Feature Directories
│       ├── spec.md
│       ├── plan.md
│       ├── tasks.md
│       ├── contracts/
│       └── checklists/
├── History Directory
│   ├── Prompt History Records
│   └── Architecture Decision Records
└── CLAUDE Configuration (at multiple levels)
```

## Organizational Principles

1. **Separation of Concerns**: Frontend and Backend modules are clearly separated
2. **Centralized Specifications**: All feature specs are in one location
3. **Hierarchical Configuration**: CLAUDE.md files at appropriate levels
4. **Feature Isolation**: Each feature has its own complete set of artifacts
5. **Traceability**: Clear relationships between specifications, plans, and implementations