" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>bl :Buffers<CR>
nnoremap <leader>r :History<CR>
nnoremap <leader>cr :History:<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <leader>m :Marks<CR>

" Window shortcuts
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>z :wincmd o<CR>

" Note: nvim does not differentiate between C-x and C-S-x
" nnoremap <C-h> :wincmd ><CR>
" nnoremap <C-j> :wincmd -<CR>
" nnoremap <C-k> :wincmd =<CR>
" nnoremap <C-l> :wincmd <<CR>


" Windows, tabs, quickfixes, and buffers
" nnoremap <leader>t :tabedit
nnoremap <leader>- :split<CR>
nnoremap <leader>\| :vsplit<CR>
nnoremap <leader><Tab> <C-^>
nnoremap <leader>c :cl<CR>:cc
nnoremap <C-n> :cn<CR>
nnoremap <C-b> :cp<CR>
nnoremap <leader>bk :bd<CR>
nnoremap <leader>bK :%bd<CR>

nnoremap <leader>\ :w!<CR>:e %:h<CR>


