module GeneralAbs where

--Token Information: Line,Column,Lexema
--Per ogni nodo dell'albero che può essere usato per migliorare l'error reporting
--è stato aggiunto l'attributo info
type Info = (Int,Int,String) 

--Tipo di dato per salvare le dichiarazioni di variabile
--Tipo, Identificatore, Valore Inizializzazione
--Mode serve per convertire i parametri in variabili
data Var = Var Type Id Valore Mode Info deriving (Eq, Show, Ord)

--Tipi Primitivi
data Type = Void | Integer | Byte | Flt32 | Flt64 | Str | TBoolean Boolean | Ptr Type | Arr Int Type 
	deriving (Eq, Show, Ord)
data Boolean = BTrue | BFalse
	deriving (Eq, Show, Ord)

--Identificatore
data Id = Id String Info deriving (Eq, Show, Ord)
--Valore inizializzazione Variabile
data Valore = Valore Type String Info deriving (Eq, Show, Ord)

--Dichiarazione di funzioni
data SFunz = SFunz Id Type [Param] [Stm] deriving (Eq, Show, Ord)
--Parametri: Identificatore, Tipo, Modalità di passaggio
data Param = Par LExp Type Mode deriving (Eq, Show, Ord)
--Le 3 modalità classiche
data Mode = ValMode | ConstMode | ValResMode 
		deriving (Eq, Show, Ord)

--Statement
data Stm = 
	  SDic Var
	| SAssg LExp RExp Info
	| NFor RExp RExp RExp [Stm] Info
	| While RExp [Stm] Info
	| SIf  RExp [Stm] Info
	| SIfElse RExp [Stm] [Stm] Info
	| SBlock [Stm] Info -- Blocchi anonimi
	| SSw Id [SCase] Info
	| STry [Stm] [Stm] Info
	| SRExp RExp Info
	| SRet RExp Info
	| SContinue Info
	| SBreak Info
	deriving (Eq, Show, Ord)

data SCase = SCase Valore [Stm]	Info deriving (Eq, Show, Ord)

--Right Expression
data RExp = 
	  RVal Valore
	| DPunt LExp
	| FCall Id [RExp] Info
	| LRExp LExp
	| RE RExp
	| MathExp String RExp RExp Info 	-- + - * / ^
	| BoolExp String RExp RExp Info 	--And Or Xor
	| RelExp String RExp RExp Info  	-- < <= > >=
	| UnOp String RExp Info 			--Not Minus
	deriving (Eq, Show, Ord)

--Left Expression
data LExp = LID Id Info
	| LPunt RExp Info
	| LVett LExp RExp Info
	deriving (Eq, Show, Ord)

--Definisce l'envirorment usato per il type checking
type Env = ([Var],[SFunz])

data Error = Ok Type | Failed String deriving (Eq)
