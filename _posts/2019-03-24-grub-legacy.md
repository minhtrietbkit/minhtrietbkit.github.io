---
title:  "Grub Legacy"
date:   2019-03-24
layout: post
category: linux
---
Recently, while preparing for the **LPIC 1** exam, I had to dig into something I've never wanted to touch: `grub`.

Now that I have grasped a fair amount of it, I hope this little blog can be of some help to others. 

This post is going to:
1. Describe very briefly how `grub legacy` works.
2. Give instruction to install `grub legacy` onto a hard drive.

This post assumes basic understanding of:
1. Boot loaders in general
2. Hard disk concepts such as **partition**, **filesystem**, **partition table**, **Master Boot Record**, **Partition Boot Record**...

During learning about `grub legacy` and composing this blog, I found materials at [GRUB bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub.html) and [GNU GRUB Manual 0.97](https://www.gnu.org/software/grub/manual/legacy/grub.html) specially helpful.

# How it works

1. When control is passed to the grub bootloader, it reads the configuration from `/boot/grub/menu.ls`
2. The configuration file typically contains 
   1. Default options for grub: waiting time before loading the default OS/bootloader, default OS/bootloader
   2. List of *menu entries*: each is either instruction to load an OS or another bootloader

# Install Grub Legacy onto an MBR-formatted hard disk

## A Little reminder of BIOS system boot up process

1. After BIOS does its work, control is passed to the **first stage bootloader** in the **MBR** of the disk which is **marked bootable**.
2. This first stage bootloader then loads the **second stage bootloader** (we'll skip the **1.5 stage bootloader**).
3. The second stage bootloader takes care of loading the OS.

In the case of grub legacy:
1. The second stage bootloader then loads the grub configuration file
2. The configuration file is at `/boot/grub/menu.ls`

## What does installing grub onto a hard disk mean?

It means installing/copying the first stage boot loader onto the disk's MBR and the second stage bootloader onto the hard disk.

I find the easiest way to install grub onto a hard disk is using the `grub-install` command as follows:

1. Boot into a running Linux machine which has `grub legacy` installed (such as `ubuntu 9.04`).
2. Make sure the hard disk is MBR formated.
3. Create a partition along with a filesystem on the hard disk and mount it.
4. Run `grub-install --boot-directory=<path-to-mount-point>

The last command does 3 things:

1. Install the first stage bootloader onto the disk's MBR.
2. Install the second stage bootloader onto the disk.
3. Create a `/boot` directory containing files necessary for `grub` to work.

You can then attach this hard drive to another machine. If you config its BIOS to boot from this hard disk, you will be able to boot into the grub bootloader from the disk.