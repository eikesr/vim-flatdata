" Vim syntax file
" Language: flatdata
" Maintainer: Eike S R
" Last Change: 10 July 2018

if exists("b:current_syntax")
  finish
endif


syn case match

syn keyword fdTodo contained TODO FIXME XXX
syn cluster fdCommentGroup contains=fdTodo

syn keyword fdSyntax struct archive namespace
syn keyword fdFieldType u8 u16 u32 u64 i8 i16 i32 i64 bool

syn match fdInt /-\?\<\d\+\>/
syn match fdInt /\<0[xX]\x+\>/
syn match fdFloat /\<-\?\d*\(\.\d*\)\?/

syn region fdLineComment start="//" skip="\\$" end="$" keepend contains=fdCommentGroup
syn region fdBlockComment matchgroup=fdCommentStart start="/\*" end="\*/" keepend contains=fdCommentGroup,fdCommentError fold extend

syn match fdCommentError display "/\*"me=e-1 contained
syn match fdCommentEndError display "\*/"


hi def link fdLineComment Comment
hi def link fdBlockComment Comment
hi def link fdCommentStart Comment
hi def link fdCommentError Error
hi def link fdCommentEndError Error
hi def link fdTodo Todo
hi def link fdSyntax Structure
hi def link fdFieldType Type
hi def link fdInt Number
hi def link fdFloat Float

let b:current_syntax = "flatdata"
