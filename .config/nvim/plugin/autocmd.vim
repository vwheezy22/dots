augroup WHEEZY
    autocmd!
    autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us  " Spellcheck fix
    autocmd BufWritePre * %s/\s\+$//e                                   " Remove trailing whitespace on save
augroup END

