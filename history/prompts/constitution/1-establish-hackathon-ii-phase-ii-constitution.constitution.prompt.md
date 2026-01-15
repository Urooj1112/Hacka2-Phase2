---
id: 1
title: "Establish-Hackathon-II-Phase-II-Constitution"
stage: "constitution"
date_iso: "2026-01-14"
surface: "agent"
model: "Claude Sonnet 4.5"
feature: "none"
branch: "master"
user: "user"
command: "sp.constitution"
labels: ["constitution", "hackathon", "spec-driven-development", "todo-application"]
links:
  spec: null
  ticket: null
  adr: null
  pr: null
files_yaml: |
  - .specify/memory/constitution.md
tests_yaml: |
  - none
---

# Prompt History Record: Establish Hackathon II Phase II Constitution

## Original Prompt

```
You are an AI engineering agent participating in Hackathon II:
"The Evolution of Todo – Mastering Spec-Driven Development & Cloud Native AI".

Your role is to strictly follow Spec-Driven Development using Spec-Kit Plus.
You must NEVER write code without an approved specification and plan.

Project Phase:
Phase II – Full-Stack Web Todo Application

High-Level Goals:
- Transform the Phase I in-memory console todo app into a full-stack, multi-user web application
- Use a monorepo structure compatible with GitHub Spec-Kit
- Ensure all features are driven by written Markdown specifications

Core Principles:
- Specs are the single source of truth
- No manual coding by the human
- Implementation must strictly follow approved specs and plans
- Incremental, step-by-step evolution
- Security, clarity, and maintainability over shortcuts

Technology Constraints:
- Frontend: Next.js 16+ (App Router, TypeScript, Tailwind)
- Backend: FastAPI (Python)
- ORM: SQLModel
- Database: Neon Serverless PostgreSQL
- Authentication: Better Auth (JWT-based)
- Spec Management: Spec-Kit Plus
- Monorepo structure with layered CLAUDE.md files

Mandatory Rules:
- Every feature must have a written spec before implementation
- JWT authentication is required for all API endpoints
- Users can only access their own tasks
- REST API must remain stateless
- Follow the provided Hackathon II Phase II documentation exactly

You are now governed by this constitution.
```

## Response Summary

Updated the project constitution at `.specify/memory/constitution.md` to reflect the Hackathon II Phase II requirements. The new constitution establishes 6 core principles:

1. Spec-Driven Development (NON-NEGOTIABLE)
2. Technology Stack Compliance
3. Security-First Architecture (NON-NEGOTIABLE)
4. Incremental Evolution
5. Monorepo Structure
6. Full-Stack Integration

The constitution also includes mandatory rules, development workflow guidelines, and governance policies that align with the hackathon requirements. All placeholder tokens from the template were replaced with concrete values derived from the user input.

## Outcome

The constitution now properly governs the Hackathon II Phase II Todo Application project, establishing spec-driven development as the primary methodology and incorporating all technology constraints and mandatory rules specified by the user.

## Evaluation

The constitution update was successful with all required principles and rules incorporated. The file was validated to ensure no placeholder tokens remained and that all required sections were properly populated.