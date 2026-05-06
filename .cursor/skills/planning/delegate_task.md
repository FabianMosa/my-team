Skill: delegate_task

Purpose:
Delegate a task to the most appropriate agent.

Instructions:

1. Analyze the user request.
2. Break it into tasks.
3. Assign tasks to agents.

Agents available:

- planner
- ui-engineer
- backend
- db-dev
- reviewer

Output:
Task distribution plan.

Example:

User request:
Create login system.

Tasks:
planner -> define implementation
ui-engineer -> login page UI y estilos
backend -> auth endpoint
db-dev -> user table
reviewer -> code review
