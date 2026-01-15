# Spec Naming Convention Documentation

## Overview

This document defines the naming conventions for feature specifications in the Phase II Todo Application monorepo. Consistent naming enables easy navigation and understanding of the project's evolution.

## Naming Format

Feature specifications follow the format:
```
specs/<number>-<feature-name>/[artifact-type].[extension]
```

Where:
- `<number>`: Sequential feature number (starting from 1)
- `<feature-name>`: Descriptive, hyphen-separated feature identifier
- `[artifact-type]`: Type of specification artifact (spec, plan, tasks, etc.)
- `[extension]`: File extension (.md for markdown)

## Numbering System

### Sequential Assignment
- Numbers are assigned sequentially based on development order
- No gaps in numbering (e.g., 1, 2, 3, not 1, 3, 5)
- Each feature gets a unique number regardless of complexity

### Examples
- `specs/1-phase-ii-task-crud/spec.md` - First feature: Task CRUD operations
- `specs/2-auth-security-phase-ii/spec.md` - Second feature: Authentication security
- `specs/3-monorepo-structure/spec.md` - Third feature: Monorepo structure
- `specs/4-user-profile-management/spec.md` - Fourth feature: User profiles

## Feature Name Guidelines

### Format
- Use lowercase letters only
- Separate words with hyphens (-)
- Use descriptive but concise names
- Avoid abbreviations unless widely understood

### Recommended Patterns
- `{feature-area}-{operation}`: `user-authentication`, `task-management`
- `{primary-entity}-{secondary-entity}-{operation}`: `user-task-assignment`
- `{capability}-{aspect}`: `real-time-notifications`, `batch-processing`

### Examples of Good Names
- `task-crud-operations`
- `user-authentication`
- `real-time-sync`
- `mobile-responsive-design`
- `api-rate-limiting`

### Examples of Poor Names
- `new_feature` (too generic)
- `UserAuth` (mixed case)
- `feat1` (not descriptive)
- `really_long_and_complicated_feature_name` (too long)

## Artifact Types

Each feature directory contains standardized artifacts:

### Required Artifacts
- `spec.md` - Feature specification and requirements
- `plan.md` - Implementation plan and architecture
- `tasks.md` - Detailed implementation tasks

### Optional Artifacts
- `research.md` - Technical research and feasibility studies
- `data-model.md` - Data structure definitions
- `quickstart.md` - Quick start guide for the feature
- `contracts/` - API contracts and interfaces
- `checklists/` - Quality checklists

## Version Control

### Branch Naming
Feature branches follow the pattern:
```
feature/<number>-<feature-name>
```

### Commit Messages
Commit messages for specification changes should reference the feature:
```
feat(specs): Add authentication spec for 2-auth-security-phase-ii

- Define user authentication requirements
- Specify JWT token handling
- Outline security constraints
```

## Migration Guidelines

When renaming or reorganizing specifications:

1. Update all references in related documentation
2. Update links in README.md and other navigation documents
3. Update any hardcoded paths in scripts or tools
4. Create redirects if external references exist
5. Document the change in the history/prompt records

## Enforcement

### Automated Checks
- CI/CD pipeline validates naming convention compliance
- Scripts verify sequential numbering
- Linting tools check format adherence

### Manual Reviews
- Specification reviews include naming convention checks
- Peer reviews verify appropriate feature naming
- Architecture reviews validate artifact organization

## Exceptions

### Legacy Features
Existing features that don't follow the convention should be updated when:
- Making significant changes to the feature
- During major refactoring efforts
- When the feature is being extended

### Special Cases
Some features may require subdirectories for complex specifications:
```
specs/5-complex-feature/core-spec.md
specs/5-complex-feature/advanced-options.md
```

## Best Practices

1. **Be Consistent**: Always follow the established patterns
2. **Be Descriptive**: Choose names that clearly indicate the feature's purpose
3. **Be Predictable**: Other team members should be able to predict the name
4. **Be Concise**: Balance descriptiveness with brevity
5. **Be Future-Friendly**: Consider how the name might work as the feature evolves

## Reference Examples

| Feature | Directory Name | Reason |
|---------|----------------|---------|
| Task CRUD Operations | `1-phase-ii-task-crud` | First major feature of Phase II |
| Authentication Security | `2-auth-security-phase-ii` | Second feature, security-focused |
| Monorepo Structure | `3-monorepo-structure` | Third feature, structure-focused |
| User Profile Management | `4-user-profile-management` | Fourth feature, user-focused |

Following these naming conventions ensures that the specifications remain organized, discoverable, and maintainable as the project grows.