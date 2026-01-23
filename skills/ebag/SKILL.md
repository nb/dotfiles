---
name: ebag
description: "Interact with the eBag (ebag.bg) online grocery store via the local `ebag` CLI. Use for grocery shopping tasks (search products, manage cart, checkout, orders, delivery slots) or when the user mentions eBag/ebag explicitly."
---

# eBag CLI

Use the local `ebag` command for all store actions.

## Workflow

1. Run `ebag --help` to discover available commands and flags.
2. Use the most specific subcommand for the request (search, cart, orders, delivery slots, checkout).
3. When information is missing (store location, delivery window, quantity), ask a targeted follow-up question.

## Understanding user preferences

Before asking follow-up questions, check saved lists to understand the user's taste and habits:

1. Run `ebag list show` to see all lists.
2. Check relevant lists for context - all lists represent user favorites and preferences.
3. Use found products to infer preferences (preferred brands, sizes, variants, flavors).
4. Apply this context when searching or recommending products.

## Reliability notes

- Confirm destructive or irreversible actions (checkout, cancel order, clear cart).
- If authentication is required, prompt the user to log in via the CLI and then continue.
