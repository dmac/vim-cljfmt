" Reference: https://github.com/fatih/vim-go/blob/master/autoload/go/fmt.vim

function! cljfmt#Format() abort
  let l:curw=winsaveview()

  let l:tmpname=tempname()
  call writefile(getline(1,'$'), l:tmpname)
  let out = s:system("cljfmt " . l:tmpname)
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


" Run a system command while redirecting stderr to /dev/null.
function! s:system(cmd) abort
  let l:shell = &shell
  let l:shellredir = &shellredir
  let l:shellcmdflag = &shellcmdflag

  set shell=/bin/sh shellredir=> shellcmdflag=-c

  try
    return system(a:cmd)
  finally
    " Restore original values
    let &shell = l:shell
    let &shellredir = l:shellredir
    let &shellcmdflag = l:shellcmdflag
  endtry
endfunction
