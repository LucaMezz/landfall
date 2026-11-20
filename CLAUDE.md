## Application Building Context

Read the following files in order before implementing or making any
architectural decision:

1. `docs/context/project-overview.md` — product definition, goals, features,
   scope, stages and open questions
2. `docs/context/architecture.md` — system structure, boundaries, storage
   model and invariants
3. `docs/context/code-standards.md` — implementation rules and conventions
4. `docs/context/ai-workflow-rules.md` — development workflow, scoping rules
   and delivery approach
5. `docs/context/ui-context.md` — theme, colors, typography and component
   conventions (only needed when working on the web app)

Decisions are recorded as ADRs in `docs/adr/`.

Progress is tracked in GitHub issues and milestones, with one milestone for
each stage in `docs/context/project-overview.md`. There is no progress tracker
file.

If implementation changes the architecture, scope or standards documented in
the context files, update the relevant file before continuing. A change that
reverses an accepted ADR needs a new ADR that supersedes it.

Files marked TODO are not written yet. Do not guess their contents. Ask.
