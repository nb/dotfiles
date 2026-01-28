---
name: ebag
description: "Interact with the eBag (ebag.bg) online grocery store via the local `ebag` CLI. Use for grocery shopping tasks (search products, manage cart, checkout, orders, delivery slots) or when the user mentions eBag/ebag explicitly."
---

# eBag CLI

Use the local `ebag` command for all store actions. Add `--json` to any command for machine-readable output.

## Commands

### Authentication
- `ebag login` - Store session cookie and validate it
- `ebag status` - Show current login status

### Products
- `ebag search <query> [--limit N] [--page N]` - Search for products (default: 20 results, page 0)
- `ebag product <productId>` - Get detailed product info by ID

### Cart
- `ebag cart show` - Show cart contents
- `ebag cart add <productId> [--qty N]` - Add product to cart (default qty: 1)
- `ebag cart update <productId> [--qty N]` - Update product quantity in cart

### Orders
- `ebag order list` - List recent orders
- `ebag order show <orderId>` - Show order details

### Delivery
- `ebag slots [--limit N]` - Show next available delivery slots (default: 10)

### Lists
- `ebag list show [listId]` - Show all lists, or items in a specific list
- `ebag list add <listId> <productId> [--qty N]` - Add product to a list

## Workflow

1. Use the most specific subcommand for the request.
2. When information is missing (delivery window, quantity, product variant), ask a targeted follow-up question.
3. Use `--json` when you need to parse output programmatically.

## Understanding user preferences

Before asking follow-up questions, check saved lists and past orders to understand the user's taste and habits:

1. Run `ebag list show` to see all lists - these represent user favorites and preferences.
2. Run `ebag order list` to see recent orders - these show actual purchasing patterns.
3. Use `ebag order show <orderId>` to see specific order details when needed.
4. Use found products to infer preferences (preferred brands, sizes, variants, flavors, typical quantities).
5. Apply this context when searching or recommending products.

## Reliability notes

- Confirm destructive or irreversible actions (clear cart, place order).
- If authentication is required, prompt the user to run `ebag login` and then continue.
