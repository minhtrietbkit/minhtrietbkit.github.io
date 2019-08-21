---
title:  "Linux User Administration"
date:   2019-08-14
layout: post
category: tipsntricks
---
It's been a while since I last posted an entry, largely due to my busy work... But that's no excuse. That is why I'm starting this series of small tips & tricks, hoping it's easier to regularly post compact, practical entries than lenghty, academic ones.

This post in particular deals with User Administration. More specifically, it deals with following scenario:

You are a Linux admin and you want to create a new user account so that:
1. It has a set of files in their home directory
1. User is required to enter new password immediately on first login
1. It can use `sudo` without password
1. User can use `ssh` to login without password

This is pretty much like the base user or an `AWS EC2` (except for the password).

We are going to tackle these requirements one by one.

## Requirement 1: Account has a set of files in home directory

*Note* We are going to use `useradd` command to add new user.

There is a file controlling the behaviour of `useradd` command at `/etc/default/useradd`. 

Inside this file, the value `SKEL` (skeleton) points to the directory which should be used as the template for any new user's home directory created with `useradd` command.

Usually, this value is set to `/etc/skel`.

So to make sure any new users get some specific files in the home dirs, we're just going to put those files into this directory. Some nice files to have include:

| File | Purpose |
| ------- | ------- |
| .bashrc | prepare environment for new bash shell (more on this `environment` thingy later) |
| .bash_logout | clean up before logging out |
| .local/bin | store local package |
| .ssh/authorized_keys | store ssh public keys |

*Note* make sure `.ssh` has permission `700` and `.ssh/authorized_keys` - `600`

With that, let's create our new user (some options are not necessary but I prefer to as explicit about my settings as possible)

```
useradd -k /etc/skel -m -d /home/hachiman -s /bin/bash hachiman
```

## Require 2: User must enter new password immediately on first login

Before we can do anything, let's create a temporary password for hachiman.

```
passwd hachiman
# Enter password as prompted
```

Now, to enforce the second requirement, the idea is simple - simply expires the password right away. 

But there's more to it.

There's the concept of `disabled account` which means users cannot use this account anymore. An account can be disabled when its owner has not changed password for a total of `maximum password age` + `password inactivity period` (refer to `man 5 shadow` for better understanding). So we have to make sure this account will never be disabled.

So, to summarize, we must set the following fields for the password:

| Field | Value |
| ------- | ------- |
| date of last password change | 0 (translates to 1970-01-01, a value which garantees this password is expired by now) |
| password inactivity period | -1 (disables this option) |

Alright, enought talk, let's slap all this mumble jumble into reality with the `chage` command:

```
chage -d 0 -E -1 user1
```

## Requirement 3: Account can user SUDO without password

We will save a more detail introduction to the mighty `sudo`_zaibatsu_ - the `sudo` group in another chapter.

Today's episode will only focus on what we need to do to get what we want.

So, first we look at file `/etc/sudoer`. On my system, there's a line like this:

```
#includedir /etc/sudoers.d
```
This means rules from any files in `/etc/sudoers.d` whose names do not end in '~' or contain a '.' will be applied.

Let's create a file: `/etc/sudoers.d/custom` and add the following line:

```
hachiman ALL=(ALL) NOPASSWD:ALL
```

## Requirement 4: Account can ssh without password

Finally, we're almost there. Our friend Hachiman can now access his account with the temporary password we provided him with. Upon his first logging in, he will have to change the password.

First, oviously we need to generate an empty-passphrase SSH key pair for Hachiman. Then, we must add the public key to `/home/hachiman/.ssh/authorized_keys`. With this, Hachiman can now ssh into his account.

`SSH` is a powerful weapon, wielded by the many Linux admins. We'll save this weapon for later installments of the series.

For now, to get what we want, we need to find and set the following fields in `/etc/ssh/sshd_config`:

```
PasswordAuthentication no
```

## That's It!

Hachiman can now ssh into his account without passing password. Upon his first sucessful logging in attempt, he must set new password. Also, his account can use sudo without password.