# Code Standards

> **Status: partly written.** The rules for commits, branches, pull requests
> and ADRs are decided. The rules for code are TODO, because there is no code
> yet. Do not guess the TODO parts.

## Commits

- Use Conventional Commits: `type(scope): subject`.
- The subject is lower case, imperative and has no full stop.
- Types: `feat`, `fix`, `refactor`, `test`, `docs`, `build`, `ci`, `chore`,
  `perf`, `style`, `revert`.
- A commit body is optional. For small changes the subject is enough.

## Branches and pull requests

- Trunk-based development: `main` is the only long-lived branch.
- Branches are short-lived and named `type/short-topic`, such as
  `docs/adr-0001-record-decisions`.
- Every change reaches `main` through a pull request.
- Pull requests are squash-merged. The PR title is therefore the commit on
  `main`, so it follows the commit rules above. GitHub adds the PR number.
- One pull request is one self-contained change.
- Fill in the pull request template.

## Decisions

- Decisions that are costly to reverse are recorded as ADRs in `docs/adr/`,
  in Michael Nygard's format.
- Files are named `NNNN-title-with-dashes.md`, numbered in order and never
  reused.
- An accepted ADR is not edited, except that its status can change. To change
  a decision, write a new ADR and mark the old one as superseded.

## General

TODO.

## Language and framework

TODO. Fill in once the language and framework are chosen.

## API

TODO. Fill in once the API contract is designed, including naming,
pagination, versioning, errors and long-running operations.

## Data and storage

TODO.

## File organisation

TODO.
