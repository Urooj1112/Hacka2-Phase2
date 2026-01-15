#!/bin/bash

# Monorepo Tools Script
# Collection of helpful commands for working with the Phase II Todo Application monorepo

set -e  # Exit on any error

show_help() {
    echo "Phase II Todo Application Monorepo Tools"
    echo ""
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  help                    Show this help message"
    echo "  frontend-dev            Start frontend development server"
    echo "  backend-dev             Start backend development server"
    echo "  frontend-install        Install frontend dependencies"
    echo "  backend-install         Install backend dependencies"
    echo "  frontend-build          Build frontend application"
    echo "  backend-test            Run backend tests"
    echo "  frontend-test           Run frontend tests"
    echo "  full-test               Run tests for both frontend and backend"
    echo "  create-feature          Create a new feature directory"
    echo "  show-structure          Show the current monorepo structure"
    echo "  validate-structure      Validate the monorepo structure"
    echo ""
}

frontend_dev() {
    echo "Starting frontend development server..."
    cd frontend
    npm run dev
}

backend_dev() {
    echo "Starting backend development server..."
    cd backend
    source venv/bin/activate 2>/dev/null || true  # Activate virtual environment if it exists
    uvicorn src.main:app --reload
}

frontend_install() {
    echo "Installing frontend dependencies..."
    cd frontend
    npm install
}

backend_install() {
    echo "Installing backend dependencies..."
    cd backend
    if [ ! -d "venv" ]; then
        echo "Creating virtual environment..."
        python -m venv venv
    fi
    source venv/bin/activate
    pip install -r requirements.txt
}

frontend_build() {
    echo "Building frontend application..."
    cd frontend
    npm run build
}

backend_test() {
    echo "Running backend tests..."
    cd backend
    source venv/bin/activate 2>/dev/null || true
    pytest
}

frontend_test() {
    echo "Running frontend tests..."
    cd frontend
    npm test
}

full_test() {
    echo "Running tests for both frontend and backend..."

    echo "Running backend tests..."
    cd backend
    source venv/bin/activate 2>/dev/null || true
    pytest

    echo "Running frontend tests..."
    cd ../frontend
    npm test
}

create_feature() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 create-feature <number> <name>"
        echo "Example: $0 create-feature 4 user-profile-management"
        exit 1
    fi

    FEATURE_NUMBER=$1
    FEATURE_NAME=$2

    echo "Creating new feature: ${FEATURE_NUMBER}-${FEATURE_NAME}"

    bash .specify/scripts/create-feature.sh "${FEATURE_NUMBER}" "${FEATURE_NAME}" "New feature: ${FEATURE_NAME}"
}

show_structure() {
    echo "Current Monorepo Structure:"
    echo ""
    find . -maxdepth 3 -type d | grep -v "\.git" | grep -v "node_modules" | grep -v "__pycache__" | sort
    echo ""
    echo "Key Files:"
    find . -maxdepth 2 -name "*.md" -o -name "*.json" -o -name "*.toml" -o -name "*.txt" | grep -v "\.git" | grep -v "node_modules" | grep -v "__pycache__" | sort
}

validate_structure() {
    echo "Validating monorepo structure..."

    # Check essential directories exist
    dirs_to_check=("frontend" "backend" "specs" "history" ".specify" ".claude" "docs")
    missing_dirs=()

    for dir in "${dirs_to_check[@]}"; do
        if [ ! -d "$dir" ]; then
            missing_dirs+=("$dir")
        fi
    done

    if [ ${#missing_dirs[@]} -ne 0 ]; then
        echo "❌ Missing directories: ${missing_dirs[*]}"
        exit 1
    else
        echo "✅ All essential directories present"
    fi

    # Check essential files exist
    files_to_check=("README.md" "CLAUDE.md" "pyproject.toml")
    missing_files=()

    for file in "${files_to_check[@]}"; do
        if [ ! -f "$file" ]; then
            missing_files+=("$file")
        fi
    done

    if [ ${#missing_files[@]} -ne 0 ]; then
        echo "❌ Missing files: ${missing_files[*]}"
        exit 1
    else
        echo "✅ All essential files present"
    fi

    # Check feature directories have required files
    for feature_dir in specs/*; do
        if [ -d "$feature_dir" ]; then
            feature_name=$(basename "$feature_dir")
            required_files=("spec.md" "plan.md" "tasks.md")
            missing_feature_files=()

            for req_file in "${required_files[@]}"; do
                if [ ! -f "$feature_dir/$req_file" ]; then
                    missing_feature_files+=("$feature_name/$req_file")
                fi
            done

            if [ ${#missing_feature_files[@]} -ne 0 ]; then
                echo "❌ Missing files in feature $feature_name: ${missing_feature_files[*]}"
            fi
        fi
    done

    echo "✅ Monorepo structure validation completed"
}

# Parse command line arguments
case "${1:-help}" in
    "help"|"--help"|"-h")
        show_help
        ;;
    "frontend-dev")
        frontend_dev
        ;;
    "backend-dev")
        backend_dev
        ;;
    "frontend-install")
        frontend_install
        ;;
    "backend-install")
        backend_install
        ;;
    "frontend-build")
        frontend_build
        ;;
    "backend-test")
        backend_test
        ;;
    "frontend-test")
        frontend_test
        ;;
    "full-test")
        full_test
        ;;
    "create-feature")
        shift
        create_feature "$@"
        ;;
    "show-structure")
        show_structure
        ;;
    "validate-structure")
        validate_structure
        ;;
    *)
        echo "Unknown command: $1"
        echo ""
        show_help
        exit 1
        ;;
esac