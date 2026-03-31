Execution workflow:

- Always start by analyzing the request
- Break work into tasks
- Assign tasks to the correct agent
- Validate outputs before continuing

Priority order:

Planner → Orchestrator → Agents → Securiry Sentinel → Reviewer

## Operational Rules

- **No agent** should perform tasks outside its strictly defined responsibility.
- **Security Checkpoint:** Any code involving API routes, Database queries, or User inputs MUST be validated by the Security Sentinel before reaching the Reviewer.
- **Final Approval:** The Reviewer must confirm that the Sentinel's recommendations have been implemented.
