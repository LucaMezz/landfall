# Landfall

## Overview

Landfall is a Platform as a Service (PaaS) that lets developers deploy and
manage applications on AWS without having to manage the infrastructure
themselves.

Deploying applications on AWS can be complex and time-consuming. Developers
need to set up and manage a lot of infrastructure, which means a steep
learning curve for people who just want to focus on building their
applications.

## Who it is for

**Developers** who want to deploy an application without dealing with the
infrastructure underneath it. They hand landfall their code and get a running
application, without needing to learn how AWS works or spend the time setting
up the infrastructure.

Developers work in **organisations**. An organisation groups its members and
the applications they run. What each member is allowed to do is set by the
permissions they hold, so one developer may be able to deploy, and another
may also be able to manage members.

The **platform operator** runs landfall on their own AWS account, so that
developers can deploy applications without managing infrastructure. The
operator manages landfall and its AWS resources, not each application's
infrastructure. Landfall can be self-hosted, so the operator may be someone
other than its author. In demos, it is the project author.

## Goals

1. Let developers deploy applications to AWS without managing the
   infrastructure themselves.
2. Let organisations control what each of their members is allowed to do.
3. Charge organisations for what their deployments use, with pre-paid
   credit.
4. Let anyone install and run their own landfall on their own AWS account.
5. Have something to demonstrate at the end of every stage.

## Core User Flow

1. A developer signs up and logs in, using the web app or the CLI.
2. They create an organisation, or join one.
3. They create a deployment, which gets a git repository hosted by landfall.
4. They push code to the repository.
5. Landfall builds the code and deploys it.
6. They open the application at its URL and look at its logs and status.
7. They add pre-paid credit to the organisation. Deployments are charged for
   the vCPU and memory they reserve. When the credit runs out, the
   deployments are stopped.

## Features

### Accounts and access

- **Users and organisations.** People can sign up, create and join
  organisations, and manage their accounts and memberships.
- **Access control.** Organisations control what each member is allowed to
  do, using role-based access control (RBAC).
- **Audit logs.** Landfall records who did what in an organisation.

### Deployments

- **Deployments.** Deployments belong to organisations. A member with the
  right permissions creates a deployment, which gets a git repository hosted
  by landfall. Pushing code to it triggers a new build and deployment. Members
  can also inspect, update and remove deployments.
- **Logs and status.** Members can see a deployment's logs and its status.

### Billing

- **Billing.** Organisations buy pre-paid credit through a payment provider.
  Deployments are charged for the vCPU and memory they reserve over time. When
  an organisation's credit runs out, its deployments are stopped.

### Ways to use landfall

- **One API, several ways to use it.** A single API (the control plane) is
  used by a web app, a command-line tool and SDKs.
- **Self-hosting.** Anyone can install and run their own landfall on their
  own AWS account.

## Scope

### In Scope

Everything under "Features", built in the stages under "Success Criteria".

### Out of Scope

**Platform and scale**

- **Other clouds.** Landfall targets AWS only.
- **Production-grade reliability.** No uptime guarantee, multi-region
  deployment or high-availability promises.
- **Serving many real customers.** Landfall is not built to run other
  people's production workloads.

**What can be deployed**

- **Every language and framework.** Landfall supports a small set of ways to
  build an application, not arbitrary ones.
- **Stateful workloads.** No persistent volumes, and no managed databases or
  caches attached to applications.
- **Non-web workloads.** No scheduled jobs, background workers or serverless
  functions.
- **Preview environments.** No environment per pull request.

**Features around the application**

- **Custom domains and TLS.** Applications get a landfall-provided URL.
- **Advanced observability.** Logs and basic status are goals. Metrics
  dashboards and tracing are not.
- **Enterprise features.** No SSO or SAML, and no compliance
  certifications.
- **Tax and invoicing.** Payments go through a payment provider, which runs
  in test mode for demos, so no real charges are made.

## Success Criteria

Success is described per stage, because the full scope is large. Each stage
ends with something I can demonstrate. The order after the first stage is a
rough plan and can change. Each stage is a milestone in GitHub.

1. **First stage: the control plane and web app.** The API supports users,
   organisations and API keys. In the web app I sign up, log in, create an
   organisation and create an API key, then call the API with that key.
2. **Second stage: the CLI.** I log in from the CLI with device
   authorisation, approving it in the web app, and create an organisation.
3. **Third stage: deploying code.** I create a deployment, push code to its
   repository, it is built and deployed, and I see the application running at
   a URL, along with its logs and status.
4. **Fourth stage: access control.** RBAC for organisations. A member with
   limited permissions is not allowed to delete a deployment. Audit logs
   record who did what in an organisation.
5. **Fifth stage: billing.** I buy pre-paid credit through the payment
   provider in test mode, deployments are charged for the vCPU and memory
   they reserve, and when the credit runs out, they are stopped.
6. **Later.** The SDKs, and self-hosting: installing and running landfall on
   another AWS account.

## Why I am building it

Landfall is a portfolio project. It does not need to compete with existing
platforms. It is meant to show how I design and build a system of this kind,
and I expect to demonstrate it in demos and interviews. I also hope to learn
more about AWS and software engineering as a whole.

## Constraints

- Landfall runs on AWS. Applications are expected to run on Amazon ECS with
  Fargate, behind a load balancer, with auto scaling. The details are not
  decided yet.
- The infrastructure only runs while testing and during demos or interviews,
  to keep the AWS cost down.
- Because landfall can be self-hosted, nothing is hard-coded to my AWS
  account, region or domain.
- The project has one developer.

## Open Questions

- **Naming.** What is a "deployment"? A deployment is created before any code
  is pushed, so it behaves like an application, and each push produces
  something new. What should each be called? One option is organisation, then
  application, then deployment.
- **Build and run details.** Which languages and build methods are supported,
  and how applications are built and run on ECS with Fargate. Whether apps
  share one load balancer.
- **Permissions model.** Whether organisations get preset roles, custom
  roles, or permissions assigned one by one, and whether permissions apply
  to the whole organisation or to individual applications.
- **Audit logs.** Which actions are recorded, who can view the record, and
  how long it is kept.
- **Payment provider.** Which provider to use, and how its test mode works
  for demos.
- **Self-hosting.** What installing, configuring and upgrading landfall looks
  like, and when it gets built.
- **After zero balance.** Stopping deployments is the goal for now. Warnings,
  a grace period, and deleting data after a retention period are left for
  later.
- **Budget.** A monthly ceiling for AWS cost while testing and demoing.
- **Isolation between containers.** How one deployment's container is kept
  from reading or affecting another's, especially when they belong to
  different organisations.
- **Limits and abuse.** How much of landfall's resources one organisation can
  use, and how landfall deals with deployments that run harmful or abusive
  code.
- **Secrets and configuration.** How a developer gives a deployment
  environment variables and credentials, and how they are stored and kept
  out of logs.
