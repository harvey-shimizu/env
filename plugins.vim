" *****************************************************************************************************
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
" Plugin Manager
" *************** Plugins begin from here *************************************************************
call plug#begin('~/.vim_runtime/autoload')
Plug 'ntk148v/vim-horizon'
"Plug 'junegunn/vim-plug'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'kien/ctrlp.vim'
"Plug 'sgur/ctrlp-extensions.vim'
"Plug 'tacahiroy/ctrlp-funky'
Plug 'mtth/scratch.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-python/python-syntax'
Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh'
"    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'vim-scripts/taglist.vim'
"Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'"
"Plug 'glts/vim-magnum'
Plug 'tpope/vim-fugitive'
call plug#end()
