---
title: "Git Tip"
date: 2019-12-13
layout: post
category: tipsntricks
---

**Last Updated on** Nov 6th 2020

## git log

| option            | find commits that                      |
| ----------------- | -------------------------------------- |
| -S \<string\>     | add or remove code matching the string |
| --grep \<string\> | has message containing the string      |
| -- \<files\>      | modifies files                         |

## Working With Files

| action + option      | usage                           |
| -------------------- | ------------------------------- |
| commit --amend       | modify current commit           |
| reset HEAD \<file\>  | unstage file, keep modification |
| checkout -- \<file\> | unmodify unstaged files         |
| git add -U  | stage all modified/deleted files, don't touch untracked files at all |

## Branching

| action + option                               | usage                                        |
| --------------------------------------------- | -------------------------------------------- |
| checkout -b \<branch\> \<remote\>\\\<branch\> | create new branch locally and setup tracking |
| branch -d \<branch\>                          | delete local branch                          |
| push \<remote\> --delete \<branch\>           | delete remote branch                         |

## git alias

like `alias` but for `git`

ex: `git config --global alias.co 'checkout'`

## Fetching PR

`git fetch upstream pull/<pull-id>/head:<destination-branch>`

## Reset a file to previous commit

`TBD` (it's git checkout)

## Turn Project Into GitHub Project

1. Create remote git repo
1. `git init`
1. Make first commit
1. `git remote add origin git@github.com:username/new_repo`
1. `git push -u origin master`
