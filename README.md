# Landfall

Landfall is a Platform as a Service (PaaS), letting developers deploy and
manage applications on AWS without having to manage the infrastructure
themselves.

It is a portfolio project, built to show how I design and build a system of
this kind.

## Status

Early design. There is no code yet. The vision, scope and stages are written
down, and the architecture is being designed.

## What it will do

- Users and organisations, with role-based access control
- Deployments that belong to organisations, built and deployed when code is
  pushed to a git repository hosted by landfall
- Logs and status for each deployment
- Pre-paid credit, charged for the vCPU and memory deployments reserve
- One API, used by a web app, a command-line tool and SDKs
- Self-hosting on your own AWS account

The full scope, the non-goals and the stages are in
[`docs/context/project-overview.md`](docs/context/project-overview.md).

## Documentation

- [Project overview](docs/context/project-overview.md): what landfall is, who
  it is for, scope and stages
- [Architecture](docs/context/architecture.md): stack, boundaries and
  invariants (in progress)
- [Code standards](docs/context/code-standards.md): commits, branches and
  pull requests
- [Architecture decision records](docs/adr/): the decisions made and why

## How I use AI

I design landfall myself and use AI to help with the repetitive parts. I do not
merge anything in a pull request that I cannot explain.

### Written and designed by me

- The architecture and the AWS infrastructure
- The API services and the database schema
- Security-sensitive code, such as authentication, permissions, billing and
  isolation between organisations
- The integration and end-to-end tests, and any test for security-sensitive
  behaviour
- My notes on what I am learning
- Every commit message and pull request description

### AI helps with

- Drafting documentation. I review every draft and change what needs
  changing.
- Repetitive and standard code, such as parts of the frontend.
- Unit tests for simple logic, and test boilerplate. I review these tests,
  edit them if required, and check that they test what they are supposed to
  test and fail when the code is wrong.
- Reviewing changes and summarising them. I decide what to act on.

### Generated, not AI

The SDKs and the API reference are generated from the OpenAPI spec by tools.
The CLI reference will also be generated deterministically.

### How it works

AI tools read written context before they work: [`CLAUDE.md`](CLAUDE.md) and
the files in [`docs/context/`](docs/context/). They describe the design,
the scope and the rules, so the tools follow decisions I have already made.

## Running it

TODO. There is nothing to run yet.

## License

[MIT](LICENSE)
