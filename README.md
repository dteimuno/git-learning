# What I Learned in Git (Weekend Recap)

> A concise, corrected cheat-sheet of the commands you practiced—organized by task, with best-practice tips.

---

## 1) Identify yourself (one-time per machine or per repo)

```bash
# Set identity for just this repository
git config user.email "munodennis@___mail.com"
git config user.name  "Dennis Tei-Muno"

# Or set globally for all repos on your machine (common)
git config --global user.email "munodennis@___mail.com"
git config --global user.name  "Dennis Tei-Muno"
```

---

## 2) Check what changed

```bash
git status        # what’s modified, staged, untracked
```

**Tip:** Run this constantly. It tells you exactly what Git will include in your next commit.

---

## 3) Stage changes (add to the “index”)

```bash
git add .         # stage everything in the working directory
git add story1.txt
```

**Unstage a file (leave it modified but not staged):**

```bash
git restore --staged story1.txt    # modern
# (Older equivalent) git reset HEAD story1.txt
```

---

## 4) Commit work (save a snapshot)

```bash
git commit -m "Updated first story"
```

* **Best practice:** Each commit should solve **one** problem and have a clear, imperative message (e.g., “Fix login null pointer”).
* **Correction:** `git commit` **does not** restore files; it **records** staged changes.

---

## 5) Ignore files you don’t want tracked

* Add patterns to **`.gitignore`** so Git won’t *stage new* files that match those patterns.
* If a file is **already tracked**, add it to `.gitignore` **and** stop tracking it:

```bash
git rm --cached notes.txt     # stop tracking but keep file on disk
```

---

## 6) Remove files from the repo

```bash
git rm --cached notes.txt     # remove from Git, keep file locally
git rm -f notes.txt           # remove from Git AND delete locally
```

**Correction:** The command is `git rm`, not `git remove`.

---

## 7) Browse history

```bash
git log                 # full history
git log --name-only     # show files changed per commit
git log --oneline --graph --decorate --all   # compact, visual
git show <HASH>         # see details of one commit
```

---

## 8) Branch workflow

```bash
# Create and switch to a new branch from current branch (often main)
git checkout -b dev

# Or create, then switch
git branch dev
git checkout dev

# List branches
git branch

# Switch branches
git checkout <BRANCH_NAME>

# Delete branch (already merged)
git branch -d <BRANCH_NAME>
```

> Your default branch may be **main** (modern) or **master** (older repos). Substitute accordingly.

---

## 9) Merge changes

```bash
git checkout main
git merge feature/signup
```

* If Git can fast-forward, it moves `main` forward; otherwise it creates a merge commit and may ask you to resolve conflicts.

---

## 10) Connect to remotes

```bash
# Add a remote (local alias 'origin' -> remote URL)
git remote add origin <https-or-ssh-url>

# See remotes
git remote -v
```

---

## 11) Push / Pull / Fetch

```bash
# First push: set upstream so future `git push` works without args
git push -u origin main         # or master

# Later pushes
git push origin main

# Fetch remote changes (does NOT change your working files)
git fetch origin main

# Merge fetched changes into your current branch
git merge origin/main           # if you fetched

# Pull = fetch + merge (into current branch)
git pull origin main
```

> `git pull origin main` merges `origin/main` **into whatever branch you’re currently on**. Make sure you’re on the branch you intend to update.

---

## 12) Rebase (keep a linear history)

```bash
# While on your feature branch (e.g., 'sarah')
git rebase main     # replay your commits on top of latest main
```

* Purpose: bring your branch up to date with `main` **without** creating a merge commit.
* Conflicts may occur; fix them and `git rebase --continue`.

**Interactive rebase (edit history of recent commits):**

```bash
git rebase -i HEAD~4
# pick / reword / squash / fixup commits, then save & exit
```

---

## 13) Cherry-pick (take just one commit)

```bash
git log                     # find the commit hash you want
git checkout <target-branch>
git cherry-pick <HASH>
```

* Applies the changes from that specific commit onto your current branch.
* **Note:** It applies the commit’s *diff* (which can include multiple files), not “just one file.”

---

## 14) Revert (safely undo in shared history)

```bash
git revert <HASH>
```

* Creates a new commit that **reverses** the changes of `<HASH>`—safe for public branches.

---

## 15) Reset (move a branch pointer)

```bash
git reset --soft HEAD~1   # keep changes staged (undo last commit)
git reset --mixed HEAD~1  # default; keep changes, unstage them
git reset --hard HEAD~1   # discard commit AND local changes
```

* **Caution:** `--hard` removes uncommitted work.

---

## 16) Stash (shelve work-in-progress)

```bash
git stash           # save dirty working tree changes
git stash list      # see stashes
git stash show      # summary of top stash
git stash show -p   # patch (full diff) of top stash
git stash show -p stash@{2}  # show a specific stash
git stash pop       # apply top stash and drop it
# (or) git stash apply stash@{n}  # apply but keep it in stash list
```

---

## 17) “Oh no!” recovery with reflog

```bash
git reflog            # every move of HEAD, even after resets
git reset --hard <reflog-id-or-commit>
```

* Use this when you need to hop back to a point *before* a bad reset/rebase.

---

## Quick “Happy Path” Sequence You Practiced

```bash
git config user.email "munodennis@___mail.com"
git config user.name  "Dennis Tei-Muno"
git add .
git commit -m "Updated first story"
git status
```

---

## Nuggets & Gotchas

* **Commit messages:** Imperative mood, short summary line (<= 50 chars), optional description.
* **`.gitignore` doesn’t remove tracked files**—use `git rm --cached` first.
* **Rebase vs Merge:** Rebase = linear history (rewrite); Merge = preserves branching history (no rewrite). Avoid rebasing public/shared branches others already pulled.
* **First push:** Use `-u` to set upstream: `git push -u origin main`.
* **Main vs Master:** Use whichever your repo uses—new repos default to **main**.

---

If you want, I can turn this into a printable one-pager or tailor commands to **GitHub + SSH** or **GitLab** workflows.
