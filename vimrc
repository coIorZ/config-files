" => Vundle required settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shell=/bin/sh
set nocompatible " be iMproved
filetype off "disable file type detection for loading specific options
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() "required
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
""""""""""""""""""
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'
"Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"Plugin 'othree/html5.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
"Plugin 'posva/vim-vue'

call vundle#end() "required
filetype plugin indent on "enable loading plugins and indents based on file type (required for Vundle)


" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=' ' " Map Leader
set updatetime=2000
set mouse=a
set autoread "auto read files when modified outside
set ignorecase
set hlsearch
set incsearch
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
set clipboard=unnamed "use system clipboard as default
set noswapfile "disable .swp file


" => Appearence options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on "turn on syntax highlighting
set cursorline "highlight the screen line of the cursor
set cursorcolumn
set number "enable line numbers
set ruler "show the line and column number of the cursor position
set scrolloff=3 "3 lines off the edge when scrolling
set guifont=Monaco:h13
" Theme {
colorscheme molokai "tomasr/molokai is required
let g:molokai_original=1
let g:rehash256=1
"}
" Status Line {
set laststatus=2                             " always show statusbar
"set statusline=
"set statusline+=%-10.3n\                     " buffer number
"set statusline+=%f\                          " filename
"set statusline+=%h%m%r%w                     " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
"set statusline+=%=                           " right align remainder
"set statusline+=0x%-8B                       " character value
"set statusline+=%-14(%l,%c%V%)               " line, character
"set statusline+=%<%P                         " file position
"}
let g:netrw_liststyle=3


" => Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start "intuitive backspacing in insert mode
set autoindent "copy indent from current line when starting a new line
set smartindent
set tabstop=2 "number of spaces that a <Tab> in the file counts for
set softtabstop=2 "number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=2 "number of spaces to use for each step of (auto)indent
set expandtab "use the appropriate number of spaces to insert a <Tab>.
set smarttab "makes a <Tab> in front of a line insert blanks according to 'shiftwidth'


" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Escape
inoremap kj <Esc>
inoremap KJ <Esc>

" Window switching
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Pagedown 1/2
nmap <S-j> <C-d>
" Pageup 1/2
nmap <S-k> <C-u>

" Move to the next buffer
nmap <S-l> :bnext<CR>
" Move to the previous buffer
nmap <S-h> :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>q :bd<CR>
" Switch between two most recent buffers
nmap <Tab> :b#<CR>
" Create new [No Name] buffer
nmap <Leader>t :enew<CR>

" Format JSON
com! FormatJSON %!python -m json.tool


" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""""""""""
"map <Leader> <Plug>(easymotion-prefix)

" AirLine
""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_nr_show=1

" CtrlP
""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<D-p>'
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode='r'
"let g:ctrlp_use_caching=0
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore='node_modules\|git'
" Easy bindings for its various modes
nmap <Leader>b :CtrlPBuffer<cr>
nmap <Leader>m :CtrlPMixed<cr>
nmap <Leader>r :CtrlPMRU<cr>
nmap <Leader>p :CtrlP<cr>

" NERDTree
""""""""""""""""""""""""""""""
nmap <Leader>n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.class$']
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1

" NERDCommenter
""""""""""""""""""""""""""""""
let g:NERDCommentEmptyLines=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
:map <D-/> <Leader>ci
"nmap <Leader>cc :call NERDComment(0,"toggle")<CR>

" Fugitive
""""""""""""""""""""""""""""""
nmap <Leader>gb :Gblame<cr>

" DelimitMate
""""""""""""""""""""""""""""""
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" Javascript
""""""""""""""""""""""""""""""
let g:javascript_enable_domhtmlcss=1

" Syntastic
""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
"let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']

" Jsx
""""""""""""""""""""""""""""""
let g:jsx_ext_required=0 " Allow JSX in normal JS files

" AutoFormat
""""""""""""""""""""""""""""""
"au BufWrite * :Autoformat "auto format upon saving
nnoremap <Leader>f :Autoformat<CR>
"let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
"let g:formatters_javascript=['eslint']
"let g:autoformat_verbosemode=1

" Ack
""""""""""""""""""""""""""""""
nnoremap <Leader>a :Ack!<Space>
let g:ack_mappings={"o": "<CR><C-W><C-W>:ccl<CR>"}
