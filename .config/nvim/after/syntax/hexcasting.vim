if exists("b:current_syntax")
    finish
endif

syn match comment "^\/\/.*" contains=confTodo,@Spell
syn match number "\v\d+(\.\d+)?"
syn match bookkeeper "\v(Bookkeeper's Gambit: )@<=[-v]+"
syn match spell "\v^(.*(Reflection|Purification|Distillation|Exaltation|Decomposition|Disintegration|Gambit|}|\{|\<|\").*)@!.*"
syn region string start=+"+ end=+"+ oneline
syn region string start=+'+ end=+'+ oneline
syn match embed "\v\<.*\>"

hi def link comment	Comment
hi def link number Number
hi def link spell Keyword
hi def link bookkeeper Number
hi def link embed Constant
hi def link string String

let b:current_syntax = "hexcasting"

