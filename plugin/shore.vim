" shore.vim - autojump to 1st nonblank
if exists("g:loaded_shore") || &cp
  finish
endif
let g:loaded_shore = 1

let s:save_cpo = &cpo
set cpo&vim


nnoremap <expr> <plug>(shore)up  shore#Walk(-v:count1)
nnoremap <expr> <plug>(shore)down  shore#Walk(v:count1)

command! -bar ToggleShore
      \ call shore#ToggleMaps()

if !get(g:, 'shore_nomaps', 0)
  call shore#SetMaps()
endif

let &cpo = s:save_cpo
