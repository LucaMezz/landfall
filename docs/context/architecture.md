# Architecture Context

> **Status: partly written.** Only what is already decided is filled in.
> Everything marked TODO is waiting on a decision, and most of it comes out
> of the AWS architecture design. Do not guess the TODO parts.

## Stack

| Layer           | Technology                                             | Role                                        |
| --------------- | ------------------------------------------------------ | ------------------------------------------- |
| Cloud           | AWS                                                    | Everything runs here                        |
| Compute         | TODO                                                   | Runs deployed applications. Details TODO    |
| API             | TODO                                                   | The control plane's contract                |
| Database        | TODO                                                   | TODO                                        |
| Auth            | TODO                                                   | TODO                                        |
| Git hosting     | TODO                                                   | Hosted repositories that deployments push to |
| Builds          | TODO                                                   | Turn pushed code into something runnable    |
| Payments        | TODO (a payment provider, in test mode for demos)      | Pre-paid credit                             |
| Infrastructure  | TODO                                                   | How landfall's own AWS resources are defined |

## System Boundaries

The components below come from `project-overview.md`. The folder for each is
TODO until the repository layout is decided.

- **Control plane (API).** The single API that everything else uses. Folder:
  TODO.
- **Web app.** Folder: TODO.
- **CLI.** Folder: TODO.
- **SDKs.** Folder: TODO.
- **Git hosting.** Folder: TODO.
- **Build and deploy.** Folder: TODO.
- **Billing.** Folder: TODO.

## Storage Model

TODO. Decide where each of these lives:

- Users, organisations, memberships, permissions, API keys
- Deployments and their state
- Git repositories
- Build outputs, such as container images
- Logs
- Credit balances and usage
- Audit log entries

## Auth and Access Model

Decided:

- Users sign up and log in. Users belong to organisations.
- Deployments belong to organisations.
- Access inside an organisation uses role-based access control (RBAC).
- API keys let programs call the API.
- The CLI logs in with device authorisation, approved in the web app.

TODO: how login works, the permissions model (preset roles, custom roles or
individual permissions), whether permissions apply to a whole organisation or
to single deployments, and how API keys are scoped.

## Invariants

TODO. An invariant is a rule the code must never break. Write them once they
are decided. These are candidates taken from `project-overview.md`, to confirm
or drop:

1. Nothing is hard-coded to one AWS account, region or domain.
2. A deployment cannot read or affect another deployment, especially one
   that belongs to a different organisation. Not decided yet. See the open
   question about isolation.
3. When an organisation's credit runs out, its deployments are stopped.
