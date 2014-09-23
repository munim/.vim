"*******************************************************
" SETTINGS

" Set mouse mode.
" set mouse=a

" Ensure we are out of crappy vi compatible mode.
set nocompatible

" Automatically change working directory to the directory of the open file.
set autochdir

" Enable syntax highlighting.
syntax enable

" Set startup colorscheme.
colorscheme monokai

" Don't let text wrap when it hits the edge of the screen.
set nowrap

" Briefly jump cursor to matching brace when typing completion brace.
set showmatch

" Decrease the time it takes to show the matching brace.
set matchtime=2

" Show line numbers by default.
set number

" Set encoding.
set encoding=utf-8

" Set font.
if has('gui_running')
    set guifont=Sauce\ Code\ Powerline:h12
endif

" Allow vim to recognize file types.
filetype on

" Allow vim to load plugins related to the detected file type.
filetype plugin on

" Allow vim to maintain a file's indent file as you edit it.
filetype indent on

" Highlight all results of a search within the file.
set hlsearch

" Set fold method to manual.
set foldmethod=manual

" Disable code folding.
set nofoldenable

" Set left and right option/alt keys to be meta keys
if has("gui_macvim")
    set macmeta
endif

" Whenever a buffer is written to a file run the syn script to synchronize with VM.
au BufWritePost /Users/chford/adobe-code/* silent exec '!syn %'|redraw!

set smartindent

" Set softtabstop to 4 spaces.
set softtabstop=4

" Set shiftwidth to 4 spaces.
set shiftwidth=4

" Set tabstop to 4 spaces.
set tabstop=4

" Set expandtab by default.
set expandtab

"*******************************************************

" COMMANDS

" LN will toggle line numbers on or off.
command! LN set nonumber!

" RC will re-source this .vimrc file.
command! RC :source $MYVIMRC

" W will force a write to a file you do not have permissions to modify.
command! W w !sudo tee % > /dev/null

"*******************************************************

" KEY MAPPINGS

" Map ctrl+movement keys to ctrl+w followed by the movement key.
" Makes switching between split windows extremely simple.
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Map alt+movement keys to ctrl+w followed by the movement key.
" Makes moving windows much simpler.
map ∆ <C-W>J
map ˚ <C-W>K
map ˙ <C-W>H
map ¬ <C-W>L

" Map arrow keys to window resize commands.
map <Right> 5<C-W>>
map <Left> 5<C-W><
map <Up> 5<C-W>+
map <Down> 5<C-W>-

" When pressing enter it will also run :noh to turn off highlights from previous search.
nnoremap <CR> :noh<CR>

""""" I feel like the following key mappings are a brute force way of navigating the document
""""" without using your eyes so I've temporarily commented them out while I try to learn some
""""" additional buffer movement and cursor movement commands in an attempt to phase the need
""""" for these "macro keys" out.

" Map uppercase movement keys to macro versions of themselves in normal and visual mode.
"nnoremap J 15j
"vnoremap J 15j
"nnoremap K 15k
"vnoremap K 15k
"nnoremap H 10h
"vnoremap H 10h
"nnoremap L 10l
"vnoremap L 10l

" Remap uppercase movement key functions to g+movement key.
"nnoremap gj J
"nnoremap gk K
"nnoremap gh H
"nnoremap gl L

" Force sync current file to vm
noremap <F4> :!~/bin/syn %<CR>

" F2 will use the current tab settings to retab the whole file.
noremap <F2> :retab!<CR>

noremap gw :Autoformat<CR><CR>

imap <C-c> <CR><Esc>O

"*******************************************************

" PLUGIN SETTINGS

" Tell pathogen not to load these plugins.
" let g:pathogen_disabled = [ "CSApprox", "ctrlp.vim", "fugitive", "grep", "jade", "javascript-libraries-syntax.vim", "localvimrc", "nerdcommenter", "nerdtree", "node", "scroll-color", "stylus", "syntastic", "tlib_vim", "vim-addon-mw-utils", "vim-coffee-script", "vim-indent-guides", "vim-javascript-syntax", "vim-mustache-handlebars", "vim-repeat", "vim-snipmate", "vim-snippets", "vim-surround" ]

" Invoke pathogen to load plugins.
execute pathogen#infect()

"-=-=-= localvimrc =-=-=-

" Don't ask when sourcing .lvimrc files.
let g:localvimrc_ask = 0

"-=-=-= AIRLINE/PROMPTLINE =-=-=-

" Populate powerline symbols.
let g:airline_powerline_fonts = 1

let g:promptline_preset = {
    \'a' : [ promptline#slices#user() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ]}
    "\'b' : [ promptline#slices#host() ],

"-=-=-= INDENT GUIDES =-=-=-

" Tell indent-guides plugin to start showing guides at 2 levels of indentation.
let g:indent_guides_start_level = 1

" Tell indent-guides plugin to draw guides one character in width.
let g:indent_guides_guide_size = 1

" Tell indent-guides to startup with VIM.
let g:indent_guides_enable_on_vim_startup = 1

" Set background colors manually since I rarely change my color scheme.
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=1002
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=1003

"-=-=-= CTRLP =-=-=-

" Setup ctrlp (& vim) to use ag search.
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Don't update the ctrlp window until I'm done typing.
let g:ctrlp_lazy_update = 1

" Tell ctrlp plugin to ignore the specified patterns.
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist/*'

" Ctrl+A will invoke CtrlP with ~/adobe-code/ as the root.
noremap <C-a> :CtrlP ~/adobe-code/<CR>

" Tell ctrlp plugin to start in filename matching mode instead of path
" matching mode. This makes the plugin faster and I don't care about path
" matching anyway.
let g:ctrlp_by_filename = 1

" Increase the max_files limit for ctrlp so I can search the adobe directory.
let g:ctrlp_max_files = 0 " Zero means unlimited.

" Increase the maximum depth that ctrlp will search through the directory tree.
let g:ctrlp_max_depth = 100

"-=-=-= NERDTree =-=-=-

" Ctrl+n will toggle NERDTree window.
noremap <C-n> :NERDTreeToggle<CR>

" Open NERDTree window at startup if no file is open.
"autocmd vimenter * if !argc() | NERDTree | endif

" Close VIM if NERDTree is the only window left open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"*******************************************************
