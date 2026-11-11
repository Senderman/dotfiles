# /var/run/utmp

It keeps track of currently logged-in users.

To see the content, run the `w` or the `who` command


# /var/log/wtmp

It keeps track of historical data of every log-in and logout activity.

To see the content, run the `last` command

# /var/log/btmp

It maintains the record of invalid log-in attempts.

To see the content, run the `lastb` command

# utmpdump

It is possible to dump the content of any of the files above using the following command:

`utmpdump /path/to/file`

