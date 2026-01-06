# Git

## Index

1. [Install](#install)
2. [Configuration](#configuration)
3. [Create Repositories](#create-repositories)
4. [The .gitignore File](#the-gitignore-file)
5. [Branches](#branches)
6. [Make Changes](#make-changes)
7. [Synchronize Changes](#synchronize-changes)
8. [Revert commits](#revert-commits)
9. [Go back and merge](#go-back-and-merge)
10. [Create a Temp repository](#create-a-temp-repository)
11. [Working with Issues and Pull Requests](#working-with-issues-and-pull-requests)
12. [Glossary](#glossary)
13. [Additional information](#additional-information)

## Install

[Linux/Unix](https://git-scm.com/download/linux) / [Windows](https://git-scm.com/download/win) / [macOS](https://git-scm.com/download/mac)

To verify that we have git installed, we write the following command:

```shell
git --version
```

## Configuration

Configure user information for all local repositories.

Sets the name you want attached to your commit transactions:

```shell
git config --global user.name "your-name"
```

Sets the email you want attached to your commit transactions:

```shell
git config --global user.email "example@email.com"
```

Sets the default editor (this example is for Visual Studio Code):

```shell
git config --global core.editor "code --wait"
```

To open the .gitconfig file with your editor, type:

```shell
git config --global -e
```

Enables helpful colorization of command line output:

```shell
git config --global color.ui auto
```

**core.autocrlf**

If you’re programming on Windows and working with people who are not (or vice-versa), you’ll probably run into line-ending issues at some point. This is because Windows uses both a carriage-return character and a linefeed character for newlines in its files, whereas macOS and Linux systems use only the linefeed character. This is a subtle but incredibly annoying fact of cross-platform work; many editors on Windows silently replace existing LF-style line endings with CRLF, or insert both line-ending characters when the user hits the enter key.

Git can handle this by auto-converting CRLF line endings into LF when you add a file to the index, and vice versa when it checks out code onto your filesystem. You can turn on this functionality with the core.autocrlf setting. If you’re on a Windows machine, set it to true — this converts LF endings into CRLF when you check out code:

```shell
git config --global core.autocrlf true
```

If you’re on a Linux or macOS system that uses LF line endings, then you don’t want Git to automatically convert them when you check out files; however, if a file with CRLF endings accidentally gets introduced, then you may want Git to fix it. You can tell Git to convert CRLF to LF on commit but not the other way around by setting core.autocrlf to input:

```shell
git config --global core.autocrlf input
```

This setup should leave you with CRLF endings in Windows checkouts, but LF endings on macOS and Linux systems and in the repository.

If you’re a Windows programmer doing a Windows-only project, then you can turn off this functionality, recording the carriage returns in the repository by setting the config value to false:

```shell
git config --global core.autocrlf false
```

## Create Repositories

Turn an existing directory into a git repository:

```shell
git init
```

Clone (download) a repository that already exists on GitHub, including all of the files, branches, and commits:

```shell
git clone https://github.com/FJrodafo/University.git
```

## The .gitignore File

Sometimes it may be a good idea to exclude files from being tracked with Git. This is typically done in a special file named `.gitignore`

Excludes temporary files and paths (write the following text inside the `.gitignore` file):

```
*.log
build/
temp-*
```

List all ignored files in this project:

```shell
git ls-files --other --ignored --excluded-standard
```

## Branches

List all branches in the current repository:

```shell
git branch
```

Creates a new branch:

```shell
git branch branch-name
```

Switches to the specified branch and updates the working directory:

```shell
git checkout branch-name
```

Rename current branch:

```shell
git branch -m new-branch-name
```

Combines the specified branch's history into the current branch. This is usually done in pull requests, but is an important Git operation:

```shell
git merge branch-name
```

Deletes the specified branch:

```shell
git branch -d branch-name
```

## Make Changes

Lists all new or changed files that need to be committed:

```shell
git status
```

Shows differences for files that have not yet been sent to the staging area:

```shell
git diff
```

Take a snapshot of the file to prepare the release (send the file to the staging area):

```shell
git add README.md
```

Take a snapshot of all files to prepare the release  (send all files to the staging area):

```shell
git add -A
```

Shows file differences between the staging area and the latest version of the file:

```shell
git diff --staged
```

Records file snapshots permanently in version history:

```shell
git commit -m "commit-name"
```

Lists version history for the current branch:

```shell
git log
# or
git log --graph --pretty=format:'Commit: %h - %s%nAuthor: %an - %cD%n' --decorate
```

Lists version history for the current branch in one line:

```shell
git log --oneline
# or
git log --pretty=format:'%h %an %ae'
```

Outputs metadata and content changes of the specified commit:

```shell
git show commit-name
```

## Synchronize Changes

Synchronize your local repository with the remote repository on GitHub

Downloads all history from the remote tracking branches:

```shell
git fetch
```

Combines remote tracking branch into current local branch:

```shell
git merge
```

Uploads all local branch commits to GitHub:

```shell
git push
```

Updates your current local working branch with all new commits from the corresponding remote branch on GitHub (`git pull` is a combination of `git fetch` and `git merge`):

```shell
git pull
```

## Revert commits

These commands cannot be used if the branch is protected:

```shell
git reset <commit-SHA>
git add -A
git commit -m "commit-name"
git push origin -f
```

## Go back and merge

First, you need to find the hash of the commit you want to return to. You can use the `git log` command to view the commit history and find the hash of the desired commit:

```shell
git log --oneline
# or
git log --pretty=format:'%h %an %ae'
```

After identifying the hash of the commit you want to return to, you can use the `git checkout` command to move to that commit:

```shell
git checkout <commit_hash>
```

You are now in the state of the previous commit. To create a new branch from this point and merge it to the main branch, you can do the following (This will create a new branch from the previous commit and switch you to that branch):

```shell
git checkout -b <name_of_new_branch_from_previous_commit>
```

Finally, to merge this new branch with the main branch, you can use the `git merge` command while you are on the main branch (This will merge the changes from the previous commit into the new branch with the main branch):

```shell
git checkout main
git merge <name_of_new_branch_from_previous_commit>
```

It's important to note that by going back to a previous commit and creating a new branch from that point, you are creating a fork in your repository history. This can be useful for experimenting or fixing bugs, but keep in mind that it can complicate project history if not handled properly.

## Create a Temp repository

```shell
cd Documents/Dev/FJrodafo/Repositories/
mkdir Temp
cd Temp
touch README.md
git init
git branch -M main
git add -A
git commit -m "Initial Commit"
git remote add origin git@github.com:FJrodafo/Temp.git
git push -u origin main
```

```shell
# MOVE .git FOLDER TO TEMP REPOSITORY
git branch
git branch -m main master
git branch
git checkout --orphan main
git branch
git add -A
git commit -m "Initial Commit"
git remote
git remote remove bitbucket
git remote remove github
git remote remove gitlab
git remote
git remote add origin git@github.com:FJrodafo/Temp.git
git push origin main --force
git log --pretty=format:'%h %an %ae'
git branch
git branch -D master
# CHANGE .git FOLDER TO ORIGINAL REPOSITORY
git add -A
git commit -m "Initial Update"
git push -u origin main
git log --pretty=format:'%h %an %ae'
```

## Working with Issues and Pull Requests

```shell
# Make sure you are on the main branch before creating a new branch.
git checkout main

# Make sure you have the latest changes in the main branch.
git pull origin main

# Create a branch with the lowercase name of the issue you created earlier in the remote repository.
git checkout -b test

# Push the new branch to the remote repository.
git push origin test

#
# Create an Issue in the remote repository you want to work on.
#

# Check which branch you are working on (the asterisk shows your current position).
git branch

# Navigate between branches.
git checkout main
git checkout test

# Make your first changes to this new branch and push it to your remote repository.
git add -A
git commit -m "Update README.md"
git push origin test

# Go back to the main branch and make/push changes.
git checkout main
git add -A
git commit -m "Update README.md"
git push origin main

# Update the test branch with the latest changes from the main branch.
git checkout test
git fetch origin
git merge origin/main

# If there are conflicts during the merge, Git will warn you and you will have to resolve them manually. After resolving the conflicts, commit and push the merge:
git add -A
git commit -m "Resolving conflicts when merging main with test"
git push origin test

#
# Finally, create a Pull Request in the remote repository (Base: main / Compare: test).
#

# Once the Pull Request is merged, you can delete the branch either locally or remotely to keep the repository clean.
git checkout main
git pull origin main
git branch -d test
# It may fail if the branch has already been safely deleted right after merging from the Pull Request to the remote repository.
git push origin --delete test

# In addition to downloading updates, it removes references to remote branches that no longer exist in the remote repository.
git fetch --prune

# Show remote branches.
git branch -r
```

## Glossary

**git:** an open source, distributed version-control system

**GitHub:** a platform for hosting and collaborating on Git repositories

**commit:** a Git object, a snapshot of your entire repository compressed into a SHA

**branch:** a lightweight movable pointer to a commit

**clone:** a local version of a repository, including all commits and branches

**remote:** a common repository on GitHub that all team member use to exchange their changes

**fork:** a copy of a repository on GitHub owned by a different user

**pull request:** a place to compare and discuss the differences introduced on a branch with reviews, comments, integrated tests, and more

**HEAD:** representing your current working directory, the HEAD pointer can be moved to different branches, tags, or commits when using `git checkout`

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/20b5f7ec62c17e53d60914fefa2ccdf7

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>