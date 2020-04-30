syntax on

set clipboard=unnamed,unnamedplus " copy to clipboard
set relativenumber                " show relative numbers

"------------------------------
" Indentation
"------------------------------
set autoindent
set copyindent                    " copy indent from the previous line
set expandtab                     " tabs are space
set shiftwidth=4                  " number of spaces to use for autoindent
set softtabstop=4                 " number of spaces in tab when editing
set tabstop=4                     " number of visual spaces per TAB

"------------------------------
" Use Ctrl + Backspace - delete word before the cursor
"------------------------------
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
imap <C-BS> <C-w>

"------------------------------
" Use Ctrl + Del       - delete word after the cursor
"------------------------------
imap <C-Del> <C-o>dw

"------------------------------
" Highlight extra whitespaces
"------------------------------
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

"------------------------------
" Jump to the last cursor position
"------------------------------
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif

"------------------------------
" Plugins
"------------------------------
call plug#begin()

Plug 'tpope/vim-fugitive'            " Git wrapper
Plug 'tpope/vim-rhubarb'             " GitHub handler
Plug 'shumphrey/fugitive-gitlab.vim' " GitLab handler

Plug 'rodjek/vim-puppet'             " Puppet support

call plug#end()

"------------------------------
" Plugins configuration
"------------------------------
let g:fugitive_gitlab_domains = [ 'https://gitlab.cern.ch' ]
