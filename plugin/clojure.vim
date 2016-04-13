augroup cljfmt
  autocmd!
  if get(g:, "cljfmt_on_save", 1)
    autocmd BufWritePre *.clj call cljfmt#Format()
  endif
augroup END
