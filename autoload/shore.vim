" shore.vim - autoloaded functions
"
let s:save_cpo = &cpo
set cpo&vim

let s:maps = 0


" IsOnshore {{{1
" Arg: line num/id (def: '.')
" Arg: virtcol num/id (def: '.')
" Return: true if not on leading blanks
function! shore#IsOnshore(...) abort
  let lnum = a:0 ? a:1 : '.'
  let vcol = a:0>1? a:2 : virtcol('.')
  let line = getline(lnum)
  return line !~ '^\s*\%'.vcol.'v\s'
endfun

" IsSeafront {{{1
" Arg: line num/id (def: '.')
" Arg: virtcol num/id (def: '.')
" Return: true if on 1st nonblank of line
function! shore#IsSeafront(...) abort
  let lnum = a:0 ? a:1 : '.'
  let vcol = a:0>1? a:2 : virtcol('.')
  let line = getline(lnum)
  return line =~ '^\s*\%'.vcol.'v\S'
endfun

" Walk {{{1
" Arg: how many lines to move up/down
" Return: string for map <expr>
function! shore#Walk(count) abort
  if &buftype != 'quickfix'
        \ && ((get(g:, 'shore_stayonfront', 0) && shore#IsSeafront())
        \   || (shore#IsOnshore() && !shore#IsOnshore(line('.')+a:count)))
    return (a:count>0 ? "+" : "-")
  else
    return (a:count>0 ? "j" : "k")
endfun

function! shore#SetMaps() abort
  if !s:maps
    exe 'nmap' get(g:, 'shore_key_down', 'j') '<plug>(shore)down'
    exe 'nmap' get(g:, 'shore_key_up', 'k') '<plug>(shore)up'
    let s:maps = 1
  endif
endfun

function! shore#UnsetMaps() abort
  if s:maps
    exe 'nunmap' get(g:, 'shore_key_down', 'j')
    exe 'nunmap' get(g:, 'shore_key_up', 'k')
    let s:maps = 0
  endif
endfun

function! shore#ToggleMaps() abort
  if s:maps
    call shore#UnsetMaps()
  else
    call shore#SetMaps()
  endif
endfun

let &cpo = s:save_cpo
