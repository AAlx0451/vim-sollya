" Vim ftplugin file
" Language:    Sollya
" Maintainer:  AAlx0451 <https://github.com/AAlx0451>

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

setlocal comments=s1:/*,mb:*,ex:*/,://,:#
setlocal commentstring=//\ %s

let b:undo_ftplugin = 'setlocal comments< commentstring<'

let &cpoptions = s:cpo_save
unlet s:cpo_save
