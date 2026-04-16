# Git Internals & Core Concepts
## Git Terminology & Key Concepts


 **Repository** : Git project (tracked folder with .git directory)

 **Commit** : A snapshot of your files and metadata (author, timestamp, message, parent commit, etc.)

 **Branch** : A movable pointer to a specific commit (e.g. , main, dev, feature/origin)

 **Remote** : A reference to an external Git host (like Github, Gitlab) usually named origin

 **Staging Area** : Also called the index; a buffer between your working directory and the repo that you plan to commit
<br><br>

**Blobs** : "binary large object" — stores the actual content of files (just the data, no filname/path)

**Trees** : Stores filenames, file paths, and prints to blob (files) and other trees (directories). Represents a directory snapshot
<br><br>

**Refs (Reference)** : Pointer to a commit: branches (ref/heads), tags (reds/tags), and special ones like HEAD 

**HEAD** : Pointer to the current branch or commit you're working on

**Index** : The actual file .git/index. a binary file that holds the staging area info

**Object Store** : .git/objects/ — where Git stores all blobs,trees, and commits by SHA hash

**Tag** : A ref to a specific commit, often used for marking releases

## The .git Directory

Contains all history and config

```
                            .git/refs/  --> Tags and branches

                            .git/objects/  --> All commits, blobs, trees

                            .git/config  --> Repo-specific settings

                            .git/HEAD  --> Current branch pointer

                            .git/index  --> Staging area                        
```
The entire rep lives here  — **`no .git, no Git.`**

## Git Common Commands

**`git init`**  — initialises a new Git repo with .git directory

**`git add`**  — stage changes

**`git commit`**  — snapshot changes

**`git status`**  — show commit history

**`git log`**   — show commit history

**`git diff`**  — show what change
<br><br>

**`git config`**  — set user/email

**`git help <command>`**  — built-in docs

**`git clone`**  — copy a remote repo

**`git rm`**  — remove files

**`git mv`**  — rename files

**`git restore`** - undo file changes(modern)

# History, Branching & Merging
## Viewing history

**`git log`** : see commit history

**`git log --oneline --graph`** : visual 
summary

**`git show <commit>`** : view a specific commit

**`git diff`** : Compare unstaged to last commit

**`git diff --staged`** : Compare staged to last commit
<br><br>

**`git blame <file>`** : shows who last changed each line

**`git reflog`** : view local HEAD history (even deleted branches)

## Git vs Github — Whats the difference?

||Git (CLI)|Github(Platform)|
|------------|---------|----------------|
|What is it?| Version Control tool|Git repo hosting & collobaoration|
|Runs where?|Locally on your computer|On the web(cloud)|
|Purpose|Tracks & manage code history on the CLI|Share code, manage code, open PRs, colloborate on the GUI|
|Offline use?| Yes|No
|Who owns it?|Open source|Owned by Microsoft|

## Branching 101

**`git branch`** : list/create branches

**`git checkout -b <branch>`** : create & switch (older syntax)

**`git switch -c <branch>`** : modern version

**`git switch <branch>`** : switch branches safely

**`git branch -d <branch>`** : delete branch

Note:

**git switch** is newer and more begginer-friendly. Works only with newer git bersions.

**git branch** only creates or lists, doesn't switch.

**checkout** still works but is multi-purpose and confusing

## Merging in Git


- Combine changes from one branch into another
- `git merch <branch>` — merge target into current branch
- Fast-foward vs recursive (true merge)
- Creates a merge comiit (unless fast-foward)
- May cause conflicts — manual resolution required

Generic example of merging:
```
                                Main:           A---B---C
                                Feature:                 ---D---E
    
                                Merged:         A---B---C---D---E
```


## Rebase vs Merge

|Merge|Rebase|
|------|-----|
|Preserves history|Rewrites history(linear)
|Creates a new commit|No merge commits|
|Good for team workflows|Ideal for cleanuo before PR|
|Usecase: Working collaboratively|Usecase: Cleaning up your local history|

Note: Dont `rebase` shared repo's. Can break things and cause confusion.

# Advanced Git Usage

## Git Stash & Pop

**`git stash`**  — temporarily save uncommited changes

**`git stash list`**  — view all stashes

**`git stash apply`**  — reapply latest stash (keeps stash)

**`git stash pop`**  — reapply and delete the stash

Use when switching branches mid-task

Great for "I'm not ready to commit, but I need to move"

## Reset, Revert and Cheery-Pick

|git revert|git reset|git cherry-pick|
|----------|---------|---------------|
|Creates a new commit that undoes another| Move branch pointer backward|Apply a single commit from another branch|
|Safe for shared library|Soft = keep changes| Useful for hot fixes or targeted changes|
|Used in Production|Mixed = unstage|
||Hard = nuke everthing (careful)||

## Forks & Pull Requests

- **Fork** = your own copy of somewone else's repo (On Github)

- **Clone** the forked repo to your local machine

- Make changes → push to your fork

- Open a Pull Request (PR) to propose your changes

- Used in open source and cross-team workflows

- Original repo owner can review, comment, and merge.

Workflow diagram:

>                          Local Repo → Push → Your Fork → Pull Request → Main Project

## Collaborating Practices


- Use branches to isolate work
- Push to remote and open Pull Requests
- Assign reviewers, use Github's UI for comments
- Resolve conflicts before merge
- Use Issues. Projects. Discussions to track work
- Keep commits focused and clean

## Typical Git Workflow

>                               Developer pulls latest main or clones repo
>                                                   ↓
>                                          Creates feature branch
>                                                   ↓
>                                Works locally -> commits -> pushes branch
>                                                   ↓
>                                       Opens PR/MR -> review & Merge
>                                                   ↓
>                          Team syncs regularly via git pull --rebase or merge


## Trunk-Based Devlopment

- All devs commit to main or short-lived branches
- Heavy CI/testing gates
- Used in fast-moving orgs (e.g. Google, Facebook)

# Git best practices
## Commit Hygiene & Best Practices

- Write good commit messages
- Use squashing before merging PRs
- One logical change per commit
- Avoid noisy merges

## Pre-Commit & Automation

1. Run linters/tests before commiting (pre-commit, Husky, tflint/sec etc.)
2. Prevent broken code from enetering the repo
3. Hook into CI pipelines for formatting, testing and scanning

## Common Mistakes

- Forgetting to pulle befor pushing
- Force pushing to shared branches (unless necessary)
- Commiting secrets
- Merging without review
- NOT using `.gitignore` properly. Not commiting secrets or sensitive files

## Git at Scale

- Monorepo strategies
- Sparse checkout
- Large file support (Git LFS)
- Clean up legacy history (filter-branch, filter-repo)
- Submodules vs subtrees in microservice repos
- Selective CI builds (e.g. Turborepo,NX,Bazel)
- Commit linting — bots to enforce rules
- GitOps-style deployments (e.g. ArgoCD, Flux)
- Server-side Git hooks (e.g. pre-commit.ci, Lefthook)

## Git Security & Secrets Hygiene

- Preventing secret leaks in commits
- Using git-secrets, trufflehog
- Cleaning secrets from history
- Auditing repo contributors + logs



























 