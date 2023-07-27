augroup cljfmt
  autocmd!
  if get(g:, "cljfmt_on_save", 1)
    autocmd BufWritePre *.clj,*.cljs,*.cljc,*.edn call cljfmt#Format()
  endif
augroup END
