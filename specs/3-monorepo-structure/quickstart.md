# Quickstart Guide: Phase II Monorepo Structure

## Overview
Quick setup guide for navigating and working with the Phase II monorepo structure for the todo application.

## Prerequisites
- Git 2.28+ for proper monorepo handling
- Node.js 18+ for frontend development
- Python 3.11+ for backend development
- Claude Code for AI-assisted development (optional)
- Basic understanding of Next.js and FastAPI

## Repository Structure

### Directory Layout
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
│   ├── public/
│   ├── tests/
│   └── package.json
├── backend/                 # FastAPI backend application
│   ├── src/
│   ├── tests/
│   └── requirements.txt
├── history/                 # Development history
│   └── prompts/
├── CLAUDE.md                # Root Claude Code instructions
├── README.md
└── pyproject.toml
```

## Getting Started

### 1. Clone the Repository
```bash
git clone <repository-url>
cd <repository-name>
```

### 2. Understanding the Structure
- **specs/**: Contains all feature specifications, plans, and tasks
- **frontend/**: Next.js application with components, pages, and utilities
- **backend/**: FastAPI application with models, services, and API endpoints
- **history/**: Prompt history records for development tracking

### 3. Working with Features
Each feature has its own directory in `specs/` with:
- `spec.md`: Feature specification
- `plan.md`: Implementation plan
- `tasks.md`: Detailed tasks for implementation
- `contracts/`: API contracts and interfaces
- `checklists/`: Quality checklists

## Development Workflow

### Adding a New Feature
1. Create a new feature specification using the Spec-Kit workflow:
   ```bash
   # From the repository root
   /sp.specify "Description of your new feature"
   ```

2. Create the implementation plan:
   ```bash
   /sp.plan
   ```

3. Generate the detailed tasks:
   ```bash
   /sp.tasks
   ```

4. Implement the feature following the tasks in the feature's `tasks.md`

### Frontend Development
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

4. All frontend code goes in the `frontend/` directory only

### Backend Development
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Set up a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Start the development server:
   ```bash
   uvicorn src.main:app --reload
   ```

5. All backend code goes in the `backend/` directory only

## Claude Code Navigation

### Understanding the Structure
Claude Code understands the monorepo structure and will:
- Place frontend files in the `frontend/` directory
- Place backend files in the `backend/` directory
- Place specifications in the appropriate `specs/` feature directory
- Follow the separation of concerns between frontend and backend

### Working with Claude Code
1. Claude Code will read the root `CLAUDE.md` for project-wide instructions
2. When working in specific directories, Claude Code will follow directory-specific instructions
3. Claude Code understands the feature directory structure and will place files appropriately

## Spec-Kit Plus Integration

### Running Spec-Kit Commands
All Spec-Kit commands should be run from the repository root:
- `/sp.specify` - Create feature specifications
- `/sp.plan` - Create implementation plans
- `/sp.tasks` - Generate detailed tasks
- `/sp.implement` - Execute implementation

### Feature Development Cycle
1. Start with a specification in the `specs/` directory
2. Create numbered feature directories (e.g., `1-feature-name`, `2-another-feature`)
3. Follow the spec → plan → tasks → implement workflow
4. Track changes in the history directory

## Spec Management Instructions

### Creating New Specifications
1. Use the feature creation script to initialize a new feature:
   ```bash
   # From the repository root
   bash .specify/scripts/create-feature.sh <number> <feature-name> "<description>"
   ```

   Example:
   ```bash
   bash .specify/scripts/create-feature.sh 4 user-profile-management "Add user profile management functionality"
   ```

2. Alternatively, create the feature directory manually:
   ```bash
   mkdir specs/4-user-profile-management
   touch specs/4-user-profile-management/{spec.md,plan.md,tasks.md,research.md,data-model.md,quickstart.md}
   ```

### Specification Naming Convention
- Use the format: `specs/<number>-<feature-name>/`
- Number sequentially (1, 2, 3, etc.)
- Use lowercase with hyphens separating words
- Make the name descriptive but concise
- Examples: `specs/1-phase-ii-task-crud/`, `specs/2-auth-security-phase-ii/`

### Specification Content Standards
Each specification should include:
- Clear user stories with acceptance criteria
- Functional and non-functional requirements
- Success metrics and validation rules
- API endpoint mappings (if applicable)
- Security considerations
- Dependencies and constraints

### Managing Existing Specifications
- Keep specifications up-to-date as features evolve
- Update the spec before making significant implementation changes
- Reference related specifications when there are dependencies
- Include links to relevant architecture decision records (ADRs)

### Specification Review Process
1. Review the specification for completeness and clarity
2. Validate that user stories are independently testable
3. Ensure requirements are specific and measurable
4. Confirm that success criteria are achievable and verifiable
5. Verify that security and performance requirements are addressed

### Template Usage
- Use the templates in `.specify/templates/` as starting points
- Customize templates for specific feature needs
- Maintain consistency with existing specifications
- Update templates when new patterns emerge

## Synchronization Between Frontend and Backend

### API Contracts
- Define API contracts in the feature's `contracts/` directory
- Use OpenAPI/Swagger format for API specifications
- Generate frontend API clients from backend contracts
- Ensure both frontend and backend teams work from the same contract

### Cross-Component Changes
- For changes that affect both frontend and backend:
  1. Update the API contract first
  2. Implement backend changes
  3. Update frontend to match new contract
  4. Test integration points

## Quality Assurance

### Structure Compliance
- All frontend code must be in the `frontend/` directory
- All backend code must be in the `backend/` directory
- All specifications must be in the `specs/` directory
- Follow the numbered feature directory convention

### Best Practices
- Maintain clear separation of concerns
- Keep specifications up-to-date with implementation
- Use consistent naming conventions
- Follow the established directory structure

## Troubleshooting

### Common Issues
1. **Wrong Directory**: Claude Code places files in wrong directory
   - Solution: Ensure CLAUDE.md files have clear instructions about directory structure

2. **Missing Dependencies**: New dependencies not added to correct package manager
   - Solution: Follow the appropriate package manager for each module

3. **Integration Problems**: Frontend and backend don't work together
   - Solution: Verify API contracts are properly defined and followed

### Development Tips
1. Always run Spec-Kit commands from the repository root
2. Check the `specs/` directory for existing feature implementations
3. Use the history directory to understand previous development decisions
4. Keep feature directories organized and well-documented

## Navigation Examples

### Finding Feature Specifications
- Task CRUD operations: `specs/1-phase-ii-task-crud/`
- Authentication and security: `specs/2-auth-security-phase-ii/`
- Monorepo structure: `specs/3-monorepo-structure/`
- Adding new features: `specs/<next-number>-<feature-name>/`

### Locating Key Components
- Frontend API calls: `frontend/src/lib/api.ts`
- Backend API routes: `backend/src/api/v1/`
- Data models: `backend/src/models/`
- Authentication logic: `backend/src/auth/`
- Reusable components: `frontend/src/components/`
- Type definitions: `frontend/src/types/` or `backend/src/models/`

### Accessing Documentation
- Overall structure: `docs/structure.md`
- Developer guide: `DEVELOPER_GUIDE.md`
- Feature specs: `specs/<feature>/spec.md`
- Implementation plans: `specs/<feature>/plan.md`
- Task breakdowns: `specs/<feature>/tasks.md`
- Prompt history: `history/prompts/<feature>/`

### Working with Claude Code
- Root instructions: `CLAUDE.md`
- Frontend-specific: `frontend/CLAUDE.md` (will be created in future)
- Backend-specific: `backend/CLAUDE.md` (will be created in future)
- Feature-specific: `specs/<feature>/CLAUDE.md` (will be created in future)

These navigation examples demonstrate how Claude Code and developers can efficiently locate and work with the various components of this monorepo structure.

## Final Workflow Instructions

### Using the Monorepo Tools Script
The monorepo includes a tools script to simplify common operations:

1. **Start Development Servers**:
   ```bash
   # Start frontend development server
   bash scripts/monorepo-tools.sh frontend-dev

   # Start backend development server
   bash scripts/monorepo-tools.sh backend-dev
   ```

2. **Install Dependencies**:
   ```bash
   # Install frontend dependencies
   bash scripts/monorepo-tools.sh frontend-install

   # Install backend dependencies
   bash scripts/monorepo-tools.sh backend-install
   ```

3. **Run Tests**:
   ```bash
   # Run backend tests
   bash scripts/monorepo-tools.sh backend-test

   # Run frontend tests
   bash scripts/monorepo-tools.sh frontend-test

   # Run all tests
   bash scripts/monorepo-tools.sh full-test
   ```

4. **Create New Features**:
   ```bash
   # Create a new feature directory
   bash scripts/monorepo-tools.sh create-feature 4 new-feature-name "Description of new feature"
   ```

5. **Validate Structure**:
   ```bash
   # Validate the monorepo structure
   bash scripts/monorepo-tools.sh validate-structure
   ```

### Linting and Formatting
The project includes linting and formatting configurations:
- Python: Black, Flake8, and isort
- JavaScript/TypeScript: ESLint and Prettier
- Use the pre-commit hooks to ensure code quality

To install and use pre-commit hooks:
```bash
# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Run all hooks on all files
pre-commit run --all-files
```

### Editor Configuration
The project includes `.editorconfig` to ensure consistent formatting across editors. Most modern editors support this file automatically.

### Best Practices for Completion
1. Always follow the specification-driven development workflow
2. Use the tools and scripts provided to maintain consistency
3. Keep the monorepo structure organized and well-documented
4. Validate the structure regularly using the validation tools
5. Update documentation as needed when making changes
6. Use the pre-commit hooks to maintain code quality
7. Follow the monorepo best practices outlined in `docs/monorepo_best_practices.md`

This completes the implementation of the monorepo structure for the Phase II Todo Application, providing a solid foundation for continued development with proper separation of concerns, tool integration, and developer navigation aids.