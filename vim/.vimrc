set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'rip-rip/clang_complete'
"Plugin 'suan/vim-instant-markdown'
" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number "нумерация
syntax on "синтаксис
set incsearch
set hlsearch
set ignorecase
set smartcase
set nocompatible "без совместимости
set ruler
set showcmd
set foldenable
set foldlevel=100
set foldmethod=indent
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set mouse=a
set mousemodel=popup
set autoindent "автоотступ
set wrap "перенос строк
set expandtab
set smartindent
set wildmenu
set laststatus=2
"автодополнение
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
