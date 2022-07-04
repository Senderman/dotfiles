" Vim syntax file
" Language:     android_log
" Maintainer:   Yan QiDong <yanqd0@outlook.com>


" Quit when a syntax file was already loaded {{{
if exists("b:current_syntax")
    finish
else
    let b:current_syntax = "android_log"
endif
" }}}

" Syntax {{{

" Known exceptions {{{
syntax keyword AndroidLogException  FATAL EXCEPTION
syntax match AndroidLogException    "\v<System\.err>"
syntax match AndroidLogException    "\v\s*Process:.*,\s*PID:"
syntax match AndroidLogException    "\v<java\.lang\.Throwable>"
syntax match AndroidLogException    "\v<java\.lang.*Error>"
syntax match AndroidLogException    "\v<java\.lang.*Exception>"
syntax match AndroidLogException    "\v\tat "

highlight link AndroidLogException Exception

syntax cluster AndroidLogTop add=AndroidLogException
" }}}

" Special values {{{
syntax keyword AndroidLogBoolean            true false
syntax keyword AndroidLogConstant           null
syntax match   AndroidLogSpecialError       contained "\\."
syntax match   AndroidLogSpecialCharError   contained "[^']"
syntax match   AndroidLogSpecialChar        contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syntax match   AndroidLogCharacter          "'[^']*'" contains=AndroidLogSpecialChar,AndroidLogSpecialCharError
syntax match   AndroidLogCharacter          "'\\''" contains=AndroidLogSpecialChar
syntax match   AndroidLogCharacter          "'[^\\]'"
syntax region  AndroidLogString             start=+"+ end=+"+ end=+$+ contains=AndroidLogSpecialChar,AndroidLogSpecialError,@Spell
syntax match   AndroidLogNumber             "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syntax match   AndroidLogNumber             "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syntax match   AndroidLogNumber             "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syntax match   AndroidLogNumber             "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

highlight default link AndroidLogBoolean            Boolean
highlight default link AndroidLogConstant           Constant
highlight default link AndroidLogSpecialError       Error
highlight default link AndroidLogSpecialCharError   Error
highlight default link AndroidLogSpecialChar        SpecialChar
highlight default link AndroidLogCharacter          Character
highlight default link AndroidLogSpecialChar        SpecialChar
highlight default link AndroidLogString             String
highlight default link AndroidLogNumber             Number

syntax cluster AndroidLogTop add=
            \ AndroidLogBoolean,
            \ AndroidLogConstant,
            \ AndroidLogSpecialChar,
            \ AndroidLogCharacter,
            \ AndroidLogSpecialChar,
            \ AndroidLogString,
            \ AndroidLogNumber,
" }}}

" AndroidLogDate {{{
syntax match AndroidLogDate "\v^\d\d-\d\d \d\d:\d\d:\d\d\.\d\d\d*"

highlight link AndroidLogDate Special
" }}}

" Android log levels {{{
syntax match AndroidLogV    "\v <V> "
syntax match AndroidLogD    "\v <D> "
syntax match AndroidLogI    "\v <I> "
syntax match AndroidLogW    "\v <W> "
syntax match AndroidLogW    "\v <E> "
syntax region AndroidLogE start="\v <E> .*:" end="\n" contains=@AndroidLogTop

highlight link AndroidLogV  DiffChange
highlight link AndroidLogD  DiffText
highlight link AndroidLogI  DiffAdd
highlight link AndroidLogW  DiffDelete
highlight link AndroidLogE  Error

syntax cluster AndroidLogTop add=AndroidLogW
" }}}

" AndroidLogTag {{{
syntax keyword AndroidLogTag
            \ Activity
            \ ActivityThread
            \ ActivityManager
            \ AlarmManager
            \ View
            \ AndroidRuntime

syntax match AndroidLogTag "\v<System\.out>"

highlight link AndroidLogTag Tag

syntax cluster AndroidLogTop add=AndroidLogTag
" }}}

" }}}


" vim: set shiftwidth=4 softtabstop=-1 expandtab:
" vim: foldenable foldmethod=marker foldmarker={{{,}}} foldminlines=2:
" vim: set textwidth=80 colorcolumn=80:
