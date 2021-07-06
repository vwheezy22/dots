" ----Setup----
let mapleader=" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" General
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" " Syntax
" Plug 'rust-lang/rust.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tridactyl/vim-tridactyl'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'jacobPenney/vim-dissonance', {'branch': 'master'}
Plug 'norcalli/nvim-colorizer.lua'

" " Web Devel
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()

" ----Standard Bindings----
" " Enable and disable auto comment
" map <leader>c :setlocal formatoptions-=cro<CR>
" map <leader>C :setlocal formatoptions=cro<CR>

" Enable and disable auto indent
" map <leader>i :setlocal autoindent<CR>
" map <leader>I :setlocal noautoindent<CR>

" Curly braces
inoremap {<Return> {}<Left><Return><Esc>kA<Return>

" Fix indenting of visual block
vnoremap < <gv
vnoremap > >gv

" Alias write
nnoremap <leader>w :w<CR>
" command! W :w !doas tee %
" nnoremap <leader>l :!pdflatex %<CR>

" Alias replace all
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

" Basic settings
set showmatch
set number relativenumber
set clipboard+=unnamedplus
set nowrap
set autoread
set hidden
set path+=**
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set formatoptions-=cro

" Searching
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Saving settings
set noswapfile
" set nobackup
set undodir=~/.cache/nvim/undo
set undofile

" Tab settings
set expandtab
set shiftwidth=4
set softtabstop=4 tabstop=4
set smartindent

" Autocompletion
set wildmode=list:longest,full
set wildmenu

" Fix splitting
set splitbelow splitright

