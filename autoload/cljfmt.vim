" Reference: https://github.com/fatih/vim-go/blob/master/autoload/go/fmt.vim

function! cljfmt#Format()
  let l:curw=winsaveview()

  let l:tmpname=tempname()
  call writefile(getline(1,'$'), l:tmpname)
  let out = system("cljfmt " . l:tmpname)
  let lines = split(out, '\n')

  " Simple error handling for now. Could use the quickfix window instead.
  if v:shell_error > 0
    echomsg join(lines, "\n")
    return
  endif

  if line('$') > len(lines)
    execute len(lines) .',$delete'
  endif

  call setline(1, lines)

  call delete(l:tmpname)
  call winrestview(l:curw)
endfunction
