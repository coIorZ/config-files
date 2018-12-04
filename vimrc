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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'
Plugin 'easymotion/vim-easymotion'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-repeat'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-rooter'
Plugin 'ayu-theme/ayu-vim'

call vundle#end() "required
filetype plugin indent on "enable loading plugins and indents based on file type (required for Vundle)


" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=' ' " Map Leader
syntax on "turn on syntax highlighting
set updatetime=100
"set mouse=a
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
set scrolloff=3 "3 lines off the edge when scrolling


" => Appearence options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme ayu
let ayucolor='mirage'
set termguicolors
set cursorline "highlight the screen line of the cursor
"set cursorcolumn
set number "enable line numbers
set ruler "show the line and column number of the cursor position
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
"Only required for mac users to preven the terminal flash issue
hi Search guibg=peru guifg=wheat
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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
inoremap Kj <Esc>
inoremap kJ <Esc>
inoremap KJ <Esc>

" Pagedown 1/2
nmap <S-j> <C-d>
" Pageup 1/2
nmap <S-k> <C-u>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>q :bd<CR>
" Create new [No Name] buffer
nmap <Leader>t :enew<CR>
" Cursor jump list
nmap <S-h> <C-o>
nmap <S-l> <C-i>
" Copy relative path
nmap <Leader>kp :let @+ = expand("%")<CR>
" Find current word
nnoremap <Leader>f *


" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""""""""""
map <Leader><Leader> <Plug>(easymotion-prefix)

" AirLine
""""""""""""""""""""""""""""""
let g:airline_section_x=0 " hide section x
let g:airline_section_y=0 " hide section y
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=0
" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#hunks#enabled=0

" NERDTree
""""""""""""""""""""""""""""""
nmap <Leader>n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.class$', '^\.git$', '\.DS_Store$']
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1

" NERDCommenter
""""""""""""""""""""""""""""""
let g:NERDCommentEmptyLines=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'

" Fugitive
""""""""""""""""""""""""""""""
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :Gstatus<CR>

" DelimitMate
""""""""""""""""""""""""""""""
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" Javascript
""""""""""""""""""""""""""""""
let g:javascript_plugin_flow=1

" Jsx
""""""""""""""""""""""""""""""
let g:jsx_ext_required=0 " Allow JSX in normal JS files

" YouCompleteMe
""""""""""""""""""""""""""""""
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Ack
""""""""""""""""""""""""""""""
nnoremap <Leader>a :Ack!<Space>
let g:ack_mappings={'o': '<CR><C-W><C-W>:ccl<CR>'}

" Signify
""""""""""""""""""""""""""""""
nmap > <Plug>(signify-next-hunk)
nmap < <Plug>(signify-prev-hunk)

" ALE
""""""""""""""""""""""""""""""
let g:ale_fixers={
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint', 'eslint'],
\   'css': ['prettier'],
\}
let g:ale_linters={
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'eslint'],
\}
let g:ale_linters_explicit=1
let g:ale_sign_column_always=1
let g:ale_fix_on_save=1

" FZF
""""""""""""""""""""""""""""""
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
nmap <Leader>p :FZF<CR>
nmap <Leader>r :History<CR>

" Rooter
""""""""""""""""""""""""""""""
let g:rooter_patterns=['.git/']
let g:rooter_silent_chdir=1
autocmd BufEnter * :Rooter
