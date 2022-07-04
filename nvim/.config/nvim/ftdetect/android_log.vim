" Vim syntax file
" Language:     android_log
" Maintainer:   Yan QiDong <yanqd0@outlook.com>


if has("autocmd")
    augroup android_log_files
        autocmd!
        autocmd BufNewFile,BufRead *.alog           setfiletype android_log
        autocmd BufNewFile,BufRead main_log         setfiletype android_log
        autocmd BufNewFile,BufRead main_log.\d*     setfiletype android_log
        autocmd BufNewFile,BufRead sys_log          setfiletype android_log
        autocmd BufNewFile,BufRead sys_log.\d*      setfiletype android_log
        autocmd BufNewFile,BufRead radio_log        setfiletype android_log
        autocmd BufNewFile,BufRead radio_log.\d*    setfiletype android_log
        autocmd BufNewFile,BufRead crash_log        setfiletype android_log
        autocmd BufNewFile,BufRead events_log       setfiletype android_log
    augroup END
endif


" vim: set shiftwidth=4 softtabstop=-1 expandtab:
" vim: foldenable foldmethod=marker foldmarker={{{,}}} foldminlines=2:
" vim: set textwidth=80 colorcolumn=80:
