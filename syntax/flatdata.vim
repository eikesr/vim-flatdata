" Vim syntax file
" Language: flatdata
" Maintainer: Eike S R
" Last Change: 27 July 2018

if exists("b:current_syntax")
  finish
endif


syn case match

syn keyword fdTodo contained TODO FIXME XXX

syn keyword fdStruct struct nextgroup=fdStructName skipwhite
syn keyword fdArchive archive nextgroup=fdArchiveName skipwhite
syn keyword fdNamespace namespace
syn keyword fdFieldType contained u8 u16 u32 u64 i8 i16 i32 i64 bool
syn keyword fdArchiveType contained vector multivector raw_data
syn keyword fdConstType const nextgroup=fdFieldType skipwhite

syn match fdExplicit contained /@explicit_reference/
syn match fdOptional contained /@optional/
syn match fdBoundImplicitly /@bound_implicitly/

syn match fdInt /-\?\<\d\+\>/
syn match fdInt /\<0[xX]\x+\>/

syn match fdStructName /\<\w\+\>/ contained nextgroup=fdStructBlock skipwhite skipnl
syn region fdStructBlock start="{" end="}" contained contains=fdFieldType,fdInt,fdLineComment,fdBlockComment fold extend

syn match fdArchiveName /\<\w\+\>/ contained nextgroup=fdArchiveBlock skipwhite skipnl
syn region fdArchiveBlock start="{" end="}" contained contains=fdArchiveType,fdExplicit,fdOptional,fdLineComment,fdBlockComment fold extend

syn region fdLineComment start="//" skip="\\$" end="$" keepend contains=fdTodo
syn region fdBlockComment matchgroup=fdCommentStart start="/\*" end="\*/" keepend contains=fdTodo,fdCommentError fold extend
syn match fdCommentError display "/\*"me=e-1 contained
syn match fdCommentEndError display "\*/"


hi def link fdLineComment Comment
hi def link fdBlockComment Comment
hi def link fdCommentStart Comment
hi def link fdCommentError Error
hi def link fdCommentEndError Error
hi def link fdTodo Todo
hi def link fdStruct Structure
hi def link fdArchive Structure
hi def link fdNamespace Structure
hi def link fdConstType Type
hi def link fdFieldType Type
hi def link fdArchiveType Type
hi def link fdInt Number
hi def link fdExplicit Function
hi def link fdOptional Function
hi def link fdBoundImplicitly Function


let b:current_syntax = "flatdata"
