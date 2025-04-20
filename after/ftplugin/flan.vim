" Vim filetype plugin file
" Language:     Flan
" Maintainer:   Anders <greg[NOSPAM]@gpanders.com>
" Last Update:  2023 Jun 9

if exists('g:flan_ftplugin')
  finish
endif
let g:flan_ftplugin = 1

setlocal commentstring=;%s
setlocal comments=:;;,:;
setlocal formatoptions-=t
setlocal suffixesadd=.flan
setlocal lisp
setlocal lispwords=accumulate,case,case-try,collect,do,doto,each,eval-compiler,faccumulate,fcollect,fn,for,icollect,lambda,let,macro,macros,match,match-try,when,while,with-open

let b:undo_ftplugin = 'setlocal commentstring< comments< formatoptions< suffixesadd< lisp< lispwords<'
