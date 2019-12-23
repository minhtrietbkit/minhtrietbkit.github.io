---
title: "SSH Agent Forwarding"
date: 2019-12-09
layout: post
category: tipsntricks
---

Part of my daily tasks include following scenario:

1. SSH into a remote server (ec2 box)
2. From within that ec2 box, copy files from another ec2 box or do a git pull (typically via SSH)

The way I used to do it is

1. From my laptop, ssh into the remote server using the private key on my laptop.
2. From within the remote server, generate another key pair for accessing the second remote server.
3. From my laptop, ssh into the other server and copy/paste the public key of the newly generated key pair.

Needless to say, there are countless disadvantages with this approach.

That's when I learned about `SSH Agent Forwarding`.

In very simple, practical terms and not necessary technically correct, `SSH Agent Forwarding` is about:

> Allowing the first remote server to ssh into the second one using key storing on your laptop - the one that you're using to ssh into the first remote server.

In other words, given the scenario like the one I described above:

1. I use my laptop to ssh into a remote server (A)
2. From A I want to ssh into a second remote server (B)
3. I also have SSH key into B on my laptop

`SSH Agent Forwarding` lets me use key on my laptop to ssh into B from within A.

So how is it done?

## Step 1

Add the ssh private key to B to your laptop's ssh agent

```Bash
ssh-add <private-key-to-B>.pem
```

## Step 2

Enable `SSH Agent Forwarding` for SSH sessions to A: two approaches:

- If you use config file

  Add `ForwardAgent` option to host A section

  ```
  Host A.domain.or.ip.address
          User some-user
          ForwardAgent yes
          IdentityFile    private-key-to-A.pem
  ```

- If you use full command line to ssh in to A:

  Add `-A` flag to your command

  ```Bash
  ssh -i private-key-to-A.pem -A some-user@A.domain.or.ip.address
  ```

## Step 3

Establish ssh connection to B from within A:

```Bash
ssh some-user@B.domain.or.ip.address
```

Then you be able to ssh into B from A magically.

## That's it!

Now you can ssh from remote host A to remote host B without littering key pairs everywhere.
