syntax on
set encoding=utf-8
set termguicolors
set gfn=Source\ Code\ Pro\ 12
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" colorscheme one
" let g:airline_theme='onedark'
set background=dark
lua require'colorizer'.setup()
hi Pmenu guibg=Green guifg=White
hi ColorColumn guibg=#232323

