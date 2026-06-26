setopt auto_cd                # cd to directory without typing cd
setopt auto_pushd             # make cd push the old directory onto the directory stack
setopt pushd_ignore_dups      # don't push multiple copies of the same directory onto the directory stack.=
setopt pushdminus             # exchanges the meanings of ‘+' and ‘-' when used with a number to specify a directory in the stack
setopt interactivecomments    # recognize comments
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

