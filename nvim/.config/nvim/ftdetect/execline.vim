au BufNewFile,BufRead * if match(getline('1'), "#!.*execlineb.*") == 0 | setf execline | endif
