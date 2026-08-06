1. Logrotate is a Linux utility that manages log files automatically. It prevents log files from becoming too large and filling up the disk.

Simple Example

Imagine you have a notebook where you write every day.

When the notebook becomes full, you close it and start a new notebook.
You keep the old notebooks for some time.
After a few months, you throw away the oldest notebooks.

Logrotate works the same way for log files.

2. Why do we use Logrotate?

Suppose a web server keeps writing logs to:

/var/log/apache2/access.log

Every day, thousands of users visit the website. The log file keeps growing:

Day 1 → 50 MB
Day 10 → 500 MB
Day 30 → 2 GB

If it keeps growing, the server's disk may become full.

Logrotate solves this problem automatically.

3. What does Logrotate do?

For example, when access.log reaches a certain size or after one day:

Renames the old log:

access.log → access.log.1

Creates a new empty log:

access.log

Compresses old logs:

access.log.1.gz
Deletes very old logs after a specified number.

4. Example

Before rotation:

/var/log/apache2/

access.log

After rotation:

/var/log/apache2/

access.log
access.log.1.gz
access.log.2.gz
access.log.3.gz

If the configuration says keep only 3 old logs, then after the next rotation:

access.log.4.gz

will be deleted automatically.

5. Common Logrotate Configuration
/var/log/apache2/*.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
Meaning
daily → Rotate logs every day.
rotate 7 → Keep the last 7 log files.
compress → Compress old logs using .gz.
missingok → Don't show an error if the log file doesn't exist.
notifempty → Don't rotate the log if it's empty.

6. Where is the configuration?

Main configuration:

/etc/logrotate.conf

Application-specific configurations:

/etc/logrotate.d/

Example:

ls /etc/logrotate.d

Output:

apache2
nginx
rsyslog
