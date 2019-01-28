set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers 
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set autowriteall
syntax on " I enjoy having syntax highlighting. Weird, I know
set laststatus=2
set termguicolors
set encoding=utf8
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let mapleader=','
nmap ; :Buffers<CR>
nmap <Leader>e :Files<CR>
nnoremap <leader>q :bp<cr>:bd #<cr>
" incantations that may or may not be necessary to make true color work with tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set rtp+=~/.vim/bundle/*
call vundle#begin()

" vundle and theme, which deserve their own block for reasons
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/csapprox'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'hzchirs/vim-material'
let g:airline_theme='material'
let g:airline_powerline_fonts=1
" let g:material_style='oceanic'
set background=dark
colorscheme vim-material

" general productivity plugins
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
Plugin 'Janko-m/vim-test'
Plugin 'EinfachToll/DidYouMean'
Plugin 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files='home'
Plugin 'w0rp/ale'
Plugin 'shougo/deoplete.nvim'
Plugin 'cespare/vim-sbd'

" haskell specific stuff
Plugin 'alx741/vim-hindent'
Plugin 'eagletmt/neco-ghc'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'parsonsmatt/intero-neovim'

" clojure specific stuff
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
Plugin 'clojure-vim/async-clj-omni'
Plugin 'eraserhd/parinfer-rust'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'

" python specific stuff
Plugin 'zchee/deoplete-jedi'
Plugin 'nvie/vim-flake8'

" maybe fix Unicode icons on a good day
Plugin 'ryanoasis/vim-devicons'

call vundle#end()            " required
filetype plugin indent on    " required

" Use ripgrep instead of ag with fzf
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" turn on nerdtree automatically 
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" This line causes us to focus on the editor pane rather than nerdtree when we open Vim
autocmd VimEnter * wincmd p

