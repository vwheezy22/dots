" ----Setup----
let mapleader=" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" COMPLETIONS
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'

" TOOLS
Plug 'tpope/vim-commentary'
Plug 'vim-pandoc/vim-pandoc'
Plug 'mbbill/undotree'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'https://github.com/szw/vim-maximizer'

" SYNTAX
" Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tridactyl/vim-tridactyl'

" PRETTIFY
Plug 'ojroques/nvim-hardline'

call plug#end()

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

" Searching
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Saving settings
set noswapfile
set undodir=~/.cache/nvim/undo
set undofile

" Tab settings
set expandtab
set shiftwidth=4
set softtabstop=4 tabstop=4
set smartindent

" Autocompletion Menu
set wildmode=list:longest,full
set wildmenu

" Fix splitting
set splitbelow splitright

" Fix indenting of visual block
vnoremap < <gv
vnoremap > >gv

" Write
nnoremap <leader>w :w<CR>

" Replace
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

" Yank $
nnoremap Y y$

" Commentary
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Netrw
let g:netrw_banner=0
let g:netrw_winsize = 30
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^|\s\s\s\)\zs\.S\+'

" Colors
syntax on
set encoding=utf-8
set termguicolors
set gfn=Source\ Code\ Pro\ 12
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set background=dark
hi Pmenu guibg=Grey guifg=White
hi ColorColumn guibg=#232323

" Autocmd
augroup WHEEZY
    autocmd!
    autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us  " Spellcheck fix
    autocmd BufWritePre * %s/\s\+$//e                                   " Remove trailing whitespace on save
    autocmd BufEnter * setlocal formatoptions-=o formatoptions-=r       " Annoying comment continuations
    " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics() " Show diagnostic popup on cursor hold
augroup END

" Navigation
" Window shortcuts
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" nnoremap <leader>z :wincmd o<CR>

" Windows, tabs, quickfixes, and buffers
nnoremap <leader>- :split<CR>
nnoremap <leader>\| :vsplit<CR>
nnoremap <leader><Tab> <C-^>
nnoremap <leader>c :cl<CR>:cc
nnoremap <C-n> :cn<CR>
nnoremap <C-b> :cp<CR>

nnoremap <leader>\ :w!<CR>:e %:h<CR>

" Move selected text up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <ESC>:m .+1<CR>==
inoremap <C-k> <ESC>:m .-2<CR>==
" nnoremap <leader>k :m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==

nnoremap <F5> :UndotreeToggle<CR>

" vim-powered terminal in new tab
nnoremap <leader>t :tabnew<CR>:term<CR>
nnoremap <C-v>t :vsplit<CR>:term<CR>
nnoremap <C-x>t :split<CR>:term<CR>

" Maximizer
let g:maximizer_set_default_mapping = 0
let g:maximizer_set_default_mapping_with_bang = 0
let g:maximizer_default_mapping_key = '<leader>z'

" Reload all buffers
nnoremap <F3> :checktime<CR>

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap ; ;<C-g>u

" Jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

lua require("yungwheezy")
