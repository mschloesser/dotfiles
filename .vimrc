" Heavily inspired by Yan Pritzker's vimrc file.
" Stripped down to my needs.

" ================ General Config ====================

scriptencoding utf-8
set encoding=utf-8

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set laststatus=2
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" The following command will change the 'completeopt' option 
" so that Vim's popup menu doesn't select the first completion item, 
" but rather just inserts the longest common text of all matches; 
" and the menu will come up even if there's only one match. 
set completeopt=menuone

" change the behavior of the <Enter> key when the popup menu is visible. 
" In that case the Enter key will simply select the highlighted menu item
"inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<C-g>u\<Enter>"

" Keeps a menu item always highlighted
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
" set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


" ================ Split panes ======================
set splitbelow
set splitright

" ================ Plugins (vim-plug) ===============
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'wincent/command-t'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" ==== Markdown ====
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim'
Plug 'maksimr/vim-jsbeautify'

Plug 'plasticboy/vim-markdown'

" ==== PHP ====
Plug 'stanangeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-php/tagbar-phpctags'

call plug#end()

map <c-f> :call JsBeautify()<cr>

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
