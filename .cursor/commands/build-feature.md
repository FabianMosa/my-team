
# /build-feature

## Description

Starts the development process for a new feature using the orchestrator.

## Usage

/build-feature [feature description]

## Example

/build-feature create task system with basic CRUD

## Automatic Process

1. The orchestrator (@orchestrator) will analyze the request
2. It will break it down into tasks:
   - Data model (@db-dev)
   - API endpoints (@api-dev)
   - Listing/creation UI (@frontend-dev)
3. Each subagent works in its area
4. testing (@qa-engineer) reviews everything
5. Orchestrator integrates and presents the result
