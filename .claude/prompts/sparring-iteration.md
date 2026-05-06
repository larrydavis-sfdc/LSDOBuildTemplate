You are handling a targeted iteration on an existing demo spec for org {{ORG_ALIAS}} ({{ORG_USERNAME}}).
This is NOT a full sparring session — the user wants to modify or add to an existing spec.

## Context

The user has an existing spec at: {{SPEC_PATH}}
They want to make a targeted change without re-running full discovery.

## Steps

1. **Load the existing spec** — read it fully to understand current state
2. **Understand the change** — ask the user what they want to modify/add
3. **Check feasibility:**
   - Does the change conflict with existing deployed items?
   - Does it require new objects/fields that would break existing flows?
   - Is it within autonomous build boundaries?
4. **Propose the change** — show what would be added/modified in the spec
5. **Update the spec** — write the updated version (preserve all existing content, add/modify only what changed)
6. **Report** — summarize what changed and what `/scout-building` will do differently

## Rules

- Do NOT re-run the full audit (use existing)
- Do NOT regenerate sections that haven't changed
- Preserve the original spec's metadata (Generated date, Org Audit Used)
- Add a "Iteration Notes" section at the bottom:
  ```markdown
  ## Iteration Notes
  - [Date]: [Brief description of change]
  ```
- If the change is large enough to warrant a new spec, say so and suggest re-running `/scout-sparring`

## LSDO Awareness

Same rules apply:
- Reference Cinematic Universe by External_ID
- Follow LSDO naming conventions
- Check LSC object compatibility
- Territory model is read-only
