# 2. Account linking

Date: 2026-11-21

## Status

Accepted

## Context

Landfall will allow for authentication through multiple different methods:

- Password: The user signs up with an email and a password.
- Social login: The user signs in through one of several supported providers.

If a user signs up with an email `example@google.com` and then also signs
in through a google account which also has `example@google.com`, are
these the same account, or different accounts?

## Decision

Different accounts.

Suppose person A has a landfall account with email and
password. Then, person B creates a new social account on one of the available
providers with the same email as person A used for their account. If user
B logs into landfall with that social account, then landfall would auto-link
on the matching email, trusting the provider's claim that the email is
verified.

It is just safer and simpler to keep them as separate accounts.

## Consequences

It is the easiest solution. Linking the accounts when ownership of both
accounts is proven could be added later on if it becomes an issue.
