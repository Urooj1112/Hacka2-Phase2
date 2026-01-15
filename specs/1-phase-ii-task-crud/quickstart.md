# Quickstart Guide: Phase II Task CRUD Operations

## Overview
Quick setup guide for the full-stack todo application with user authentication and task management capabilities.

## Prerequisites
- Node.js 18+ for frontend development
- Python 3.11+ for backend development
- PostgreSQL-compatible database (Neon recommended)
- Better Auth account configured (if using hosted version)

## Environment Setup

### Backend Setup
1. Navigate to the backend directory: `cd backend`
2. Install Python dependencies: `pip install -r requirements.txt`
3. Set up environment variables in `.env`:
   ```
   DATABASE_URL=postgresql://user:password@host:port/database
   JWT_SECRET_KEY=your-secret-key-here
   BETTER_AUTH_SECRET=your-better-auth-secret
   ```
4. Run database migrations: `alembic upgrade head`
5. Start the backend server: `uvicorn main:app --reload`

### Frontend Setup
1. Navigate to the frontend directory: `cd frontend`
2. Install JavaScript dependencies: `npm install`
3. Set up environment variables in `.env.local`:
   ```
   NEXT_PUBLIC_API_BASE_URL=http://localhost:8000
   NEXTAUTH_URL=http://localhost:3000
   ```
4. Start the development server: `npm run dev`

## API Endpoints

### Authentication
- Register: `POST /api/auth/register`
- Login: `POST /api/auth/login`
- Logout: `POST /api/auth/logout`

### Task Operations
- Get tasks: `GET /api/v1/tasks`
- Create task: `POST /api/v1/tasks`
- Get specific task: `GET /api/v1/tasks/{taskId}`
- Update task: `PUT /api/v1/tasks/{taskId}`
- Delete task: `DELETE /api/v1/tasks/{taskId}`
- Toggle completion: `PATCH /api/v1/tasks/{taskId}/complete`

## Basic Usage

### Creating a Task
1. Authenticate with your credentials
2. Make a POST request to `/api/v1/tasks` with:
   ```json
   {
     "title": "Complete project documentation",
     "description": "Write comprehensive guides for the todo app",
     "due_date": "2024-12-31T23:59:59Z"
   }
   ```

### Viewing Tasks
1. Make a GET request to `/api/v1/tasks`
2. The response will include only tasks owned by the authenticated user

### Updating a Task
1. Make a PUT request to `/api/v1/tasks/{taskId}` with updated data
2. Only the task owner can update the task

### Deleting a Task
1. Make a DELETE request to `/api/v1/tasks/{taskId}`
2. Only the task owner can delete the task

## Testing

### Backend Tests
Run backend tests with: `pytest tests/`

### Frontend Tests
Run frontend tests with: `npm run test`

### Integration Tests
Run integration tests that verify the full stack works together:
`pytest tests/integration/`

## Troubleshooting

### Common Issues
1. **Authentication errors**: Ensure JWT token is included in Authorization header
2. **Database connection**: Verify DATABASE_URL is correctly configured
3. **CORS issues**: Check that frontend domain is allowed in backend CORS settings

### Development Tips
1. Use the built-in Swagger UI at `/docs` to test API endpoints
2. Check server logs for detailed error information
3. Use browser dev tools to inspect network requests and responses