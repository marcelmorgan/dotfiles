# Global Claude rules

## Workflow

- Always create a feature branch before starting non-trivial work.
- Work from GitHub issues. Read the issue before writing any code.
- Run tests before pushing commits. If tests can't run locally, find the equivalent
command in the project's environment (Docker, CI, etc.) — never skip them.
- After making changes to a web app, rebuild/restart and confirm the build succeeded
before reporting the task complete.
- Open a PR for every feature or fix. Squash merge to main.

## Environment awareness

- When a CLI tool or API call fails, diagnose the root cause and find the correct
alternative. Do not retry the same failing command.
- Check for Docker, virtual environments, or other wrappers before assuming tools
are available directly on the host PATH.

## Git rules

- Never push directly to main. Never force-push.
- Squash merge feature branches to keep main history clean.
- Commit message format: `type: short description` (feat / fix / refactor / test / docs).
- Do not commit unless explicitly asked.

## Communication

- Rebuild and verify before saying a task is done.
- If a browser-served asset has a stable filename (e.g. main.js), remind the user
to hard-refresh after a rebuild.
