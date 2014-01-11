{
module Main where

import Dati
import Lexer
import GeneralAbs
import Function
import PrettyPrint
import qualified Tac
--Se si vuole avere output colorato decommentare le seguenti righe
--NECESSARIO AVERE IL PACKAGE System.Console.ANSI
--Installabile con cabal install ansi-terminal
--import System.Console.ANSI

}

%name parseProgram
%tokentype { (Info,Token) }
%error { parseError }

%token 

PACKAGE			{ (a, Package) }
IMPORT			{ (a, Import) }
VAR				{ (a, DVar) }
FUNC			{ (a, Func) }
END				{ (a, End) }
OPENR			{ (a, OpenR) }
CLOSER			{ (a, CloseR) }
OPENQ			{ (a, OpenQ) }
CLOSEQ			{ (a, CloseQ) }
OPENG			{ (a, OpenG) }
CLOSEG			{ (a, CloseG) }
COMMA			{ (a, Comma) }
SEMICOL			{ (a, Semicol) }
COL				{ (a, Col) }
TRY				{ (a, Try) }
CATCH 			{ (a, Catch) }
RETURN			{ (a, Return) }

UGUALE			{ (a, Uguale) } 

IDENT			{ (a, Ident $$) }
BOOLEANO		{ (a, Booleano $$) }
INTERO			{ (a, Intero $$) }
FLOAT			{ (a, Reale $$) }
STRINGA			{ (a, Stringa $$) }
CHAR			{ (a, Char $$) }

RUNE			{ (a, TRune) }
BOOL			{ (a, TBool) }
INT				{ (a, TInt) }
STR				{ (a, TStr) }
AST				{ (a, Ast) }
FLOAT32			{ (a, TFloat32) }
FLOAT64			{ (a, TFloat64) }

VAL				{ (a, Val) }
VALRES			{ (a, Valres) }
CNST			{ (a, Cnst) }

FOR 			{(a, For)}
IF 				{(a, If)}
ELSE 			{(a, Else)}
SWITCH 			{(a, Switch)}
CASE			{(a, Case)}
DEFAULT 		{(a, Default)}
CONTINUE		{(a, Continue)}
BREAK			{(a, Break)}

PLUS			{(a, Plus)}
MINUS			{(a, Minus)}
DIV				{(a, Div)}
POW				{(a, Pow)}


OPEQ			{(a, OpEq)}
OPNEQ			{(a, OpNEq)}
OPDISEQL		{(a, OpDiseqL)}
OPDISEQLE		{(a, OpDiseqLE)}
OPDISEQG		{(a, OpDiseqG)}
OPDISEQGE		{(a, OpDiseqGE)}

AND				{(a, And)}
OR				{(a, Or)}
XOR				{(a, Xor)}
NOT				{(a, Not)}

DEPUNT 			{(a, DePunt)}

-- Precedenze per disambiguare la grammatica
%nonassoc UGUALE
%left OPENR
%left OPENQ
%right CLOSER
%right CLOSEQ
%left OR
%left AND
%left XOR
%left OPEQ
%left OPNEQ
%left OPDISEQL
%left OPDISEQLE
%left OPDISEQG
%left OPDISEQGE
%left PLUS 
%left MINUS
%left AST
%left DIV
%left POW
%left NOT

%%

-- Definizione della grammatica

Program: PACKAGE IDENT END ImportList GVar Funz { Pr $2 $4 $5 $6 }
   	
ImportList 	: {-empty-}							{ [] }
	    	| IMPORT STRINGA END ImportList   	{  (Imp $2 (getL $3)): $4 }
			| IMPORT OPENR END Imp CLOSER END 	{  $4 }

Imp	: STRINGA END Imp2		{  (Imp $1 (getL $2)) : $3 }

Imp2 : {-empty-}			{ []  }
	 | STRINGA END Imp2 	{ (Imp $1 (getL $2)) : $3 }

OptEnd: {-empty-}  	{ }
      | END OptEnd	{ }

GVar : {-empty-} 								{ [] }
     | VAR IDENT Tipo END GVar					{ (Var $3 (Id $2 ) (Valore $3 "") ValMode (getL $1)) : $5  }
     | VAR IDENT Tipo UGUALE Valori END GVar	{ (Var (inferTypeVar $3 $5) (Id $2 ) $5 ValMode (getL $1)) : $7 }
     | VAR OPENR END VarLine CLOSER END GVar	{ $4 ++ $7  }

VarLine : {-empty-} { []  }
		| IDENT Tipo UGUALE Valori END VarLine  { (Var (inferTypeVar $2 $4) (Id $1 ) $4 ValMode (getL $3)) : $6  }
		| IDENT Tipo END VarLine				{ (Var $2 (Id $1 ) (Valore $2 "") ValMode (getL $3)) : $4  }

Valori 	: INTERO	{ (Valore Integer $1) }
		| FLOAT		{ (Valore Flt32 $1) }
		| BOOLEANO	{ (Valore Bool $1) }
		| STRINGA	{ (Valore Str $1) }
		| CHAR		{ (Valore Byte $1) }

Tipo : {-empty-}	{ Void }
	 | RUNE			{ Byte }
	 | BOOL			{ Bool }
	 | STR			{ Str }
	 | INT			{ Integer }
	 | AST Tipo		{ Ptr $2 }
	 | FLOAT32		{ Flt32 }
	 | FLOAT64		{ Flt64 }
	 | OPENQ INTERO CLOSEQ Tipo { Arr (read $2) $4 }

Funz : {-empty-} { [] }
     | FUNC IDENT OPENR ParList CLOSER Tipo Blocco OptEnd Funz { (SFunz (Id $2) $6 $4 $7 (getL $1)) : $9 }

ParList: {-empty-}     		{ [] } 
       | ParListNE     		{ $1 }

ParListNE : IDENT Tipo Modo 			 	{ [(Par (Id $1) $2 $3)] }
		  | ParListNE COMMA IDENT Tipo Modo { (Par (Id $3) $4 $5) : $1 }
 
          
Modo : VALRES 		{ ValResMode }
     | CNST			{ ConstMode }
     | {-empty-} 	{ ValMode }
     | VAL 			{ ValMode } 

Blocco : OPENG END Lstm OptEnd CLOSEG END	{ $3 }
BloccoNE : OPENG END Lstm OptEnd CLOSEG 	{ $3 }
BloccoSw : OPENG END Lcase CLOSEG END 		{ $3 }

Lstm : {-empty-} { [] }
     |  Stm Lstm { $1 : $2 }

Stm : FOR RE SEMICOL RE SEMICOL RE Blocco { (NFor $2 $4 $6 $7 (getL $1)) }         
	| FOR RE Blocco 					{ (While $2 $3 (getL $1))  }
	| FOR Blocco						{ (While (RVal (Valore Bool "true")) $2 (getL $1)) }
	| IF RE Blocco						{ (SIf  $2 $3 (getL $1)) }
	| IF RE Blocco ELSE Blocco 			{ (SIfElse $2 $3 $5 (getL $1)) }
	| IF RE BloccoNE ELSE Blocco 		{ (SIfElse $2 $3 $5 (getL $1)) }
    | SWITCH IDENT BloccoSw 			{ (SSw (Id $2) $3 (getL $1))}
	| Blocco 							{ (SBlock $1) }
	| TRY Blocco CATCH Blocco 			{ (STry $2 $4 (getL $1))}
	| RE END 							{ (SRExp $1 (getL $2)) }
	| RETURN END    					{ (SRetVoid (getL $1)) }
	| RETURN RE END 					{ (SRet $2 (getL $1)) }
	| CONTINUE END						{ (SContinue (getL $1)) }
	| BREAK END							{ (SBreak (getL $1)) }
	| VAR IDENT Tipo END 				{ (SDic [(Var $3 (Id $2 ) (Valore $3 "") ValMode (getL $1))]) }
    | VAR IDENT Tipo UGUALE Valori END	{ (SDic [(Var (inferTypeVar $3 $5) (Id $2 ) $5 ValMode (getL $1))]) }
    | VAR OPENR END VarLine CLOSER END 	{ (SDic $4) }

Lcase : {-empty-} { [] }
	  | CASE Valori COL Lstm OptEnd Lcase { (SCase $2 $4 (getL $1)) : $6 }
	  | DEFAULT COL Lstm OptEnd { [(SCase (Valore Void "") $3 (getL $1))] }

RE  : RE PLUS RE					{ (MathExp "+" $1 $3 (getL $2)) }
	| RE MINUS RE					{ (MathExp "-" $1 $3 (getL $2)) }
	| RE AST RE						{ (MathExp "*" $1 $3 (getL $2)) }
	| RE DIV RE						{ (MathExp "/" $1 $3 (getL $2)) }
	| RE POW RE						{ (MathExp "^" $1 $3 (getL $2)) }
	| RE OPDISEQL RE				{ (RelExp "<" $1 $3 (getL $2)) }
	| RE OPDISEQLE RE				{ (RelExp "<=" $1 $3 (getL $2)) }
	| RE OPDISEQG RE				{ (RelExp ">" $1 $3 (getL $2)) }
	| RE OPDISEQGE RE				{ (RelExp ">=" $1 $3 (getL $2)) }
	| RE OPEQ RE					{ (RelExp "==" $1 $3 (getL $2)) }
	| RE OPNEQ RE					{ (RelExp "!=" $1 $3 (getL $2)) }
	| RE OR RE						{ (BoolExp "or" $1 $3 (getL $2))}
	| RE AND RE						{ (BoolExp "and" $1 $3 (getL $2)) }
	| RE XOR RE						{ (BoolExp "xor" $1 $3 (getL $2)) }
	| OPENR RE CLOSER				{ (RE $2) }
	| MINUS RE						{ (UnOp "-" $2 (getL $1)) }
	| NOT RE						{ (UnOp "!" $2 (getL $1)) }
	| LE							{ (LRExp $1) }
	| LE UGUALE RE					{ (Assg $1 $3 (getL $2)) }
	| IDENT OPENR ListParAtt CLOSER	{ (FCall (Id $1) $3 (getL $2))}
	| DEPUNT LE						{ (DPunt $2) }
	| Valori						{ (RVal $1) }

ListParAtt: {-empty-}     		{ [] } 
       	  | ListParAttNE     	{  $1  }

ListParAttNE : RE 				 	 { [$1]  }
          	 | ListParAttNE COMMA RE { $3 : $1 }

LE 	: IDENT 					{ (LID (Id $1)) }
	| AST RE					{ (LPunt $2) }
	| LE OPENQ RE CLOSEQ		{ (LVett $1 $3) }
--LEFT RECURSION

{ 

main = do
	inStr <- getContents
	let pParsed = parseProgram (alexScanTokens inStr)
	let errList = typeCheck pParsed
	putStrLn ""
	if all (=="[WARN]") (map (take 6) errList) || errList == [] then do
		writeFile "prettyPrintedFile.txt" (prettyPrint pParsed)
		putStrLn $ show pParsed
		putStrLn "--INIZIO STAMPA TAC--"
		putStr $ show $ Tac.createTac pParsed
		putStrLn "--FINE TAC--"
	else (writeList errList)
	where
		writeList [] = putStrLn "-- Fine --"
		writeList (x:xs) = (putStrLn x) >> (writeList xs)
{-
		writeColor x = if (take 6 x) == "[WARN]" then colorPutStrLn Yellow x 
			else putStrLn x

colorPutStrLn :: Color -> String -> IO ()
colorPutStrLn color str = do
    setSGR  [ SetColor Foreground Dull color
            , SetConsoleIntensity NormalIntensity
            ]
    putStrLn str
    setSGR []

-}

getL ((_,line, _),_) = line
getS (_,s) = s

-- error reporting
parseError (((c,l,s), Lundef):xs) = error $ "Lexical error at : "++show(l)++","++show(c)++", near: "++s
parseError (((c,l,s), _ ):xs) = error $ "Syntax error at : "++show(l)++","++show(c)++" near: "++s

inferTypeVar (Arr i t1) v = (Arr i (inferTypeVar t1 v))
inferTypeVar t v | t == Void = faux v
				
			   	 | otherwise = t
	where
		faux (Valore t _) = t

}


