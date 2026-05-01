---
name: dotfiles-manager
description: Manage and update dotfiles in this repository, including Gemini configurations, skills, and shell settings. Use when the user wants to update their configuration files (e.g., .vimrc, .zshrc, GEMINI.md, skills) and ensure changes are correctly mapped to the repository.
---

# Dotfiles Manager

## Overview

This skill helps you manage your dotfiles repository. It ensures that any changes you make to your configuration files are correctly reflected in the repository, following the mapping defined in `scripts/create_links.sh`.

## Core Tasks

### 1. Update Existing Dotfiles
When you need to update a configuration file:
1. Consult [references/mapping.md](references/mapping.md) to find the repository path for the file.
2. Apply the requested changes directly to the file in the repository.
3. If the file is a Gemini skill, ensure you follow the [skill-creator](skill-creator) standards (YAML frontmatter, directory structure).

### 2. Add New Dotfiles
When adding a new configuration file to the system:
1. Determine where it should live in the repository (e.g., `shell/`, `vim/`, `git/`).
2. Create the file in the repository.
3. Update `scripts/create_links.sh` to include the new symlink mapping.
4. Update [references/mapping.md](references/mapping.md) to reflect the new mapping.
5. Remind the user to run `scripts/create_links.sh` to create the symlink in their home directory.

### 3. Manage Gemini Skills
When creating or updating skills in `gemini/skills/`:
1. Use the [skill-creator](skill-creator) skill for guidance.
2. Ensure each skill is in its own directory with a `SKILL.md` file.
3. If you create a new skill, update `references/mapping.md` if it needs a specific symlink (though usually the entire `gemini/skills` directory is symlinked).

## Workflow: Syncing Changes

If you have modified a file in your home directory and want to "save" it to the repository:
1. Read the file from the home directory (e.g., `~/.zshrc`).
2. Locate the target file in the repository (e.g., `shell/zsh/zshrc`).
3. Overwrite or patch the repository file with the content from the home directory.

## Important Note
After making changes to the repository files, you may need to run `scripts/create_links.sh` to ensure the symlinks in the home directory are pointing to the correct (and potentially new) files. Always inform the user when this is necessary.
