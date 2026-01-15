# Claude Code Usage Documentation

## Overview

This document provides guidance on using Claude Code effectively within the Phase II Todo Application monorepo structure. It covers best practices, navigation, and integration patterns.

## Getting Started with Claude Code

### Initial Setup
Claude Code is pre-configured for this monorepo with the following configuration:
- Root instructions in `CLAUDE.md`
- Directory-specific instructions in `frontend/CLAUDE.md` and `backend/CLAUDE.md`
- Monorepo-specific navigation in `.claude/navigation.md`
- Configuration in `.claude/claude_config.json`

### Understanding the Context
When working with Claude Code in this repository:
1. Claude Code understands the monorepo structure
2. It knows to place frontend files in `frontend/` directory
3. It knows to place backend files in `backend/` directory
4. It follows the separation of concerns between frontend and backend

## Claude Code Navigation in Monorepo

### Directory-Aware Behavior
Claude Code adapts its behavior based on the current directory:

#### In Root Directory
- Provides overall project guidance
- Helps with cross-cutting concerns
- Assists with repository-level tasks

#### In Frontend Directory
- Focuses on Next.js, TypeScript, and Tailwind CSS
- Follows frontend best practices
- Places files in appropriate frontend subdirectories

#### In Backend Directory
- Focuses on FastAPI, Python, and SQLModel
- Follows backend best practices
- Places files in appropriate backend subdirectories

#### In Specs Directory
- Focuses on specification, planning, and task creation
- Maintains consistency with specification templates
- Helps with specification-driven development

## Best Practices for Claude Code Usage

### 1. Be Specific About File Locations
When asking Claude Code to create files, be specific about where they should go:
- "Create a React component in `frontend/src/components/`"
- "Add a FastAPI route in `backend/src/api/`"
- "Update the specification in `specs/1-phase-ii-task-crud/spec.md`"

### 2. Leverage Directory Context
Take advantage of Claude Code's directory awareness:
- When in `frontend/`, you can simply say "Create a new component" and it will place it correctly
- When in `backend/`, you can say "Add a new API route" and it will place it in the right location

### 3. Reference Existing Patterns
When implementing new features, reference existing code patterns:
- "Follow the pattern used in `backend/src/api/tasks.py`"
- "Use the same structure as components in `frontend/src/components/`"

### 4. Use Precise Language
Be clear about what you want:
- Specify technology stacks (React, FastAPI, SQLModel, etc.)
- Mention specific frameworks or libraries
- Reference existing files when wanting similar functionality

## Working with Specifications

### Creating New Features
To create a new feature using Claude Code:
1. Use the feature creation script: `bash .specify/scripts/create-feature.sh <number> <name> "<description>"`
2. Ask Claude Code to help populate the specification: "Update the user stories in `specs/<number>-<name>/spec.md`"
3. Generate implementation plans: "Create an implementation plan for the authentication feature in `specs/2-auth-security-phase-ii/plan.md`"

### Following Specification-Driven Development
When implementing features:
1. Reference the specification: "Based on the requirements in `specs/<feature>/spec.md`, implement..."
2. Follow the plan: "Following the architecture in `specs/<feature>/plan.md`, create..."
3. Complete tasks: "Complete task T001 from `specs/<feature>/tasks.md`"

## Frontend Development with Claude Code

### Component Creation
When creating React components:
```
"Create a new form component in `frontend/src/components/` that handles user input following the pattern in other components"
```

### API Integration
For connecting frontend to backend APIs:
```
"Create an API utility function in `frontend/src/lib/api.ts` to call the tasks endpoint following existing patterns"
```

### Type Definitions
For TypeScript types:
```
"Add a Task type definition in `frontend/src/types/index.ts` that matches the backend model"
```

## Backend Development with Claude Code

### API Routes
When creating API endpoints:
```
"Add a new API route in `backend/src/api/tasks.py` for deleting tasks following the existing patterns"
```

### Data Models
For creating database models:
```
"Define a User model in `backend/src/models/user.py` with email, password, and timestamps"
```

### Authentication
For authentication-related tasks:
```
"Add authentication middleware to the tasks API following the pattern in other routes"
```

## Cross-Directory Coordination

### API Contract Changes
When changing API contracts:
1. Update backend models first
2. Update API endpoints
3. Update frontend API calls to match
4. Test the integration

### Shared Data Structures
For data structures used by both frontend and backend:
- Define the structure in backend models
- Create corresponding TypeScript types in frontend
- Ensure consistency between both representations

## Common Claude Code Commands

### Code Generation
- "Create a new component that..." (in frontend/)
- "Add an API endpoint that..." (in backend/)
- "Update the specification to include..." (in specs/)

### Code Modification
- "Modify the existing function to add..." (be specific about file)
- "Refactor this code to follow..." (reference patterns)

### Documentation
- "Add documentation for this function..."
- "Update the README with information about..."
- "Create a guide for..."

## Troubleshooting Claude Code

### Wrong Directory Placement
If Claude Code places files in the wrong directory:
1. Check if you're in the correct directory
2. Be more specific about the target directory in your request
3. Reference the directory structure documentation

### Technology Confusion
If Claude Code suggests the wrong technology:
1. Be explicit about the technology stack needed
2. Reference existing files using the correct technology
3. Clarify the context (frontend vs backend)

### Pattern Inconsistency
If Claude Code doesn't follow existing patterns:
1. Reference specific files that demonstrate the correct pattern
2. Ask for code that "follows the pattern of [specific file]"
3. Review existing code before asking for new implementations

## Advanced Claude Code Techniques

### Batch Operations
For creating multiple related files:
```
"In the `frontend/src/components/` directory, create three components: TaskList, TaskItem, and TaskForm following existing patterns"
```

### Cross-Reference Implementation
For implementing features that span frontend and backend:
```
"Based on the API specification in `backend/src/api/tasks.py`, create the corresponding frontend component in `frontend/src/components/TaskManager.tsx`"
```

### Validation and Testing
Ask Claude Code to include validation:
```
"Create a form component with proper validation following the patterns in other forms"
```

## Integration with Development Workflow

### Spec-Kit Plus Integration
Claude Code works seamlessly with Spec-Kit Plus:
- Use `/sp.specify` to create specifications
- Use `/sp.plan` to generate plans
- Use `/sp.tasks` to create task breakdowns
- Use Claude Code to implement tasks from the generated task lists

### History Tracking
Claude Code interactions are captured in Prompt History Records:
- Created in `history/prompts/` directory
- Organized by feature
- Preserved for future reference and audit trails

## Security Considerations

When using Claude Code for security-related features:
- Always reference the security requirements in the specifications
- Follow authentication and authorization patterns consistently
- Validate that security measures are implemented on both frontend and backend
- Never expose sensitive information in client-side code

## Performance Optimization

For performance-related tasks:
- Reference existing performance patterns in the codebase
- Follow established optimization strategies
- Consider the impact on both frontend and backend performance
- Test performance implications of changes

By following these guidelines, you can effectively leverage Claude Code to accelerate development while maintaining consistency and quality across the monorepo structure.