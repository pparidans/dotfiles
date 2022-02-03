" vim:set ts=2 sts=2 sw=2 expandtab:

call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

call plug#end()

" remove all existing autocmds
autocmd!

set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" bigger commands/search history
set history=10000
" default indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" always display the status line
set laststatus=2
" better searching
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
" single screen line to use for command-line
set cmdheight=1
" use open window on buffer change
set switchbuf=useopen
" always show tab bar at the top
set showtabline=2
" default window width
set winwidth=79
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" show incomplete commands
set showcmd
" enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Diffs are shown side-by-side not above/below
set diffopt=vertical
" Always show the sign column
set signcolumn=no
" True color mode! (Requires a fancy modern terminal, but iTerm works.)
:set termguicolors
" Write swap files to disk and trigger CursorHold event faster (default is
" after 4000 ms of inactivity)
:set updatetime=200
" Completion options.
"   menu: use a popup menu
"   preview: show more info in menu
:set completeopt=menu,preview

" Use persistent undo history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

set background=dark
colorscheme dracula

" Hide menubar
set guioptions-=m

" Hide toolbar
set guioptions-=T

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"
" Fuzzy Search with FZF (Ctrl-P keybind)
"

" Check if in Git repository
function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

" Search in Git files if possible, or fallback on regular file listing
function! GitFilesOrFind()
  let root = s:get_git_root()
  if empty(root)
    call fzf#run({'sink': 'e'})
  else
    call fzf#run({'source': 'git ls-files', 'sink': 'e'})
  endif
endfunction

nnoremap <c-p> :call GitFilesOrFind()<cr>
