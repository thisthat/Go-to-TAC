{
module Lexer where
}

%wrapper "posn"

@string     = \" ($printable # \")* \"

tokens :-

-- Parole Riservate al linguaggio
 
"package"		{\(AlexPn _ l c) s -> ((c,l,s),Package)}
"import"		{\(AlexPn _ l c) s -> ((c,l,s),Import)}
"var"			{\(AlexPn _ l c) s -> ((c,l,s),DVar)}
"func"			{\(AlexPn _ l c) s -> ((c,l,s),Func)}
"val"			{\(AlexPn _ l c) s -> ((c,l,s),Val)}
"valres"		{\(AlexPn _ l c) s -> ((c,l,s),Valres)}
"cnst"			{\(AlexPn _ l c) s -> ((c,l,s),Cnst)}
"try"			{\(AlexPn _ l c) s -> ((c,l,s),Try)}
"catch"			{\(AlexPn _ l c) s -> ((c,l,s),Catch)}
"for"			{\(AlexPn _ l c) s -> ((c,l,s),For)}
"if"			{\(AlexPn _ l c) s -> ((c,l,s),If)}
"else"			{\(AlexPn _ l c) s -> ((c,l,s),Else)}
"switch"		{\(AlexPn _ l c) s -> ((c,l,s),Switch)}
"case"			{\(AlexPn _ l c) s -> ((c,l,s),Case)}
"default"		{\(AlexPn _ l c) s -> ((c,l,s),Default)}
"return"		{\(AlexPn _ l c) s -> ((c,l,s),Return)}
"continue"		{\(AlexPn _ l c) s -> ((c,l,s),Continue)}
"break"			{\(AlexPn _ l c) s -> ((c,l,s),Break)}

-- Caratteri usati dal linguaggio

[\r\n]+			{\(AlexPn _ l c) s -> ((c,l,s),End)}
"("				{\(AlexPn _ l c) s -> ((c,l,s),OpenR)}
")"				{\(AlexPn _ l c) s -> ((c,l,s),CloseR)}
"["				{\(AlexPn _ l c) s -> ((c,l,s),OpenQ)}
"]" 			{\(AlexPn _ l c) s -> ((c,l,s),CloseQ)}
"{"				{\(AlexPn _ l c) s -> ((c,l,s),OpenG)}
"}"				{\(AlexPn _ l c) s -> ((c,l,s),CloseG)}
","				{\(AlexPn _ l c) s -> ((c,l,s),Comma)}
";"				{\(AlexPn _ l c) s -> ((c,l,s),Semicol)}
":"				{\(AlexPn _ l c) s -> ((c,l,s),Col)}

-- Operatori per operazioni matematiche e booleane

"="				{\(AlexPn _ l c) s -> ((c,l,s),Uguale)}
"+"				{\(AlexPn _ l c) s -> ((c,l,s),Plus)}
"-"				{\(AlexPn _ l c) s -> ((c,l,s),Minus)}
"/"				{\(AlexPn _ l c) s -> ((c,l,s),Div)}
"*"				{\(AlexPn _ l c) s -> ((c,l,s),Ast)}
"^"				{\(AlexPn _ l c) s -> ((c,l,s),Pow)}
"!"				{\(AlexPn _ l c) s -> ((c,l,s),Not)}
"<" 			{\(AlexPn _ l c) s -> ((c,l,s), OpDiseqL)}
">"				{\(AlexPn _ l c) s -> ((c,l,s), OpDiseqG)}
"<="			{\(AlexPn _ l c) s -> ((c,l,s), OpDiseqLE)}
">="			{\(AlexPn _ l c) s -> ((c,l,s), OpDiseqGE)}

"=="			{\(AlexPn _ l c) s -> ((c,l,s), OpEq)}
"!="			{\(AlexPn _ l c) s -> ((c,l,s), OpNEq)}
"&&"			{\(AlexPn _ l c) s -> ((c,l,s), And)}
"||"			{\(AlexPn _ l c) s -> ((c,l,s), Or)}
"xor"			{\(AlexPn _ l c) s -> ((c,l,s), Xor)}

-- Carattere per dereferenziare un puntatore
"&"				{\(AlexPn _ l c) s -> ((c,l,s), DePunt)}

[\ \t]+         ;   

-- Tipi di dato del linguaggio

"rune"					{\(AlexPn _ l c) s -> ((c,l,s), TRune)}
"bool"					{\(AlexPn _ l c) s -> ((c,l,s), TBool)}
"int"					{\(AlexPn _ l c) s -> ((c,l,s), TInt)}
"string"				{\(AlexPn _ l c) s -> ((c,l,s), TStr)}
"float32"				{\(AlexPn _ l c) s -> ((c,l,s), TFloat32)}
"float64"				{\(AlexPn _ l c) s -> ((c,l,s), TFloat64)}
"true"|"false"			{\(AlexPn _ l c) s -> ((c,l,s), Booleano s)}
[a-zA-Z][a-zA-Z0-9]* 	{\(AlexPn _ l c) s -> ((c,l,s), Ident s)}
[0-9]+					{\(AlexPn _ l c) s -> ((c,l,s), Intero s)}
[0-9]+"."[0-9]+			{\(AlexPn _ l c) s -> ((c,l,s), Reale s)}
@string					{\(AlexPn _ l c) s -> ((c,l,s), Stringa (init (tail s)) )}
"'"$printable"'"		{\(AlexPn _ l c) s -> ((c,l,s), Char s)}


-- Commenti che vengono sopressi

"//".*[\n]+			;
"/*" (\*|.|\n)* "*/"	;

--Buco nero
.						{ \(AlexPn _ l c) s -> ((c,l,s), Lundef) }

{

-- Token che passiamo al parser

data Token = Lundef | Package | Import | Return | DVar | End | OpenR | CloseR | OpenQ | CloseQ | OpenG | CloseG | Comma | Semicol | Col 
	| Uguale | Minus | Pow | OpDiseqL | OpDiseqG | OpDiseqLE | OpDiseqGE | OpEq | OpNEq | And | Or | Xor | Div | Plus 
	| Not | DePunt
	| Ident String | Booleano String | Intero String | Reale String | Stringa String | Char String 
	| TRune | TBool | TInt | TStr | Ast | TFloat32 | TFloat64 | Func | Val | Valres | Cnst
	| Switch | If | Else | For | Case | Default | Try | Catch
	| Continue | Break
	deriving(Eq, Show)
}

