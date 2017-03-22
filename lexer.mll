{
	open Parser
	let line_num = ref 0
}

let integer = ['0'-'9']+
let id = ['a'-'z' 'A' - 'Z'] ['a'-'z' 'A' - 'Z' '0'-'9' '_']*

rule token = parse
	| "Module"	{Module}
	| "Model" 	{Model}
	| "Var"		{Var}
	| "Define"	{Define}
	| "Init"	{Init}
	| "Transition"	{Transition}
	| "Atomic"	{Atomic}
	| "Spec"	{Spec}
	| "Int"		{Int}
	| "Bool"	{Bool}
	| "true"	{B true}
	| "false"	{B false}
	| "TRUE"	{Top}
	| "FALSE"	{Bottom}
	| "not"		{Neg}
	| "AX"	{AX}
	| "EX"	{EX}
	| "AF"	{AF}
	| "EG"	{EG}
	| "AR"	{AR}
	| "EU"	{EU}
	| id as s		{Id s}
	| '#'		{Scalar}
	| ':'		{Colon}
	| ';'		{Semicolon}
	| ','		{Comma}
	| '.'		{Dot}
	| ".."		{DotDot}
	| '('		{LB1}
	| ')'		{RB1}
	| '['		{LB2}
	| ']'		{RB2}
	| '{'		{LB3}
	| '}'		{RB3}
	| integer as s	{I (int_of_string s)}
	| "/\\"		{And}
	| "\\/"		{Or}
	| '!'		{Nego}
	| "||"		{Oro}
	| "&&"		{Ando}
	| '+'		{Add}
	| '-'		{Minus}
	| '*'		{Mult}
	| '<'		{LT}
	| '>'		{GT}
	| "<="		{LE}
	| ">="		{GE}
	| ":="		{Assigno}
	| '='		{Equal}
	| "!="		{Non_equal}
	| '\n'		{line_num := (!line_num) + 1; token lexbuf}
	| [' ' '\t' '\r']+	{token lexbuf}	
	| eof		{File_end}


