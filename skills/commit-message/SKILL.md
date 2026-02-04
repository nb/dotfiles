---
name: commit-message
description: "Write well-crafted commit messages following best practices. Use when creating commits, writing commit messages, or when the user asks for help with commits."
---

# Commit Message Skill

Write commit messages that communicate changes effectively to people reading the commit timeline and people debugging code.

## Commit message structure

### Subject line (required)

- One sentence describing what the change is and why (if not obvious)
- Start with an imperative verb (Add, Remove, Fix, Update, Refactor)
- Do NOT end with a period
- If "and" appears or multiple items are listed, the commit is probably too large - suggest splitting

Good: `Add validation for email field in signup form`
Good: `VIP Report: clear caches on each post to save memory`
Bad: `Fixed bug` (past tense, vague)
Bad: `Adds a new file.` (indicative tense, has period)

### Body (optional)

Skip for obvious changes (typo fixes, simple renames). When included, ALWAYS separate from subject with a blank line:

1. **Why** the change was made - go deeper than "because it was broken"
2. **What caused the problem** (for fixes) and its consequences
3. **How** the solution works (only if the algorithm isn't obvious)

## Key principles

- Avoid "fix" when a more specific verb exists (correct, remove, restore, update)
- Don't substitute a link for an explanation - links are footnotes, not the main content
- Reference relevant tickets/issues and give brief summaries
- Give props to contributors when appropriate
- The message should be self-contained - don't require reading the code to understand it
- It's OK for the commit message to be longer than the code change

## Example of a good commit message

```
Set the right dropdown values when entering baba.mlblogs.com in signup

The code which sets dropdown values wasn't handling domains that are
suffixes of other domains. Entering baba.mlblogs.com set blogname to
baba.mlblogs and domain to .com, because .com appeared before
.mlblogs.com in the domain list.

Sort domains by length so longer domains match first.
```

## After writing

Stage the relevant files and create the commit. Never commit unrelated changes together - whitespace changes, style fixes, and other bugs should be separate commits.

## Important

- Do NOT add a "Co-Authored-By" line to commit messages. The commit should only attribute the human author.
- If you're missing context about **why** a change was made, ask clarifying questions before writing the commit message. Don't guess or leave out important context.
