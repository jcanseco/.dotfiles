---
name: elephant
description: >-
  Creates and formats an authoritative prompt for a new Antigravity session
  acting as the 'Elephant' under the Elephant-Goldfish Model framework, and
  guides the user on how to use the Elephant-Goldfish process. Use ONLY when
  the user explicitly triggers /elephant. Do NOT use unless explicitly invoked
  with /elephant.
---

# Elephant Prompt Creator (Elephant-Goldfish Model)

This skill activates **if and only if** the user triggers `/elephant` (e.g.,
`/elephant <prompt>` or `/elephant`) under the **Elephant-Goldfish Model**
described in
[Elephants, Goldfish, and the New Golden Age of Software Engineering](https://drensin.medium.com/elephants-goldfish-and-the-new-golden-age-of-software-engineering-c33641a48874).
Your role when executing this skill is twofold:

1.  Remind and guide the user on the **Elephant-Goldfish Model (EGM)** workflow
    and how to use the resulting prompt in a new session.
2.  Gather project context and generate a tailored, world-class **Elephant
    Prompt** enforcing the **"No Code" Rule**, strict document formatting
    hierarchy, and structured around iterative Design Doc co-creation.

## When to Use This Skill

Use this skill **if and only if** the user explicitly invokes `/elephant`.

Example invocations:

*   `/elephant <prompt>`
*   `/elephant`

Do **NOT** use or trigger this skill for normal conversations, general coding
tasks, architecture reviews, natural-language requests, or whenever `/elephant`
was not explicitly invoked.

## Elephant-Goldfish Model Overview

The **Elephant-Goldfish Model**
([Elephants, Goldfish, and the New Golden Age of Software Engineering](https://drensin.medium.com/elephants-goldfish-and-the-new-golden-age-of-software-engineering-c33641a48874))
separates software engineering into distinct, highly disciplined phases to
eliminate AI hallucinations, unstated assumptions, and fragile code:

*   **Phase 1: Elephant (Co-Design & Debate - NO CODE!):** A new AI session (the
    "Elephant") is loaded with project context. The developer and the Elephant
    engage in a rigorous design interview where the Elephant actively challenges
    assumptions (`"Why do you think that?"`) rather than blindly agreeing.
*   **Phase 2: Design Doc (Iterative Source of Truth):** The Elephant and
    developer iteratively co-create a comprehensive Markdown Design Doc
    section-by-section. This doc explains the business problem in plain English,
    defines clear system models without dense math/subscripts, explores
    alternatives, and enumerates every file touched.
*   **Phase 3: Goldfish (Validation Protocol):** Fresh AI sessions ("Goldfish")
    test the finalized Design Doc for self-containment, comprehension, and edge
    cases before coding begins.
*   **Phase 4: Implementation (Coding with Guardrails):** The finalized Design
    Doc is fed to an implementation agent to write code with minimal slop and
    strict adherence to the enumerated plan.

When `/elephant` is invoked, clearly and concisely remind the user of this core
philosophy so they know what to expect when they launch their new session.

## Workflow When Triggered

When the user triggers `/elephant`, follow these three steps in order:

### Reminding User of Process

Provide a concise, motivating summary of the **Elephant-Goldfish Model** and how
the Elephant session operates:

*   Emphasize that the new session will enforce the **No Code Rule** (`I DO NOT
    WANT YOU TO WRITE CODE IN THIS PHASE... RESIST YOUR IMPULSE TO CREATE
    CODE...`).
*   Explain that the Elephant's job is to act as a critical design partner,
    debating edge cases and asking clarifying questions before drafting the
    Design Doc.
*   Explain how to use the resulting prompt (copy and paste into a brand new
    Antigravity session).

### Gathering Project Parameters

Check if the user has already provided their feature description, problem
statement, or system parameters in the current conversation:

*   If **sufficient context is already present**, proceed immediately to
    generating the prompt without asking unnecessary questions.
*   If **context is missing or minimal**, ask the user for:
    1.  The core feature or problem they want to solve (and what makes it a
        business concern).
    2.  Key domain variables, constraints, or hardware/system limits.
    3.  Known documentation, specifications, RFCs, or source links that the
        Elephant should verify or cite.

### Generating Customized Elephant Prompt

Once context is gathered, read the template in
`references/elephant_prompt_template.md` and generate the complete, tailored
Elephant Prompt inside a clean markdown code block.

## Prompt Quality Rules

When generating the customized Elephant Prompt, you **MUST ALWAYS** obey these
quality standards:

*   **Enforce the Mandatory No-Code Rule:** Include an unmissable, bolded
    directive commanding the AI not to write any code or pseudocode during Phase
    1 and Phase 2.
*   **Clarity Over Cleverness / Performance (Plain English & Zero Jargon):**
    Always prioritize clarity for human readers over academic cleverness, dense
    LaTeX formulas (`$$...$$`), or simulation/algorithmic jargon. When
    describing algorithms, state transitions, or calculations, prefer clear,
    step-by-step plain English loop descriptions and modular bulleted lists over
    complicated equations.
*   **Use Descriptive, Human-Readable Inline Variables:** Never use cryptic,
    academic, single-letter subscript variables in LaTeX (e.g.,
    `$V_{\text{avail}}$`, `$q_{i, j}$`, `$C_{\text{max},k}$`) which render
    poorly and break scannability. Always use descriptive, self-documenting
    inline code variables with underscores (e.g., `max_connections_per_node`,
    `requested_workers_per_pool`, `active_shards_on_node0`,
    `cluster_node_count`).
*   **Strict Markdown Hierarchy & Formatting Standards:** Explicitly instruct
    the Elephant to enforce clean heading hierarchy in the Design Doc (`# Title`
    is H1; all major sections like `Background`, `Proposal`, `Constraints`,
    `Design`, `Alternatives Considered`, `Appendix` must be `## ` H2;
    sub-sections must be `### ` H3 or `#### ` H4). Enforce that headings must
    NOT be numbered (e.g., `## Overview`, not `## 1. Overview`) and must NOT
    start with "The" (e.g., `### Problem`, not `### The Problem`).
*   **Modular Cause-and-Effect Framing for Complex Models:** When modeling
    complex verification or optimization problems (such as Knapsack packing,
    capacity checks, or state space evaluations), instruct the Elephant to
    separate Targets (What we must prove or satisfy, framed with clear
    cause-and-effect in plain English) from Item/Component Contributions into
    clean, separate bulleted lists rather than combining them into dense
    paragraphs.
*   **Cite Authoritative Sources:** Where hardware limits, control-plane
    policies, or domain constraints exist, explicitly instruct the Elephant to
    verify and cite their authoritative sources (architecture docs, RFCs, API
    specs, issue trackers, etc.) in the Design Doc.
*   **Iterative Section-by-Section Drafting & Line-by-Line Refinement
    Protocol:** Structure the prompt to instruct the Elephant to co-author the
    Design Doc iteratively (Debate $\rightarrow$ Problem Statement $\rightarrow$
    Mathematical/System Model $\rightarrow$ Architecture $\rightarrow$
    Recommendations $\rightarrow$ Enumerated Files Touched), pausing after each
    section for developer feedback. Instruct the Elephant to actively welcome
    line-by-line developer feedback (e.g., `L139: ...`) and perform precise
    in-place document refinements during Phase 1/Phase 2 before advancing.
*   **Workspace Saving & Formatting Guardrails:** Instruct the Elephant that
    when the developer eventually requests saving the authoritative Design Doc
    into their live repository workspace (e.g.,
    `docs/design/FEATURE_DESIGN.md`), the Elephant must format the markdown file
    by wrapping lines at 80 characters and keep all changes local and
    uncommitted (`git status` / `git diff`) for developer review.
