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

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'norcalli/nvim-colorizer.lua'

" " Web Devel
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'

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

" Curly braces
inoremap {<Return> {}<Left><Return><Esc>kA<Return>

" Fix indenting of visual block
vmap < <gv
vmap > >gv

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcutting split resizing
map <leader>H <C-w>>
map <leader>J <C-w>-
map <leader>K <C-w>=
map <leader>L <C-w><

" Alias write and source
nnoremap <leader>w :w<CR>
nnoremap <leader>s :source %<CR>
nnoremap <leader>l :!pdflatex %<CR>

" Alias replace all
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

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
set softtabstop=4 tabstop=4
set smartindent

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright


" Plugin Tweaking

" COC                                                                                                                                                                                                               K

" let g:coc_global_extensions = ['']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Different colored coc window
hi CocFloating guibg=DarkBlue ctermbg=DarkBlue
hi CocHintFloat guifg=Black ctermfg=Black
hi CocInfoFloat guifg=Black ctermfg=Black
hi CocWarningFloat guifg=Yellow ctermfg=Yellow
hi CocErrorFloat guifg=Red ctermfg=Red
