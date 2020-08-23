" ----Setup----
let mapleader=" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'norcalli/nvim-colorizer.lua'

" Web Devel
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Commenting
Plug 'tpope/vim-commentary'
call plug#end()


" ----Basic AutoCmd ----
"  Spellcheck fix
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Web devel
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ----Standard Bindings----
" Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Toggle commenting
noremap <C-_> :Commentary<CR>

" Enable spell checking
map <C-S> :setlocal spell! spelllang=en_us<CR>

" Enable and disable auto indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Fix indenting of visual block
vmap < <gv
vmap > >gv

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Alias write and source
nnoremap <leader>w :w<CR>
nnoremap <leader>s :source %<CR>
nnoremap <leader>l :!pdflatex %<CR>

" Alias replace all
nnoremap S :%s//g<Left><Left>

" Save file as sudo when no sudo permissions
cnoremap W execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Fonts, colors, and themes
syntax on
set encoding=utf-8
set gfn=Source\ Code\ Pro\ 12
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" colorscheme one
" let g:airline_theme='onedark'
set background=dark
set cursorcolumn
set cursorline
lua require'colorizer'.setup()

" Basic settings
set showmatch
set ignorecase
set smartcase
set number relativenumber
set clipboard+=unnamedplus
set nowrap
set smartcase

" Searching
set incsearch
nnoremap <leader>/ :nohlsearch<CR>

" Saving settings
set noswapfile
set nobackup
set undodir=~/.cache/nvim/undo
set undofile

" Tab settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

