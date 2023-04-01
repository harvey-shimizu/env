"# Start
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/plugins.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/my_configs.vim
source ~/.vim_runtime/vimrcs/filetypes.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Related Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:scratch_horizontal = 1
let g:scratch_incert_autohide = 0

let g:python_highlight_file_header_as_comment = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='qwq'
let g:airline_theme='dark'
let g:airline_theme='sonokai'
let g:airline_theme='simple'
"let g:airline_theme='base16_ashes'
"let g:airline_theme='bubblegum'
"let g:airline_theme='base16_gruvbox_dark_hard'
"let g:airline_theme='random'

"nn <leader>j <Plug>(easymotion-j)
"nn <leader>k <Plug>(easymotion-k)
"
"let os = matchstr(system('uname -a'), "CYGWIN")
"if ( os ==# "CYGWIN" )
if has( "win32unix" )
    nnoremap + :
    nnoremap eb :e ~/.bashrc<cr>
elseif has( "mac" )
    nnoremap ez :e ~/.zshrc<cr>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Related Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Added by Harvey, 1/1/2021
let maplocalleader = "\\"
set number
nnoremap <F2> :setlocal rnu!<cr>

set ut=100000000

set cursorline
"set foldmethod=manual
"set foldmethod=marker
"set foldmethod=indent
set clipboard=unnamed
set encoding=UTF-8
set autochdir
set foldopen=all
set foldclose=all
set foldlevelstart=0
set foldignore=
set shell=/bin/zsh
set expandtab
set clipboard=unnamed

colorscheme happy_hacking
colorscheme PaperColor
"set filetype=python
set showcmd

" Fast quitting
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>q :q<cr>
nnoremap <localleader>q :q<cr>
" Fast Python running
"nnoremap <leader>r :!python3 %<cr>
inoremap jk <esc>
vnoremap jk <esc>
nnoremap ev :e ~/.vimrc<cr>

nnoremap <leader>a :call NewMakeBuffer()<cr>
function! NewMakeBuffer()
    let fname = input('Enter a new filename: ')
    "echom fname
    let path_fname = fnamemodify(fname, ':p')
    "echom path_fname
    if len(fname) > 0
        execute "normal! :vsplit " .  path_fname . "\<cr>"
    endif
endfunction

nnoremap <leader>hc :helpc<cr>
" Very magic mode in searching
nnoremap / /\v\c

" Command to delete all of trailing whitespaces in a file.
nnoremap ds :%s/\v\s+$//g<cr>
"Ivoking FzF program
"nnoremap fz :FZF<cr>
nnoremap gz :call fzf#run({'options': '--reverse --preview "bat  --color=always --style=header,grid --line-range :100 {}"', 'down': 20, 'dir': '.', 'sink': 'e'})<cr>
"nnoremap fz :call fzf#run({'options': '--reverse', 'down': 20, 'dir': '~/src', 'sink': 'e'})<cr>
nnoremap gh :call fzf#run({'options': '--reverse --preview "bat  --color=always --style=header,grid --line-range :100 {}"', 'down': 20, 'dir': '~', 'sink': 'e'})<cr>
nnoremap ge :call fzf#run({'options': '--reverse --exact --preview "bat  --color=always --style=header,grid --line-range :100 {}"', 'down': 20, 'dir': '~/src', 'sink': 'e'})<cr>


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


function! s:WrapRipgrepFzf()
  "silent !clear
  let searchWorld = expand("<cword>")
  if searchWorld != ''
    let commandline = printf('call RipgrepFzf(' . "searchWorld" . ',0' . ')')
    echom commandline
    execute commandline
    "command! -nargs=* -bang RG call RipgrepFzf(searchWorld, <bang>0)
  endif
endfunction
command! SearchWorldByFZGrep call s:WrapRipgrepFzf()
nnoremap <silent> <leader>g :SearchWorldByFZGrep<cr>

nnoremap <localleader>g :Rg<cr>
"nnoremap <localleader>g :RG<cr>

"Run Terminal in Vim
nnoremap <localleader>v :vertical terminal<cr>
nnoremap <localleader>h :terminal<cr>

nnoremap <leader>k :execute "help " . expand('<cword>')<cr>

"Ctags for Python or etc
set tags=~/mytags,~/mytags.vim

"buffer control
set hidden
nnoremap <C-L> :bnext<cr>
nnoremap <C-H> :bprev<cr>
nnoremap <leader>db :bd<cr>
vnoremap <buffer> <leader>' :s/\(\h\w\+\),\?/'\1',/g<cr>:noh<cr>
vnoremap <buffer> <leader>" :s/\(\h\w\+\),\?/"\1",/g<cr>:noh<cr>
vnoremap <buffer> <leader>( :s/\(.*\)/(\1)/g<cr>:noh<cr>
vnoremap <buffer> <leader>) :s/(\(.*\))/\1/g<cr>:noh<cr>
vnoremap <buffer> <leader>[ :s/\(.*\)/[\1]/g<cr>:noh<cr>
vnoremap <buffer> <leader>] :s/\[\(.*\)\]/\1/g<cr>:noh<cr>
vnoremap <buffer> <leader>{ :s/\(.*\)/{\1}/g<cr>:noh<cr>
vnoremap <buffer> <leader>} :s/{\(.*\)}/\1/g<cr>:noh<cr>

nnoremap <leader>ls :ls<cr>
nnoremap <leader>b1 :b 1<cr>
nnoremap <leader>b2 :b 2<cr>

augroup trailing_whitespace
    autocmd!
    " Highlighting in green a trailing whitespace.
    autocmd BufNewFile,BufRead * highlight mymark_space ctermbg=Green
    autocmd BufNewFile,BufRead * match mymark_space /\v\s+$/
augroup END

function! CompileAndRunFile(command)
    silent !clear
    execute "!" . a:command . " " . bufname("%")
endfunction

augroup python_filetype
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>r :call CompileAndRunFile("python3")<cr>
    autocmd FileType python nnoremap <buffer> <localleader>w :s/^/#/<cr>:noh<cr>
    autocmd FileType python nnoremap <buffer> <localleader>d :s/^#//<cr>:noh<cr>
    autocmd FileType python vnoremap <buffer> <localleader>w :s/^/#/<cr>:noh<cr>
    autocmd FileType python vnoremap <buffer> <localleader>d :s/^#//<cr>:noh<cr>
    "Making Dectionary Sctucture for pair data, word/tuple:word/list/dict/tuple, Feb/7/2021
    autocmd FileType python vnoremap <buffer> <localleader>e :s/\v(\(.*\)\|'\h\w+'\|\d+)\s*,\s*(\(.*\)\|\{.*\}\|\[.*\]\|'\h\w+'\|\d+)/\1:\2/g<cr>:noh<cr>
augroup END

augroup go_filetype
    autocmd!
    autocmd FileType go nnoremap <buffer> <localleader>r :call CompileAndRunFile("go run")<cr>
augroup END

augroup cs_filetype
    autocmd!
    autocmd FileType cs nnoremap <buffer> <localleader>r :call CompileAndRunFile("mcs")<cr>
augroup END

augroup cpp_filetype
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <localleader>r :call CompileAndRunFile("g++")<cr>
augroup END

augroup hs_filetype
    autocmd!
    autocmd FileType haskell nnoremap <buffer> <localleader>r :call CompileAndRunFile("ghc")<cr>
    autocmd FileType haskell nnoremap <buffer> <localleader>s :call CompileAndRunFile("exercism submit")<cr>
augroup END

