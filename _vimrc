runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start
set autoindent " always set autoindenting on
set ruler      " show the cursor position at all time
set showcmd    " display incomplete commands
set incsearch  " do incremental searching

set wildmode=list:full

if has("ruby") " assume system has ruby
  " Add stdlib of environment's ruby to path
  let stdlib = system('ruby -rrbconfig -e"print RbConfig::CONFIG[\"rubylibdir\"]"')
  let &l:path = &path . "," . stdlib
endif

let g:ruby_path = &path

if has("autocmd")
  " Enable fome type detection.
  " User the default filetype settings
  " Also load indent files, to automatically do language-dependant indenting
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  autocmd BufRead *.rdoc setlocal filetype=text
  autocmd BufRead *.markdown setlocal filetype=mkd
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set lines=40
  set columns=80
  set background=light
else
  set background=dark
endif

filetype on
filetype plugin on

set expandtab
set shiftwidth=2
set softtabstop=2

set scrolloff=2
set laststatus=2

"match ExtraWhitespace /\s\+$/
"match ExtraTabs /\t\+/

"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
"highlight ExtraTabs ctermbg=red guibg=red

" a cleaner font
if has('gui_running')
  if has('win32') || has('win16') || has('win64')
    set guifont=Consolas:h10:cANSI
  elseif has('mac') || has('macunix')
    set guifont=Menlo:h10
  else
    set guifont=Monospace:h10
  endif
endif
" gorgeous light/dark color theme
colorscheme solarized
" show long lines
set colorcolumn=+1
" highlight the current line
set cursorline
" show lines number
set number
" you're not forced anymore to write or undo your changes before 
" switching/opening a new buffer
set hidden 
" set show matching parenthesis
set showmatch
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase
set smartcase
" ignore some files/folders when autocompleting names 
if has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
endif
set wildignore+=*.pyc,*.class
" change the terminal's title
set title
" don't beep
set noerrorbells
" as we are all using vcs' systems, we don't need swap/backup files anylonger 
set nobackup
set noswapfile
" highlighting whitespaces/tabs
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
" the normal vim copy/paste operations use the system clipboard
"set clipboard=unnamedplus
" automatically switch to the current buffer file's directory
"set autochdir
" keep the selection
vmap > >gv
vmap < <gv
" classical usage of Ctrl-Tab to switch from/to buffer
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
" write with sudo
"command! W w !sudo tee % > /dev/null
" display a warning when the file exernally changed
au FileChangedShell * echo "Warning: File changed on disk"
" GVim/MacVim, cleanup a little bit the interface
if has('gui_running')
  if has("win32")
    "x on an English Windows version. n on a French one
    au GUIEnter * simalt ~x 
  endif
endif

