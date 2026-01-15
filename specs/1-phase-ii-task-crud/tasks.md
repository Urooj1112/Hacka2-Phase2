---
description: "Task list for Phase II Task CRUD operations"
---

# Tasks: Phase II Task CRUD Operations

**Input**: Design documents from `/specs/1-phase-ii-task-crud/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: The examples below include test tasks. Tests are OPTIONAL - only include them if explicitly requested in the feature specification.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

- **Single project**: `src/`, `tests/` at repository root
- **Web app**: `backend/src/`, `frontend/src/`
- **Mobile**: `api/src/`, `ios/src/` or `android/src/`
- Paths shown below assume single project - adjust based on plan.md structure

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 Create backend directory structure per implementation plan
- [x] T002 Create frontend directory structure per implementation plan
- [x] T003 [P] Initialize backend project with FastAPI dependencies in backend/requirements.txt
- [x] T004 [P] Initialize frontend project with Next.js dependencies in frontend/package.json
- [x] T005 [P] Configure basic linting and formatting tools for both projects

---
## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T006 Setup database schema and migrations framework in backend/
- [x] T007 [P] Implement authentication/authorization framework with Better Auth in backend/src/api/deps.py
- [x] T008 [P] Setup API routing and middleware structure in backend/src/main.py
- [x] T009 Create base models/entities that all stories depend on in backend/src/models/base.py
- [x] T010 Configure error handling and logging infrastructure in backend/src/main.py
- [x] T011 Setup environment configuration management in backend/.env
- [x] T012 Create base API client for frontend in frontend/src/lib/api-client.ts
- [x] T013 Create protected route component for authentication in frontend/src/app/auth/components/ProtectedRoute.tsx

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---
## Phase 3: User Story 1 - Add New Task (Priority: P1) 🎯 MVP

**Goal**: Enable authenticated users to create new tasks in their personal todo list with title, description, and due date

**Independent Test**: Users can successfully create a new task with required information and see it appear in their task list, demonstrating the core functionality of the todo application.

### Tests for User Story 1 (OPTIONAL - only if tests requested) ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [ ] T014 [P] [US1] Contract test for POST /api/v1/tasks endpoint in backend/tests/contract/test_tasks.py
- [ ] T015 [P] [US1] Integration test for task creation user journey in backend/tests/integration/test_task_creation.py

### Implementation for User Story 1

- [x] T016 [P] [US1] Create Task model in backend/src/models/task.py
- [x] T017 [US1] Implement TaskService in backend/src/services/task_service.py (depends on T016)
- [x] T018 [US1] Implement POST /api/v1/tasks endpoint in backend/src/api/v1/tasks.py (depends on T017)
- [x] T019 [US1] Create TaskForm component in frontend/src/app/tasks/components/TaskForm.tsx
- [x] T020 [US1] Create Task API client functions in frontend/src/app/tasks/api/tasks.ts
- [x] T021 [US1] Add task creation functionality to TaskForm in frontend/src/app/tasks/components/TaskForm.tsx
- [x] T022 [US1] Add validation and error handling for task creation in frontend/src/app/tasks/components/TaskForm.tsx

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---
## Phase 4: User Story 2 - View Personal Task List (Priority: P1)

**Goal**: Allow authenticated users to view all tasks that belong to them, with only their tasks displayed

**Independent Test**: Users can log in and see only their own tasks, with no tasks from other users visible, demonstrating proper ownership enforcement.

### Tests for User Story 2 (OPTIONAL - only if tests requested) ⚠️

- [ ] T023 [P] [US2] Contract test for GET /api/v1/tasks endpoint in backend/tests/contract/test_tasks.py
- [ ] T024 [P] [US2] Integration test for task listing user journey in backend/tests/integration/test_task_listing.py

### Implementation for User Story 2

- [x] T025 [P] [US2] Implement GET /api/v1/tasks endpoint in backend/src/api/v1/tasks.py
- [x] T026 [US2] Enhance TaskService with list functionality in backend/src/services/task_service.py (depends on T017)
- [x] T027 [US2] Add ownership filtering to task retrieval in backend/src/services/task_service.py
- [x] T028 [US2] Create TaskList component in frontend/src/app/tasks/components/TaskList.tsx
- [x] T029 [US2] Create TaskItem component in frontend/src/app/tasks/components/TaskItem.tsx
- [x] T030 [US2] Implement task listing functionality in frontend/src/app/tasks/api/tasks.ts
- [x] T031 [US2] Connect TaskList to API and display user's tasks in frontend/src/app/tasks/components/TaskList.tsx

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently

---
## Phase 5: User Story 3 - Update Task Details (Priority: P2)

**Goal**: Allow authenticated users to modify existing tasks including marking them as complete, changing titles, or updating descriptions

**Independent Test**: Users can modify their own tasks successfully while attempts to modify other users' tasks are properly rejected, demonstrating proper access control.

### Tests for User Story 3 (OPTIONAL - only if tests requested) ⚠️

- [ ] T032 [P] [US3] Contract test for PUT /api/v1/tasks/{taskId} endpoint in backend/tests/contract/test_tasks.py
- [ ] T033 [P] [US3] Contract test for PATCH /api/v1/tasks/{taskId}/complete endpoint in backend/tests/contract/test_tasks.py

### Implementation for User Story 3

- [x] T034 [P] [US3] Implement PUT /api/v1/tasks/{taskId} endpoint in backend/src/api/v1/tasks.py
- [x] T035 [P] [US3] Implement PATCH /api/v1/tasks/{taskId}/complete endpoint in backend/src/api/v1/tasks.py
- [x] T036 [US3] Enhance TaskService with update functionality in backend/src/services/task_service.py (depends on T017)
- [x] T037 [US3] Add ownership verification for task updates in backend/src/services/task_service.py
- [x] T038 [US3] Update TaskForm component to support editing in frontend/src/app/tasks/components/TaskForm.tsx
- [x] T039 [US3] Add task update functionality to API client in frontend/src/app/tasks/api/tasks.ts
- [x] T040 [US3] Implement task completion toggle in frontend/src/app/tasks/components/TaskItem.tsx

**Checkpoint**: At this point, User Stories 1, 2 AND 3 should all work independently

---
## Phase 6: User Story 4 - Delete Tasks (Priority: P3)

**Goal**: Allow authenticated users to remove tasks they no longer need

**Independent Test**: Users can successfully delete their own tasks while deletion attempts on other users' tasks are properly prevented, ensuring data integrity.

### Tests for User Story 4 (OPTIONAL - only if tests requested) ⚠️

- [ ] T041 [P] [US4] Contract test for DELETE /api/v1/tasks/{taskId} endpoint in backend/tests/contract/test_tasks.py
- [ ] T042 [P] [US4] Integration test for task deletion in backend/tests/integration/test_task_deletion.py

### Implementation for User Story 4

- [x] T043 [P] [US4] Implement DELETE /api/v1/tasks/{taskId} endpoint in backend/src/api/v1/tasks.py
- [x] T044 [US4] Enhance TaskService with delete functionality in backend/src/services/task_service.py (depends on T017)
- [x] T045 [US4] Add ownership verification for task deletion in backend/src/services/task_service.py
- [x] T046 [US4] Add task deletion functionality to API client in frontend/src/app/tasks/api/tasks.ts
- [x] T047 [US4] Implement delete button and confirmation in frontend/src/app/tasks/components/TaskItem.tsx

**Checkpoint**: All user stories should now be independently functional

---
[Add more user story phases as needed, following the same pattern]

---
## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [ ] T048 [P] Documentation updates in docs/
- [ ] T049 Error handling improvements across all stories
- [ ] T050 Performance optimization for task queries
- [ ] T051 [P] Additional unit tests in backend/tests/unit/ and frontend/tests/unit/
- [ ] T052 Security hardening and validation improvements
- [ ] T053 Run quickstart.md validation

---
## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - User stories can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - May integrate with US1 but should be independently testable
- **User Story 3 (P3)**: Can start after Foundational (Phase 2) - May integrate with US1/US2 but should be independently testable
- **User Story 4 (P4)**: Can start after Foundational (Phase 2) - May integrate with US1/US2/US3 but should be independently testable

### Within Each User Story

- Tests (if included) MUST be written and FAIL before implementation
- Models before services
- Services before endpoints
- Core implementation before integration
- Story complete before moving to next priority

### Parallel Opportunities

- All Setup tasks marked [P] can run in parallel
- All Foundational tasks marked [P] can run in parallel (within Phase 2)
- Once Foundational phase completes, all user stories can start in parallel (if team capacity allows)
- All tests for a user story marked [P] can run in parallel
- Models within a story marked [P] can run in parallel
- Different user stories can be worked on in parallel by different team members

---
## Parallel Example: User Story 1

```bash
# Launch all tests for User Story 1 together (if tests requested):
Task: "Contract test for POST /api/v1/tasks in backend/tests/contract/test_tasks.py"
Task: "Integration test for task creation journey in backend/tests/integration/test_task_creation.py"

# Launch all models for User Story 1 together:
Task: "Create Task model in backend/src/models/task.py"
```

---
## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all stories)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently
5. Deploy/demo if ready

### Incremental Delivery

1. Complete Setup + Foundational → Foundation ready
2. Add User Story 1 → Test independently → Deploy/Demo (MVP!)
3. Add User Story 2 → Test independently → Deploy/Demo
4. Add User Story 3 → Test independently → Deploy/Demo
5. Add User Story 4 → Test independently → Deploy/Demo
6. Each story adds value without breaking previous stories

### Parallel Team Strategy

With multiple developers:

1. Team completes Setup + Foundational together
2. Once Foundational is done:
   - Developer A: User Story 1
   - Developer B: User Story 2
   - Developer C: User Story 3
   - Developer D: User Story 4
3. Stories complete and integrate independently

---
## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Each user story should be independently completable and testable
- Verify tests fail before implementing
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
- Avoid: vague tasks, same file conflicts, cross-story dependencies that break independence