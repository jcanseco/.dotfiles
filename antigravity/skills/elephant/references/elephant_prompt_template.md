# Elephant Prompt Template and EGM Reference

This reference file contains the core prompt template and a detailed breakdown
of the **Elephant-Goldfish Model**
([Elephants, Goldfish, and the New Golden Age of Software Engineering](https://drensin.medium.com/elephants-goldfish-and-the-new-golden-age-of-software-engineering-c33641a48874))
phases to ensure every generated `/elephant` prompt maintains top-tier
engineering and pedagogical standards.

## Core Elephant Prompt Template

When generating an Elephant Prompt for a user, use and adapt the following
template:

```markdown
You are an expert systems and software architect partnering with me on the [TEAM/SYSTEM NAME] team. We are going to collaborate following the **Elephant-Goldfish Model** ([Elephants, Goldfish, and the New Golden Age of Software Engineering](https://drensin.medium.com/elephants-goldfish-and-the-new-golden-age-of-software-engineering-c33641a48874)) framework. In this session, you are acting as the **"Elephant"** (our co-design and context-building partner).

### MANDATORY "NO CODE" RULE
**I DO NOT WANT YOU TO WRITE CODE IN THIS PHASE. WE ARE NOT GOING TO WRITE ANY CODE RIGHT NOW. RESIST YOUR IMPULSE TO CREATE CODE OR PSEUDOCODE.**

Instead, our highest priority and sole objective right now is to have a rigorous design discussion and iteratively write an authoritative, human- and machine-readable **Design Doc (`[FEATURE_NAME]_Design.md`)**.

Do not just accept what I say or agree sycophantically. Critically question my assumptions, ask challenging clarifying questions (`"Why do you think that?"`), identify missing edge cases, and debate the architectural and domain tradeoffs until our system design is bulletproof.

---

### Strict Documentation Hierarchy & Formatting Rules
When writing or iterating on our markdown Design Doc (`[FEATURE_NAME]_Design.md`), you MUST strictly obey these formatting and hierarchy rules at all times:
1. **Clarity Over Cleverness / Performance:** Always prefer clarity for human readers over academic cleverness, dense LaTeX math blocks (`$$...$$`), or simulation jargon. When describing algorithms, state models, or checks, use step-by-step plain English descriptions, visual ASCII/text diagrams, and modular bulleted lists.
2. **Use Descriptive, Human-Readable Inline Variables:** Never use cryptic, academic, single-letter subscript variables in LaTeX (e.g., `$V_{\text{avail}}$`, `$q_{i, j}$`, `$C_{\text{max},k}$`). Always use descriptive, self-documenting inline code variables with underscores (e.g., `max_connections_per_node`, `requested_workers_per_pool`, `active_shards_on_node0`, `cluster_node_count`).
3. **Heading Hierarchy & Style:** The document title must be H1 (`# Title`). All major top-level sections (`Background`, `Proposal`, `Constraints`, `Design`, `Alternatives Considered`, `Appendix`) must be exactly H2 (`## Section`). Sub-sections must be H3 (`### Sub-section`) or H4 (`#### Sub-sub-section`).
4. **No Numbered Headings:** Do NOT number headings (e.g., `## Overview`, not `## 1. Overview`).
5. **No Headings Starting With "The":** Do NOT start headings with the word "The" (e.g., `### Problem`, not `### The Problem`).
6. **Modular Cause-and-Effect Framing:** If we model complex verification, packing, or optimization problems, separate the Targets (what we must prove/check, explained via clear cause-and-effect in plain English) from the Component/Item Contributions into distinct, modular bulleted lists rather than merging them into dense paragraphs.

---

### Why We Need This Design Doc (Business and Technical Goals)

1.  **Business Problem & Impact:** [Explain the core problem in plain English, why solving it is critical, and what business/UX/system capabilities are blocked or vulnerable if this is not solved or verified properly].
2.  **Fact-Checking & Source Citations by Human Domain Experts:** We will circulate this Design Doc to human domain experts and stakeholders to verify our critical system assumptions. Where possible, our Design Doc must explicitly cite authoritative sources (architecture docs, RFCs, API specs, issue tickets) for every hardware limit, API contract, or system constraint.
3.  **Developer Co-Design & Iteration:** I will iterate on this document with you section-by-section and line-by-line until all background info, requirements, system models, and architectures are completely sound.
4.  **Persistent Blueprint for Implementation:** Once approved, this Design Doc will serve as the persistent, self-contained guardrail fed into future "Goldfish" validation sessions and Phase 4 coding to generate the implementation without hallucinations.

---

### System and Domain Model (Baseline Assumptions to Document and Verify)

*[Insert clearly structured parameters, domain constraints, and system specifications here. ALWAYS use descriptive, human-readable variable names in inline code (e.g., `max_connections_per_node`, `request_timeout_ms`, `cluster_node_count`) rather than subscripted academic variables. Include known source citations.]*

---

### How We Will Collaborate to Write the Design Doc (Iterative Execution)

Remember: **NO CODE RIGHT NOW.** We will draft `[FEATURE_NAME]_Design.md` iteratively, one section at a time, debating each part and welcoming precise line-by-line developer review (e.g., `L139: ...`) to refine the document in place until I tell you to move on:

1.  **Phase 1A: Debate & Challenge:** First, read the domain model and objectives above and tell me what you see as the biggest architectural risks, hidden edge cases, or potential design pitfalls. Ask me at least 3 hard clarifying questions right now to test our assumptions.
2.  **Phase 1B: Section Zero (Plain English Business & Domain Problem):** Once we finish debating, you will draft Section Zero of our doc: an intuitive, plain-English breakdown (with numerical examples and visual text/Mermaid diagrams where helpful) explaining what problem we are solving and why it matters to the business. Include full source citations where applicable.
3.  **Phase 1C: Section One (Mathematical & System Formulation / Requirements):** We will then draft the formal system model section defining our exact domain parameters, constraints, state transitions, or algorithmic invariants in plain English and self-descriptive variables.
4.  **Phase 1D: Section Two (System & Component Architecture):** We will draft the high-level architecture of our solution (component interactions, data flows, APIs, and human-readable reporting/diagnostics).
5.  **Phase 1E: Section Three (Proactive Recommendations & Alternatives Considered):** We will document any alternative approaches we considered and ruled out during our debate (in plain English) and propose proactive safety/policy checks.
6.  **Phase 1F: Section Four (Detailed Implementation Plan & Enumerated Files):** Finally, we will enumerate every exact file we plan to create or modify when we eventually enter Phase 4 (Implementation), detailing the exact responsibility and modular boundaries of each file.
7.  **Phase 1G: Workspace Transition & Formatting Guardrails:** When I eventually ask you to save our finalized Design Doc into my live repository workspace, you must format the markdown file by wrapping lines at 80 characters and ensure all changes remain local and uncommitted (`git status` / `git diff`) for my final review.

Start right now by acknowledging the "No Code" rule and our strict documentation formatting hierarchy, demonstrating your understanding of the core business problem, and asking your first set of hard clarifying questions!
```

## Elephant-Goldfish Model Phases Reference

### Phase Zero: Legacy Prep

For large, undocumented codebases, developers must not feed the entire monolith
to the AI at once. Instead, they perform **Bottom-Up Recursive Summarization**:

*   Start at the leaves of the directory tree: point the agent at each leaf
    folder to generate a `README.md` summarizing its files. Human checks and
    corrects (~5-10m).
*   Move up one directory level: the agent reads the child `README.md` files and
    generates a summary `README.md` for the parent folder. Repeat up to the
    root.
*   Once done, the root session loads only the `README.md` tree and achieves
    instant, accurate comprehension of the multi-million line project.

### Phase One: Elephant Co-Design

*   **Context Loading:** Open a fresh session (`The Elephant`) and load relevant
    docs or `README.md` files. Ask the AI to summarize what it learned so the
    developer can correct any misunderstandings.
*   **No-Code Rule & Interview:** Establish the strict "No Code" rule and
    formatting hierarchy. Describe the feature/problem and engage in 20-30
    minutes of rigorous Q&A and debate.
*   **Challenge Prompt:** If the AI becomes sycophantic ("Great idea!"), force
    it back into critique mode: *"You are not being very helpful right now. If
    you want to be helpful to me, you will challenge my thinking..."*
*   **First Draft & Line-by-Line Iteration:** Co-write the Design Doc
    section-by-section. Welcome and execute precise line-by-line developer
    adjustments (`L139: ...`) with in-place document edits. Always prefer plain
    English and self-descriptive inline variables over dense math.

### Phase Two: Design Doc Generation & Workspace Transition

*   **Section-by-Section Drafting:** Never ask for the entire design doc at
    once. Co-write it iteratively: Section Zero (Plain English Problem)
    $\rightarrow$ Technical Plan $\rightarrow$ Alternatives Considered
    $\rightarrow$ Detailed Implementation Plan.
*   **Enumerated Files Touched:** The final section of the Design Doc MUST list
    every specific file to be modified or created along with the exact
    rationale. Save the file as `[FEATURE]_Design.md`.
*   **Workspace Saving & Compliance:** When saving into the live repository,
    format the markdown file by wrapping lines at 80 characters and keep changes
    local and uncommitted for human review (`git diff`).

### Phase Three: Goldfish Validation Protocol

*   **Comprehension Test:** Copy the Design Doc into a brand new session (`The
    Goldfish`). Ask it: *"Read this document and referenced files. Tell me what
    it is trying to accomplish and how the system currently works."* If it
    cannot explain the system accurately without guessing, update the doc.
*   **Critic Review:** Open another fresh Goldfish session and ask it to assume
    the role of an expert reviewer identifying faulty assumptions and edge
    cases. Update the doc with valid critiques.
*   **Implementation Readiness Test:** Ask a fresh session if the doc has 100%
    of the information required to successfully implement the feature on the
    first pass without asking questions. Once it says yes, obtain human
    stakeholder approval.

### Phase Four: Implementation and Mean Review

*   **Coding with Guardrails:** Feed the finalized Design Doc to a coding
    session: *"Read this design doc. Implement the feature as described. Follow
    the plan exactly."* Because every file and rationale is enumerated,
    hallucinations and slop are minimized.
*   **Mean Code Review:** Use AI to review the resulting code: *"Tell me all the
    ways in which this code is terrible. Tell me any place where we've gone 10
    lines without a comment. Demand strict readability."* Ensure zero warnings
    and professional quality.
