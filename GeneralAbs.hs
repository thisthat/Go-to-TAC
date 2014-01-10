module GeneralAbs where

--Token Information: Line,Column,Lexema
--Per ogni nodo dell'albero che può essere usato per migliorare l'error reporting
--è stato aggiunto l'attributo info
type Info = (Int,Int,String)

--Tipo di dato per salvare le dichiarazioni di variabile
--Tipo, Identificatore, Valore Inizializzazione
--Mode serve per convertire i parametri in variabili
data Var = Var Type Id Valore Mode Int deriving (Eq, Show, Ord)

--Tipi Primitivi
data Type = Void | Integer | Byte | Flt32 | Flt64 | Str | Bool | Ptr Type | Arr Int Type 
	deriving (Eq, Show, Ord)

--Identificatore
data Id = Id String  deriving (Eq, Show, Ord)
--Valore inizializzazione Variabile
data Valore = Valore Type String deriving (Eq, Show, Ord)

--Dichiarazione di funzioni
data SFunz = SFunz Id Type [Param] [Stm] Int deriving (Eq, Show, Ord)
--Parametri: Identificatore, Tipo, Modalità di passaggio
data Param = Par Id Type Mode deriving (Eq, Show, Ord)
--Le 3 modalità classiche
data Mode = ValMode | ConstMode | ValResMode 
		deriving (Eq, Show, Ord)

--Statement
data Stm = 
	  SDic [Var]
	| NFor RExp RExp RExp [Stm] Int
	| While RExp [Stm] Int
	| SIf  RExp [Stm] Int
	| SIfElse RExp [Stm] [Stm] Int
	| SBlock [Stm]  -- Blocchi anonimi
	| SSw Id [SCase] Int
	| STry [Stm] [Stm] Int
	| SRExp RExp Int
	| SRetVoid Int
	| SRet RExp Int
	| SContinue Int
	| SBreak Int
	deriving (Eq, Show, Ord)

data SCase = SCase Valore [Stm]	Int deriving (Eq, Show, Ord)

--Right Expression
data RExp = 
	  RVal Valore
	| DPunt LExp
	| Assg LExp RExp Int
	| FCall Id [RExp] Int
	| LRExp LExp
	| RE RExp
	| MathExp String RExp RExp Int 	-- + - * / ^
	| BoolExp String RExp RExp Int	--And Or Xor
	| RelExp String RExp RExp Int 	-- < <= > >=
	| UnOp String RExp Int			--Not Minus
	deriving (Eq, Show, Ord)

--Left Expression
data LExp = LID Id 
	| LPunt RExp 
	| LVett LExp RExp 
	deriving (Eq, Show, Ord)

--Definisce l'envirorment usato per il type checking
data Env = Env [Var] [SFunz] Env | EmptyEnv deriving (Eq,Show)

data Error a = Ok a | Failed String deriving (Eq, Show)
