---
title:  "Nginx Log Rotate"
date:   2019-08-23
layout: post
category: tipsntricks
---

>Log can kill.

It's true that logs are good friends to us IT folks. But, as the saying goes, too much of anything is never a good idea. The same applies to log. 

We recently suffered an outtage due to server running out of disk space. And guess what, the culprit was the mind-blowingly large `nginx` log files.

This session details log rotation settings we applied to avoid the same problem. Imagine:

You are a Linux admin. Your server has an `nginx` server whose logs are `/var/log/nginx/access.log` and `/var/log/nginx/out.log`. You want to enable log rotation for these two files to make sure that:
  1. The maximum number of old log files to keep is 15
  1. The maximum size of a log file is 100 MB
  1. The check happens once every hour

We're going to use `logrotate` which comes with many Linux distros. Lets tackle each requirement.

## Requirement 1: number of old log files to keep is never greater than 15

Let's create an `nginx` `logrotate` configuration file at `/etc/logrotate.d/nginx`

```Bash
/var/log/nginx/*.log {
    missingok #if no log files matching this pattern exist, don't issue an error
    compress #compress old log files
    create 0640 www-data adm #create mode owner group - new log file's attributes
    postrotate #runs this after rotation
        service nginx rotate
    endscript
}
```

To rotate a log 15 times, we add the following configuration:

```Bash
rotate 15 #rotate this log file 15 times before removing it
```

## Requirement 2: log file size is never greater than 100MB

Let's add the configuration to limit the file size of each log file

```Bash
    size 100M #set maximum log file size
}
```

The complete `nginx` `lograte` configuration file should look like this 

```Bash
/var/log/nginx/*.log {
    missingok #if no log files matching this pattern exist, don't issue an error
    compress #compress old log files
    create 0640 www-data adm #create mode owner group - new log file's attributes
    postrotate #runs this after rotation
        service nginx rotate
    endscript
    rotate 15 #rotate this log file 15 times before removing it
    size 100M #set maximum log file size
}
```

Let's tesk our configuration with 

```Bash
    logrotate -d /etc/logrotate.d/nginx
```

This command will _dry-run_ our `logrotate` with the configuration and prints out what it _would have done_ if this was not a dry-run. Check to see if it's what we expected it to do.

## Requirement 3: once every hour, a check takes place to decide whether it should rotate the log file or not

`logrotate` is actually set up as a `cronjob`.

So, to make sure `logrotate` is run once every hour, we simply need to add a script to call `logrotate` hourly.

 This can be achieved by creating a `bash` script at `/etc/cron.hourly/logrotate`. It is best to simply copy the `cronjob` script provided by `logrotate` located at `/etc/cron.daily/logrotate`.

 For reference purpose, the file is as follows 

 ```Bash
#!/bin/sh

# Clean non existent log file entries from status file
cd /var/lib/logrotate
test -e status || touch status
head -1 status > status.clean
sed 's/"//g' status | while read logfile date
do
    [ -e "$logfile" ] && echo "\"$logfile\" $date"
done >> status.clean
mv status.clean status

test -x /usr/sbin/logrotate || exit 0
/usr/sbin/logrotate /etc/logrotate.conf
 ```

## That's It!

There you have it. No more worrying about `nginx` log stabbing you in your sleep (I mean literally, while you're sleeping).