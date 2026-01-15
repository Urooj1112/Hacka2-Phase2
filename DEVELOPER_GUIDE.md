# Developer Guide

## Overview

This guide provides instructions for developers working on the Phase II Todo Application. This is a full-stack web application built with Next.js (frontend) and FastAPI (backend) in a monorepo structure.

## Prerequisites

Before starting development, ensure you have:

- Git 2.28+
- Node.js 18+ for frontend development
- Python 3.11+ for backend development
- Basic understanding of Next.js and FastAPI
- Claude Code for AI-assisted development (recommended)

## Setting Up the Development Environment

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-name>
```

### 2. Backend Setup

Navigate to the backend directory and set up the Python environment:

```bash
cd backend

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# For development, you can also install dev dependencies
pip install -e ".[dev]"
```

### 3. Frontend Setup

Navigate to the frontend directory and install dependencies:

```bash
cd frontend
npm install
```

### 4. Environment Variables

Copy the example environment file and configure your settings:

```bash
cp .env.example .env
# Edit .env with your actual values
```

Required environment variables:
- `DATABASE_URL`: Connection string for your PostgreSQL database
- `AUTH_SECRET`: Secret key for JWT token signing
- `AUTH_URL`: Base URL for the authentication service
- `NEXT_PUBLIC_API_BASE_URL`: Base URL for the API endpoints

## Development Workflow

### Specification-Driven Development

This project follows a specification-driven development approach:

1. **Specification**: Create detailed feature specifications in the `specs/` directory
2. **Planning**: Generate implementation plans using `/sp.plan`
3. **Task Generation**: Create detailed task breakdowns using `/sp.tasks`
4. **Implementation**: Execute tasks following the generated plan

### Feature Development Process

1. Create a new feature specification in `specs/<feature-number>-<feature-name>/`
2. Use Claude Code to generate a plan: `/sp.plan`
3. Generate detailed tasks: `/sp.tasks`
4. Implement features following the task list
5. Test and validate your implementation

### Directory Structure

```
.
├── frontend/                # Next.js application
│   ├── src/
│   │   ├── app/            # Next.js App Router pages
│   │   ├── components/     # Reusable UI components
│   │   ├── lib/            # Utility functions
│   │   ├── styles/         # Global styles
│   │   └── types/          # TypeScript type definitions
│   └── ...
├── backend/                 # FastAPI application
│   ├── src/
│   │   ├── api/            # API route handlers
│   │   ├── auth/           # Authentication modules
│   │   ├── models/         # Data models
│   │   ├── services/       # Business logic
│   │   └── main.py         # Application entry point
│   └── ...
├── specs/                   # Feature specifications
└── history/                 # Development history
```

## Working with the Frontend

### Starting the Development Server

```bash
cd frontend
npm run dev
```

### Key Technologies

- Next.js 16+ with App Router
- TypeScript
- Tailwind CSS for styling
- Better Auth for authentication
- JWT token handling

### Component Structure

- Place reusable components in `frontend/src/components/`
- Page-specific components can be co-located with pages in `frontend/src/app/`
- Utility functions in `frontend/src/lib/`
- Type definitions in `frontend/src/types/`

## Working with the Backend

### Starting the Development Server

```bash
cd backend
uvicorn src.main:app --reload
```

### Key Technologies

- FastAPI for web framework
- SQLModel for ORM
- Better Auth for authentication
- Neon PostgreSQL for database
- JWT token validation

### API Structure

- Route handlers in `backend/src/api/`
- Data models in `backend/src/models/`
- Business logic in `backend/src/services/`
- Authentication logic in `backend/src/auth/`

## Authentication System

### Token Flow

1. User registers/logs in through the frontend
2. Better Auth generates JWT tokens
3. Tokens are stored securely on the frontend
4. Tokens are sent with each authenticated API request
5. Backend validates tokens and extracts user information

### Security Measures

- All API endpoints require authentication by default
- JWT tokens are validated server-side
- User IDs are extracted from tokens, not trusted from client input
- Tasks are isolated by user ownership

## Testing

### Backend Tests

Run backend tests with pytest:

```bash
cd backend
pytest
```

### Frontend Tests

Run frontend tests with Jest:

```bash
cd frontend
npm test
```

## Claude Code Usage

This repository is configured for AI-assisted development with Claude Code:

- Claude Code will read `CLAUDE.md` for project-wide instructions
- Directory-specific instructions are available in `frontend/CLAUDE.md` and `backend/CLAUDE.md`
- Claude Code understands the monorepo structure and will place files in appropriate directories
- Use Claude Code for code generation, debugging, and documentation

## Best Practices

### Code Quality

- Follow the coding standards outlined in `.specify/memory/constitution.md`
- Write clean, well-documented code
- Use TypeScript for type safety in frontend
- Follow FastAPI best practices for backend

### Security

- Never expose sensitive information in client-side code
- Validate all inputs server-side
- Use JWT tokens for authentication
- Follow the principle of least privilege

### Performance

- Optimize database queries
- Implement proper caching strategies
- Minimize bundle sizes in frontend
- Use efficient algorithms and data structures

## Troubleshooting

### Common Issues

1. **Dependency Conflicts**: Ensure you're using the correct Node.js and Python versions
2. **Environment Variables**: Verify all required environment variables are set
3. **Database Connection**: Check your database connection string and credentials
4. **Authentication**: Ensure JWT tokens are properly configured and validated

### Getting Help

- Check the existing specifications in `specs/` for guidance
- Review the Prompt History Records in `history/prompts/` for past solutions
- Consult the documentation in `docs/`
- Use Claude Code for assistance with specific issues

## Contributing

### Before Submitting Changes

1. Ensure all tests pass
2. Update relevant documentation
3. Follow the specification-driven development workflow
4. Create a Prompt History Record if using Claude Code for significant changes
5. Verify your changes don't break existing functionality

### Pull Request Process

1. Create a feature branch from the main branch
2. Follow the specification-driven development approach
3. Include tests for new functionality
4. Update documentation as needed
5. Submit a pull request with a clear description of changes