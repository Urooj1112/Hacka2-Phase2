# Quickstart Guide: Authentication and Security in Phase II

## Overview
Quick setup guide for the authentication and security features using Better Auth and JWT tokens.

## Prerequisites
- Node.js 18+ for frontend development
- Python 3.11+ for backend development
- Better Auth account configured (if using hosted version)
- Secure environment for storing secrets

## Environment Setup

### Backend Setup
1. Navigate to the backend directory: `cd backend`
2. Install Python dependencies: `pip install -r requirements.txt`
3. Set up environment variables in `.env`:
   ```
   # Database Configuration
   DATABASE_URL=postgresql://user:password@host:port/database

   # JWT Configuration
   JWT_SECRET_KEY=your-super-secret-jwt-key-change-in-production
   ACCESS_TOKEN_EXPIRE_MINUTES=30

   # Better Auth Configuration
   BETTER_AUTH_SECRET=your-better-auth-secret
   ```
4. Start the backend server: `uvicorn src.main:app --reload`

### Frontend Setup
1. Navigate to the frontend directory: `cd frontend`
2. Install JavaScript dependencies: `npm install`
3. Set up environment variables in `.env.local`:
   ```
   NEXT_PUBLIC_API_BASE_URL=http://localhost:8000
   NEXTAUTH_URL=http://localhost:3000
   NEXTAUTH_SECRET=your-nextauth-secret
   ```
4. Start the development server: `npm run dev`

## Authentication Flow

### User Registration
1. User visits the registration page
2. User provides email and password
3. Frontend sends registration request to Better Auth
4. Better Auth creates user account
5. Upon successful login, JWT token is issued for API access

### User Login
1. User visits the login page
2. User provides email and password
3. Frontend authenticates with Better Auth
4. Upon successful authentication, JWT token is issued
5. Token is stored securely and used for subsequent API requests

### Protected Resource Access
1. User makes API request with JWT token in Authorization header
2. Backend verifies JWT signature using shared secret
3. Backend validates token expiration
4. Backend extracts user ID from token claims
5. Backend verifies user has access to requested resource
6. Response is returned if authorized

## API Authentication

### Making Authenticated Requests
All API requests to protected endpoints must include the JWT token in the Authorization header:

```
Authorization: Bearer <jwt-token>
```

### Error Handling
- 401 Unauthorized: Request lacks valid authentication credentials
- 403 Forbidden: Valid authentication but insufficient permissions
- 422 Unprocessable Entity: Invalid request format

## Security Best Practices

### Token Management
- Store JWT tokens securely (preferably in httpOnly cookies or secure local storage)
- Implement automatic token refresh before expiration
- Log out users by clearing stored tokens
- Never log JWT tokens or other sensitive information

### Secret Management
- Store JWT_SECRET_KEY in environment variables only
- Use strong, randomly generated secrets
- Rotate secrets periodically
- Never commit secrets to version control

### Input Validation
- Validate all user inputs on both frontend and backend
- Implement rate limiting for authentication endpoints
- Use secure password policies

## Testing

### Backend Authentication Tests
Run authentication tests with: `pytest tests/auth/`

### Frontend Authentication Tests
Run frontend auth tests with: `npm run test -- auth/`

### Integration Tests
Test the complete authentication flow:
1. Register new user
2. Login and receive JWT token
3. Access protected endpoints with token
4. Verify unauthorized access is rejected

## Troubleshooting

### Common Issues
1. **Token verification failures**: Check that JWT_SECRET_KEY matches between frontend and backend
2. **Authentication errors**: Verify Better Auth configuration and credentials
3. **CORS issues**: Ensure frontend domain is allowed in backend CORS settings
4. **Expired tokens**: Implement proper token refresh mechanisms

### Development Tips
1. Use the built-in authentication endpoints for testing
2. Check server logs for detailed authentication error information
3. Use browser dev tools to inspect authentication headers and responses
4. Implement proper error handling for different authentication failure scenarios