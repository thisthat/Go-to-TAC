{
module Main where

import Dati
import Lexer
import GeneralAbs

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


OPEQ			{(a, OpEq $$)}
OPDISEQ			{(a, OpDiseq $$)}
AND				{(a, And)}
OR				{(a, Or)}
XOR				{(a, Xor)}
NOT				{(a, Not)}

DEPUNT 			{(a, DePunt)}

-- Precedenze per disambiguare la grammatica
%nonassoc UGUALE
%left OR
%left AND
%left OPEQ
%left OPDISEQ
%left PLUS 
%left MINUS
%left AST
%left DIV
%left POW
%left NOT
%%

-- Definizione della grammatica

Program: PACKAGE IDENT END ImportList GVar Funz {   }
   	
ImportList 	: {-empty-}	{  }
	    	| IMPORT STRINGA END ImportList   {   }
			| IMPORT OPENR END Imp CLOSER END {   }

Imp	: STRINGA END Imp2		{   }

Imp2 : {-empty-}			{   }
	 | STRINGA END Imp2 	{  }

OptEnd: {-empty-}  	{ }
      | OptEnd END 		{ }

GVar : {-empty-} 	{  }
     | VAR IDENT Tipo END GVar							{   }
     | VAR IDENT Tipo UGUALE Valori END GVar 			{   }
     | VAR OPENR END VarLine CLOSER END GVar	{   }

VarLine : {-empty-} {  }
		| IDENT Tipo UGUALE Valori END VarLine  {   }
		| IDENT Tipo END VarLine				{   }

Valori 	: INTERO	{  }
		| FLOAT		{  }
		| BOOLEANO	{  }
		| STRINGA	{ }
		| CHAR		{  }

Tipo : {-empty-}	{  }
	 | RUNE			{  }
	 | BOOL			{  }
	 | STR			{  }
	 | INT			{  }
	 | AST Tipo		{  }
	 | FLOAT32		{  }
	 | FLOAT64		{  }
	 | OPENQ INTERO CLOSEQ Tipo {  }


Funz : {-empty-} {  }
     | Funz FUNC IDENT OPENR ParList CLOSER Tipo Blocco OptEnd {   }

ParList: {-empty-}     		{ } 
       | ParListNE     		{   }

ParListNE : IDENT Tipo Modo 		 {    }
		  | ParListNE COMMA IDENT Tipo Modo   {   }
 
          
Modo : VALRES 	{  }
     | CNST		{  }
     | {-empty-} 	{  }
     | VAL 			{  }
        

Blocco : OPENG END GVar Lstm OptEnd CLOSEG END 	{   }
BloccoNE : OPENG END GVar Lstm OptEnd CLOSEG   	{   }
BloccoSw : OPENG END Lcase CLOSEG END 		   	{   }

Lstm : {-empty-} {  }
     |  Stm Lstm {  }

Stm : FOR RE SEMICOL RE SEMICOL RE Blocco {    }         
	| FOR RE Blocco 	{   }
	| FOR Blocco		{   }
	| IF RE Blocco		{   }
	| IF RE BloccoNE ELSE Blocco {   }
    | SWITCH IDENT BloccoSw {   }
	| Blocco {  }
	| TRY BloccoNE CATCH Blocco {   }
	| RE END {  }
	| RETURN END    {  }
	| RETURN RE END {   }
	

Lcase : {-empty-} {  }
	  | CASE Valori COL Lstm OptEnd Lcase {   }
	  | DEFAULT COL Lstm OptEnd {    }


RE  : RE PLUS RE	{  }
	| RE MINUS RE	{  }
	| RE OPEQ RE	{  }
	| RE OPDISEQ RE	{  }
	| RE OR RE		{  }
	| RE AND RE		{  }
	| RE AST RE		{  }
	| RE DIV RE		{  }
	| RE POW RE			{  }
	| OPENR RE CLOSER	{  }
	| MINUS RE			{  }
	| NOT RE			{  }
	| LE				{  }
	| IDENT OPENR ListParAtt CLOSER 	{    }
	| DEPUNT IDENT		{   }
	| Valori	{ }
	| LE UGUALE RE	{   }

ListParAtt: {-empty-}     		{  } 
       	  | ListParAttNE     	{    }

ListParAttNE : RE 				 	 {   }
          	 | ListParAttNE COMMA RE {  }


LE 	: IDENT 					{   }
	| AST IDENT					{   }
	| IDENT OPENQ RE CLOSEQ		{   }

{ 

main = do
        inStr <- getContents
        let pParsed = parseProgram (alexScanTokens inStr)
	putStr $ show pParsed
	--putStr $ show (alexScanTokens inStr)
	--putStr $ check(pParsed) ++ "__________\n" ++ (prettyPrint pParsed)

--parseError _ = error "Parse error!"

-- errore per gestire caratteri non definiti
parseError (((c,l,s), Lundef):xs) = error $ "Lexical error at : "++show(l)++","++show(c)++", near: "++s
parseError (((c,l,s), _ ):xs) = error $ "Syntax error at : "++show(l)++","++show(c)++" near: "++s

--------------------------------------------
  -----------  PRETTY PRINT  -----------
--------------------------------------------
{--
prettyPrint (Pr (PRI nomePkg) limp lvar lfunc) = ("package " ++ nomePkg ++ "\n" ++ (printImport limp) ++ (printVar lvar 0) ++ (printFunc lfunc))

printImport [] = "\n"
printImport ((Imp nome):xs) = "import \"" ++ nome ++ "\"\n" ++ (printImport xs)
 
printVar [] n = ""
printVar ((Var t (Id id) (Valore _ v) _):xs) n
	| v == "" = (lvAnnidamento n) ++ "var " ++ id ++ " " ++ (printType t) ++ "\n" ++ (printVar xs n)
	| t == Str = (lvAnnidamento n) ++ "var " ++ id ++ " " ++ (printType t) ++ " = \"" ++ v ++ "\"\n" ++ (printVar xs n)
	| otherwise = (lvAnnidamento n) ++ "var " ++ id ++ " " ++ (printType t) ++ " = " ++ v ++ "\n" ++ (printVar xs n)

printFunc [] = ""
printFunc ((SFunz (Id nome) t lp b ret):xf)  = (printFunc xf) ++ "func " ++ nome ++ "(" ++ (printPar (reverse lp)) ++ ") " ++ (printType t) ++ " " ++ (printBloccoF b ret 1)

printPar [] = ""
printPar [(Par (Id nome) t m)]
	| m == ValMode  = nome ++ " " ++ (printType t) ++ ""
	| m == ConstMode = nome ++ " " ++ (printType t) ++ " cnst"
	| m == ValResMode = nome ++ " " ++ (printType t) ++ " valres" 
printPar ((Par (Id nome) t m):z)
	| m == ValMode  = nome ++ " " ++ (printType t) ++ "," ++ (printPar z)
	| m == ConstMode = nome ++ " " ++ (printType t) ++ " cnst," ++ (printPar z)
	| m == ValResMode = nome ++ " " ++ (printType t) ++ " valres," ++ (printPar z)

printBlocco (Block lv ls) n = "{\n" ++ (printVar lv (n+1)) ++ "\n" ++ (printListStm ls (n+1)) ++ (lvAnnidamento (n-1)) ++ "}\n"
printBloccoF (Block lv ls) ret n = "{\n" ++ (printVar lv (n+1)) ++ "\n" ++ (printListStm ls (n+1)) ++ "\n" ++ (lvAnnidamento n) ++ "return " ++ (printExp ret) ++ (lvAnnidamento (n-1)) ++ "\n}\n"
printBloccoNe (Block lv ls) n = "{\n" ++ (printVar lv (n+1)) ++ "\n" ++ (printListStm ls (n+1) ) ++ (lvAnnidamento (n-1)) ++ "}"

printListStm [] n = ""
printListStm (x:xs) n = (printStm n x) ++ "\n" ++ (printListStm xs n)

printStm n (NFor exp exp2 exp3 b ) = (lvAnnidamento n) ++ "for " ++ (printExp exp) ++ ";" ++ (printExp exp2) ++ ";" ++ (printExp exp3) ++ (printBlocco b (n+1))
printStm n (WFor exp b ) = (lvAnnidamento n) ++ "for " ++ (printExp exp) ++ (printBlocco b (n+1)) ++ "\n"
printStm n (SIf  exp b ) = (lvAnnidamento n) ++ "if " ++ (printExp exp) ++ (printBlocco b (n+1)) ++ "\n"
printStm n (SIfElse exp b b2 ) = (lvAnnidamento n) ++ "if " ++ (printExp exp) ++ (printBloccoNe b (n+1)) ++ " else " ++ (printBlocco b2 (n+1))
printStm n (SBlock b ) = (lvAnnidamento n) ++ (printBlocco b (n+1))
printStm n (SSw (Id id) lcase ) = (lvAnnidamento n) ++ "switch " ++ id ++ "{\n" ++ (printListCase lcase (n+1))
printStm n (STry b b2) = (lvAnnidamento n) ++ "try " ++ (printBloccoNe b (n+1)) ++ " catch " ++ (printBlocco b2 (n+1))
printStm n (SRE r) = (lvAnnidamento n) ++ (printExp r) ++ "\n"

printListCase [] n = ""
printListCase (SCase (Valore v s) lst:[]) n
	| v == Void = (lvAnnidamento n) ++ "default " ++ s ++ " : " ++ (printListStm lst (n+1))
	| otherwise = (lvAnnidamento n) ++ "case " ++ s ++ " : " ++ (printListStm lst (n+1))
printListCase (x:xs) n = (printCase x n) ++ "\n" ++ (printListCase xs n)
printCase (SCase (Valore _ s) lst) n = (lvAnnidamento n) ++ "case " ++ s ++ " : " ++ (printListStm lst (n+1))

printExp (RAsseg l r) = (printLExp l) ++ " = " ++ (printExp r)
printExp (RVal (Valore t id)) 
	| t == Str =  "\"" ++ id ++ "\""
	| otherwise = id
printExp (DPunt (Id id)) = "&" ++ id 
printExp (FCall (Id id) lr) = id ++ "(" ++ (printListExp (reverse lr)) ++ ")"
printExp (LRExp l) = (printLExp l)
printExp (RE r) = "(" ++ (printExp r) ++ ")"
printExp (MathExp s rs rd) =  (printExp rs) ++ " " ++ s ++ " " ++ (printExp rd)
printExp (BoolExp s rs rd) =  (printExp rs) ++ " " ++ s ++ " " ++ (printExp rd)
printExp (UnOp s r) = s ++ " " ++ (printExp r)


printExpPar (RE r) = (printExp r)

printListExp [] = ""
printListExp [x] = (printExpPar x) 
printListExp (x:xs) = (printExpPar x) ++ "," ++ (printListExp xs)

printLExp (LID (Id id)) = id 
printLExp (LPunt (Id id)) = "*" ++ id 
printLExp (LVett (Id id) r) = id ++ "[" ++ (printExp r) ++ "]"

lvAnnidamento 0 = ""
lvAnnidamento n = "  " ++ lvAnnidamento (n-1)

printType t 
	| t == Integer = "int"
	| t == Rune = "rune"
 	| t == Byte = "byte"
	| t == Flt32 = "float32"
	| t == Flt64 = "float64"
	| t == Str = "string"
	| t == Boolean = "bool"
	| t == Void = ""
printType (Ptr t) = "*" ++ printType t
printType (Arr i t) =  "[" ++ (show(i)) ++ "]" ++ (printType t)

--------------------------------------------
  -----------  TYPE CHECKING  -----------
--------------------------------------------


--Funzione che presa una lista di variabili ed un envirorment restituisce l'envirorment aggiornanto
--le variabili vengono inserite solo se non sono già presenti, altrimenti restituisce un errore
insertEnvVar va (lv,lf) 
	| (presentInEnvV va (lv,lf)) == True = error("Ridichiarazione non possibile per " ++ (extractNameVar va))
	| otherwise =  (va:lv,lf) 
--Come per le varibili, ora inserisce una funzione nell'envirorment
insertEnvFunz fa (lv,lf) = (lv, fa:lf) 

--Le seguenti due funzioni,dato un identificiativo restituiscono vero se una variabile/funzione è presente nell'envirorment, falso altrimenti
presentInEnvF f@(SFunz (Id id) _ _ _ _) (listV , []) = False
presentInEnvF f@(SFunz (Id id) _ _ _ _) (listV, lf@(x@(SFunz (Id fid) _ _ _ _):xs))
	| fid == id = True
	| otherwise = presentInEnvF f (listV, xs ) 

presentInEnvV v (lv,lf) = presentInEnvVar v (lv,lf)
	where
		presentInEnvVar v@(Var _ (Id id) _ _ ) ([],listF) = False
		presentInEnvVar v@(Var _ (Id id) _ _ ) (lv@(x@(Var _ (Id vid) _ _ ):xs), listF )
			| vid == id = True
			| otherwise = presentInEnvV v (xs,listF)

--Le seguenti due funzioni, dato un identificativo restituiscono la variabile/funzione con quell'id
getFunctionFromEnv (Id id1) (lv,lf) = aux id1 lf
	where
		aux id [] = error("Impossibile trovare la definizione di " ++ id)
	 	aux id (x:xs) 
			| (extId x) == id = x
			| otherwise = aux id xs
		extId (SFunz (Id id) _ _ _ _ ) = id 

getVarFromEnv (Id id1) (lv,lf) = aux id1 lv
	where
		aux id [] = error("Impossibile trovare la definizione di " ++ id)
	 	aux id (x:xs) 
			| (extId x) == id = x
			| otherwise = aux id xs
		extId (Var _ (Id id) _ _) = id

--Funzione che rimuove una variabile dall'envirorment dato l'identificativo della variabile
removeVarFromEnv (Var _ (Id id) _ _ ) (lv,lf) = ((auxRemVar id lv),lf)
	where 
		auxRemVar id [] = []
		auxRemVar id (x@(Var _ (Id vid) _ _ ):xs) 
			| vid == id = auxRemVar id xs
			| otherwise =  x : (auxRemVar id xs)

-- Funzione di partenza per il Type Checking
-- Controlla prima la sequenza degli import e,se tale controllo va a buon fine, verranno controllate le funzioni creando l'envirorment di partenza.
-- In tale envirorment vi si inseriscono le evventuali variabili globali e le funzioni e le funzioni predefinite
check (Pr ident lImp lVar lFunz) 
	| (checkImport lImp) && (checkFunzioni lFunz  (insertGVar lVar ([],[SFunz (Id "writeInt") Void [Par (Id "x") Integer ValMode] (Block [] []) (RVal (Valore Void "")),SFunz (Id "writeRune") Void [Par (Id "x") Rune ValMode] (Block [] []) (RVal (Valore Void "")),SFunz (Id "writeFloat") Void [Par (Id "x") Flt64 ValMode] (Block [] []) (RVal (Valore Void "")),SFunz (Id "writeString") Void [Par (Id "x") Str ValMode] (Block [] []) (RVal (Valore Void "")),SFunz (Id "readInt") Integer [Par (Id "x") Integer ValMode] (Block [] []) (RVal (Valore Integer "")),SFunz (Id "readRune") Rune [Par (Id "x") Rune ValMode] (Block [] []) (RVal (Valore Rune "")),SFunz (Id "readFloat") Flt32 [Par (Id "x") Flt64 ValMode] (Block [] []) (RVal (Valore Flt64 "")),SFunz (Id "readString") Str [Par (Id "x") Str ValMode] (Block [] []) (RVal (Valore Str ""))]))) = "TypeChecking Finito\n"
	| otherwise = error("Errore sconosciuto")

-- controlla che nella lista degli import, un modulo non sia importato più volte
checkImport [] = True
checkImport (x:xs) 
	| (pass x xs) = checkImport xs
	| otherwise = error("Import: " ++ (extractNameImport x) ++ " non può essere incluso due volte")
	where
		pass x [] = True
		pass x (y:xs) 
			| x == y = False
			| otherwise = pass x xs

-- Controllo che in una lista di variabili, non ci siano due variabili con lo stesso identificatore
controlloDuplicatoVariabiliList [] = True
controlloDuplicatoVariabiliList (x:xs) 
	| (pass x xs) = controlloDuplicatoVariabiliList xs
	| otherwise = error("Variabile: " ++ (extractNameVar x) ++ " non può essere dichiarato due volte")
	where
		pass x [] = True
		pass x (y:xs) 
			| x == y = False
			| otherwise = pass x xs

-- Controllo che in una lista di funzioni, non ci siano due funzioni con lo stesso identificatore
controlloDuplicatoFunzioniList [] = True
controlloDuplicatoFunzioniList (x:xs) 
	| (pass x xs) = controlloDuplicatoFunzioniList xs
	| otherwise = error("Funzione: " ++ (extractNameFunz x) ++ " non può essere dichiarato due volte")
	where
		pass x [] = True
		pass x (y:xs) 
			| x == y = False
			| otherwise = pass x xs


-- Data una lista di variabili, le inserisce nell'envirorment
insertGVar [] env = env
insertGVar (x:xs) env = (insertGVar xs (insertEnvVar x env))


--questa funzione prende la lista delle dichiarazioni di funzione e va a controllare per ogni una il relativo corpo
--se la funzione non è già stata definita,estende l'envirorment inserendo la sua signature
checkFunzioni [] env = True
checkFunzioni (f:xf) env
	| controlloDuplicatoFunzioni (insertEnvFunz f env) = ((checkFunzioni xf (insertEnvFunz f env)) && (controllaF f (insertEnvFunz f env)))


controlloDuplicatoVariabili (lv,lf) = controlloDuplicatoVariabiliList lv
controlloDuplicatoFunzioni (lv,lf) = controlloDuplicatoFunzioniList lf

--Controlla il blocco della funzione passando un envirorment esteso con la definizione dei suoi parametri formali
controllaF f@(SFunz id t p b expRet ) env = checkBlockFunz f b (createEnvFromParametri p) env

createEnvFromParametri [] = ([],[])
createEnvFromParametri ((Par id t m):xs) = ((Var t id (Valore t "") m ) : (fst (createEnvFromParametri xs)), [] )

--estende l'envirorment attuale con le nuove definizioni di variabili interne al blocco ed avvia il controllo del codice interno al blocco
checkBlock b@(Block v s) env_new env_old = controlliBloccoFunz b (envUnion (insertGVar v env_new) env_old)

checkBlockFunz f b@(Block v s) env_new env_old = let env =  (envUnion (insertGVar v env_new) env_old) in (checkFunctionReturn f env)  && (controlliBloccoFunz b env)
checkFunctionReturn (SFunz (Id id) t p b expRet ) env 
	| (t == Void) && ((checkExpType expRet env) == Void) = True
	| t == (checkExpType expRet env) = True
	| otherwise = error("Atteso : " ++ show(t) ++ " invece arrivato tipo " ++ show(checkExpType expRet env)  ++ " nella funzione " ++ id)
--Funzione che dati due envirorment, restituisce la loro unione, in caso di clash di nomi mantiene la dichiarazione più recente
envUnion env_n env_o = (unisciListeVar env_o env_n)
unisciListeVar ([],lf) ([],_) = ([],lf)
unisciListeVar ([],lf) (l2,_) = (l2,lf)
unisciListeVar (l1,lf) ([],_) = (l1,lf)
unisciListeVar (l1,lf) ((x:xs),_) 
	| presentInEnvV x (l1,lf) = unisciListeVar (insertEnvVar x (removeVarFromEnv x (l1,lf))) (xs,[])
	| otherwise = unisciListeVar (insertEnvVar x (l1,lf)) (xs,[])

--Controllo degli statement di una funzione
controlliBloccoFunz (Block var stm) env = (controlliListStm stm env)
--Controllo per un blocco anonimo, estendendo l'envirorment con le nuove dichiarazioni
controlliBlocco (Block var stm) env = (controlliListStm stm (insertGVar var env))

controlliListStm [] env = True
controlliListStm (s:xs) env =  (controlliStm s env) && (controlliListStm xs env) 

--Per i vari cotrutti del linguaggio ci sono i relativi controlli 
controlliStm (NFor exp exp2 exp3 b) env 
	| not ((checkExpType exp2 env) == Boolean) = error("La guardia del for deve essere di tipo bool")
	| not ((getTipologiaExp exp) == "Assegnamento") = error("L'inizializzazione del for deve essere un'assegnazione")
	| otherwise = controlliBlocco b env

controlliStm (WFor exp b) env 
	| not ((checkExpType exp env) == Boolean) = error("La guardia del for (while) deve essere di tipo bool")
	| otherwise = controlliBlocco b env

controlliStm (SIf exp b) env 
	| not ( (checkExpType exp env) == Boolean) = error("La guardia dell'if deve essere di tipo bool")
	| otherwise = controlliBlocco b env

controlliStm (SIfElse exp b1 b2) env 
	| not ((checkExpType exp env) == Boolean) = error("La guardia dell'if deve essere di tipo bool")
	| otherwise = (controlliBlocco b2 env) && (controlliBlocco b1 env)

controlliStm (SBlock b) env = controlliBlocco b env
controlliStm (SSw id lCase) env = controlloSwitch lCase env
controlliStm (STry b1 b2) env = (controlliBlocco b2 env) && (controlliBlocco b1 env)
controlliStm (SRE exp ) env = checkExp exp env

controlloSwitch [] env = True
controlloSwitch ((SCase _ lstm):xs) env = (controlliListStm lstm env) && (controlloSwitch xs env)

--Dati in input un envirorment ed una espressione, viene controllata l'espressione
--Visto che la funzione checkExpType esegue controlli sul tipo di dato dell'espressione in modo che sia coerente con il
-- nostro type system , per rendere la funzione checkExp booleana si esegue un controllo di presenza del tipo restituito da checkExpType
-- nella lista di tipi
checkExp r env = elem (checkExpType r env) [Void, Integer , Rune , Byte , Flt32 , Flt64 , Str , Boolean ]

--Viene restituito la tipologia del comando per un migliore error reporting
getTipologiaExp( RAsseg _ _ ) = "Assegnamento"
getTipologiaExp( RVal _  ) = "Valore"
getTipologiaExp( DPunt _ ) = "Puntatore"
getTipologiaExp( FCall _ _ ) = "Funzione"
getTipologiaExp( RE _  ) = "Espressione"
getTipologiaExp( MathExp _ _ _ ) = "Matematica"
getTipologiaExp( BoolExp _ _ _) = "Booleana"
getTipologiaExp( UnOp _ _ ) = "OpUnaria"


--Per ogni tipologia di espressione restituisce il tipo calcolato nell'envirorment attuale procedendo ricorsivamente nelle sotto espressioni
--Esegue anche controlli sulla coerenza dei tipi delle sottoespressioni in modo che rispettino il nostro type system, in caso contrario fornisce un errore
checkExpType (RE l) env = checkExpType l env
checkExpType (RVal z) env = (extractTypeVal z)
checkExpType (MathExp op rsx rdx) env
	| (checkExpType rsx env) == Str || (checkExpType rdx env) == Str = error("Impossibile usare un operatore aritmetico su stringhe")
	| (checkExpType rsx env) == Boolean || (checkExpType rdx env) == Boolean = error("Impossibile usare un operatore aritmetico su booleani")
	| (checkExpType rsx env) == Integer && (checkExpType rdx env) == Rune = Integer
	| (checkExpType rsx env) == Rune && (checkExpType rdx env) == Integer = Integer
	| (checkExpType rsx env) == Integer && (checkExpType rdx env) == Byte = Integer
	| (checkExpType rsx env) == Byte && (checkExpType rdx env) == Integer = Integer
	| (checkExpType rsx env) == Integer && (checkExpType rdx env) == Integer = Integer
	| (checkExpType rsx env) == Integer && (checkExpType rdx env) == Flt32 = Flt32
	| (checkExpType rsx env) == Flt32 && (checkExpType rdx env) == Integer = Flt32
	| (checkExpType rsx env) == Integer && (checkExpType rdx env) == Flt64 = Flt64
	| (checkExpType rsx env) == Flt64 && (checkExpType rdx env) == Integer = Flt64
	| (checkExpType rsx env) == Rune && (checkExpType rdx env) == Rune = Rune
	| (checkExpType rsx env) == Rune && (checkExpType rdx env) == Byte = Rune
	| (checkExpType rsx env) == Byte && (checkExpType rdx env) == Rune = Rune
	| (checkExpType rsx env) == Rune && (checkExpType rdx env) == Flt32 = Flt32
	| (checkExpType rsx env) == Flt32 && (checkExpType rdx env) == Rune = Flt32
	| (checkExpType rsx env) == Rune && (checkExpType rdx env) == Flt64 = Flt64
	| (checkExpType rsx env) == Flt64 && (checkExpType rdx env) == Rune = Flt64
	| (checkExpType rsx env) == Flt32 && (checkExpType rdx env) == Flt64 = Flt64
	| (checkExpType rsx env) == Flt64 && (checkExpType rdx env) == Flt32 = Flt64
checkExpType (BoolExp op rsx rdx) env = Boolean 
checkExpType (UnOp op exp)  env
	| let t = (checkExpType exp env) , op == "-" && elem t [Integer,Rune,Byte,Flt32,Flt64] = t
	| op == "!" && (checkExpType exp env) == Boolean = Boolean
	| otherwise = error("Impossibile usare l'operatore " ++ op ++ " con il tipo: " ++ show(checkExpType exp env))
checkExpType (RAsseg left right) env 
	| s == Integer && d == Integer = Integer
	| s == Integer && d == Rune = Integer
	| s == Integer && d == Byte = Integer
	| s == Integer && d == Flt32 = error("Impossibile assegnare ad Int il tipo Float32")
	| s == Integer && d == Flt64 = error("Impossibile assegnare ad Int il tipo Float64")
	| s == Integer && d == Boolean = error("Impossibile assegnare ad Int il tipo Bool")
	| s == Integer && d == Str = error("Impossibile assegnare ad Int il tipo String")
	| s == Rune && d == Integer = Rune
	| s == Rune && d == Rune = Rune
	| s == Rune && d == Byte = Rune
	| s == Rune && d == Flt32 = error("Impossibile assegnare Float32 al tipo Rune")
	| s == Rune && d == Flt64 = error("Impossibile assegnare Float32 al tipo Rune")
	| s == Rune && d == Boolean = error("Impossibile assegnare Bool al tipo Rune")
	| s == Rune && d == Str = error("Impossibilr assegnare String al tipo Rune")
	| s == Byte && d == Integer = error("Impossibile assegnare a Byte il tipo Int")
	| s == Byte && d == Rune = error("Impossibile assegnare a Byte il tipo Rune")
	| s == Byte && d == Byte = Byte
	| s == Byte && d == Flt32 = error("Impossibile assegnare a Byte il tipo Float32")
	| s == Byte && d == Flt64 = error("Impossibile assegnare a Byte il tipo Float64")
	| s == Byte && d == Str = error("Impossibile assegnare a Byte il tipo String")
	| s == Byte && d == Boolean = error("Impossibile assegnare a Byte il tipo Bool")
	| s == Flt32 && d == Integer = Flt32
	| s == Flt32 && d == Rune = Flt32
	| s == Flt32 && d == Byte = Flt32
	| s == Flt32 && d == Flt32 = Flt32
	| s == Flt32 && d == Flt64 = error("Impossibile assegnare a Float32 il tipo Float64")
	| s == Flt32 && d == Str = error("Impossibile assegnare a Float32 il tipo String")
	| s == Flt32 && d == Boolean = error("Impossibile assegnare a Float32 il tipo Bool")
	| s == Flt64 && d == Integer = Flt64
	| s == Flt64 && d == Rune = Flt64
	| s == Flt64 && d == Byte = Flt64
	| s == Flt64 && d == Flt32 = Flt64
	| s == Flt64 && d == Flt64 = Flt64
	| s == Flt64 && d == Str = error("Impossibile assegnare a Float64 il tipo String")
	| s == Flt64 && d == Boolean = error("Impossibile assegnare a Float64 il tipo Bool")
	| s == Str && elem d [Integer,Rune,Byte,Flt32,Flt64,Str,Boolean] = Str
	| s == Boolean && d == Boolean = Boolean
	| s == Boolean && elem d [Integer,Rune,Byte,Flt32,Flt64,Str] = error("Impossibile assegnare a Bool il tipo " ++ show(d))	
	| otherwise = Rune
	where
		s = checkExpTypeL left env
		d = checkExpType right env
checkExpType (LRExp l) env = checkExpTypeL l env
checkExpType (FCall id lp) env = let f = (getFunctionFromEnv id env) in (controllaFunzione f lp env)
checkExpType (DPunt p) env = getPtrType (extractTypeVar (getPunType p env))
	where 
		getPtrType (Ptr t) = t

--Dato un puntatore ed un envirorment restituisce il tipo del puntatore
getPunType id env = (getVarFromEnv id env)

--viene effettuato un controllo sulla chiamata di funzione
--trasforma la lista dei parametri attuali in una lista contenente i loro tipi risolti mediante checkExpType
--viene eseguito anche il controllo di corrispondenza di numero e compatibilità tra tipi dei parametri attuali/formali
--e il controllo di correttezza sul parametro attuale se quello formale è di tipo valure-result
controllaFunzione (SFunz (Id id) t lpf _ _ ) lpa env 
	| (checkParValRes lpf lpa env id) && (checkParList lpf (convertParList lpa env) id) = t

checkParValRes [] [] env id = True
checkParValRes (x:xs) [] env id = error("Numero di tipi Incompatibile per la funzione " ++ id)
checkParValRes [] (x:xs) env id = error("Numero di tipi Incompatibile per la funzione " ++ id)
checkParValRes (x@(Par (Id idP) t m):xs) (y:ys) env id 
	| (m == ValResMode) && (not (isVarExp y )) = error("Non si è passato un tipo corretto al parametro " ++ idP ++ " dichiarato come valres in " ++ id)
	| otherwise = checkParValRes xs ys env id


isVarExpT y = error(show(y))
isVarExp (RE (LRExp (LID i))) = True 
isVarExp (RE (LRExp(LVett id v))) = True 
isVarExp (RE (DPunt id)) = True 
isVarExp (RE a) = False



convertParList [] env = []
convertParList (pa:lpa) env = (checkExpType pa env) : (convertParList lpa env)

checkParList [] [] id = True
checkParList (pf:xs) (y:ys) id
	| x == y = checkParList xs ys id
	| x == Integer && elem y [Rune,Byte] = checkParList xs ys id
	| x == Rune && elem y [Integer,Byte] = checkParList xs ys id
	| x == Flt32 && elem y [Integer,Rune,Byte] = checkParList xs ys id
	| x == Flt64 && elem y [Integer,Rune,Byte,Flt32] = checkParList xs ys id
	| otherwise = error("Tipo " ++ show(x) ++ " non compatibile con il tipo " ++ show(y) ++ " nella chiamata di funzione " ++ id)
	where
		x = extractTypeParFunz pf

--Funzioni ausiliarie
extractTypeVal (Valore t _) = t
extractTypeParFunz (Par _ t _) = t
extractNameVar (Var _ (Id id)  _ _) = id
extractTypeVar (Var t _ _ _) = t
extractNameId (Id x) = x
extractTypeVarFromEnv v@(Id x) env = extractTypeVar (getVarFromEnv v env)
extractNameImport (Imp path ) = path
extractNameFunz (SFunz (Id fid) _ _ _ _) = fid

--Funzione che esegue il controllo delle left-expressions nell'envirorment attuale
--restituendo il tipo di dato dell'espressione o un errore in caso di mancata dichiarazione della variabile
--o quando un parametro passato per costante è oggetto di modifiche
checkExpTypeL (LID l) env 
	| (presentInEnvV (Var Void l (Valore Void "") ValMode ) env) && (controlloModoAssegnamento (getVarFromEnv l env)) =  (extractTypeVarFromEnv l env)
	| otherwise = error("Uso di " ++ (extractNameId l)  ++ " impossibile perchè non definito")
checkExpTypeL (LPunt l) env 
	| (presentInEnvV (Var Void l (Valore Void "") ValMode ) env) && (controlloModoAssegnamento (getVarFromEnv l env)) =  (extractTypeVarFromEnv l env) 
	| otherwise = error("Uso di " ++ (extractNameId l)  ++ " impossibile perchè non definito")
checkExpTypeL (LVett id rexp) env 
	| (elem (checkExpType rexp env) [Integer, Rune, Byte]) && (presentInEnvV (Var Void id (Valore Void "") ValMode ) env) && (controlloModoAssegnamento (getVarFromEnv id env)) =  (extractTypeVarFromEnv id env)
	| (elem (checkExpType rexp env) [Integer, Rune, Byte]) == False = error("Indice del vettore " ++ (extractNameId id) ++ " non è un tipo valido")
	| otherwise = error("Uso del vettore " ++ (extractNameId id) ++ " prima della sua dichiarazione")
	
controlloModoAssegnamento (Var _ (Id n) _ m) 
	| m == ConstMode = error("Impossibile usare " ++ n ++ " in quanto passato per costante")
	| otherwise = True

--}

}


