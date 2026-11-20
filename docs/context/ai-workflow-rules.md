# AI Workflow Rules

## Approach

Build landfall incrementally, one stage at a time, in the order set out under
"Success Criteria" in `project-overview.md`. The context files define what to
build, how to build it and where things stand. Implement against them. Do not
infer or invent behaviour.

## Version control

Do not commit, push or open pull requests. The author writes every commit
message and pull request description by hand. Leave changes in the working
tree, on a branch if one is needed, and say what changed.

## Work reserved for the author

The "How I use AI" section of `README.md` lists what the author writes and
designs, and what AI may help with. Follow it. If you are asked to write
something that is reserved for the author, say so and offer to explain,
review or suggest an approach instead.

## Scoping Rules

- Work on one feature unit at a time.
- Prefer small, verifiable increments over large speculative changes.
- Do not combine unrelated system boundaries in a single implementation step.

## When to Split Work

Split an implementation step if it combines:

- Control plane changes and AWS infrastructure changes
- Several unrelated API operations
- Behaviour that is not clearly defined in the context files

If a change cannot be verified end to end quickly, the scope is too broad.
Split it.

## Handling Missing Requirements

- Do not invent product behaviour that is not defined in the context files.
- If a requirement is ambiguous, resolve it in the relevant context file
  before implementing.
- If a requirement is missing, add it to "Open Questions" in
  `project-overview.md` before continuing.

## Progress

Progress is tracked in GitHub issues and milestones. Each stage in
`project-overview.md` is a milestone, and each unit of work is an issue.
There is no progress tracker file.

## Protected Files

TODO. List files that must not be modified unless explicitly asked, such as
generated code.

## Keeping Docs in Sync

Update the relevant context file whenever implementation changes:

- System architecture or boundaries
- Storage model decisions
- Code conventions or standards
- Feature scope

A change that reverses an accepted ADR needs a new ADR that supersedes it.

## Before Moving to the Next Unit

1. The current unit works end to end within its defined scope.
2. No invariant defined in `architecture.md` was violated.
3. The related GitHub issue reflects the completed work.
4. The checks pass. TODO: name the build and test commands once they exist.
