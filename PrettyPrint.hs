module PrettyPrint where
import GeneralAbs
import Dati 

--------------------------------------------
  -----------  PRETTY PRINT  -----------
--------------------------------------------

prettyPrint (Pr nomePkg limp lvar lfunc) = ("package " ++ nomePkg ++ "\n" ++ (printImport limp) ++ (printVar lvar 0) ++ "\n" ++ (printFunc lfunc))

printImport [] = "\n"
printImport ((Imp nome _ ):xs) = "import \"" ++ nome ++ "\"\n" ++ (printImport xs)
 
--data Var = Var Type Id Valore Mode
--data Valore = Valore Type String
printVar [] n = ""
printVar ((Var t (Id id) (Valore _ v) _ _):xs) n
	| v == "" = (lvAnnidamento n) ++ "var " ++ id ++ " " ++ (printType t) ++ "\n" ++ (printVar xs n)
	| t == Str = (lvAnnidamento n) ++ "var " ++ id ++ " " ++ (printType t) ++ " = \"" ++ v ++ "\"\n" ++ (printVar xs n)
	| otherwise = (lvAnnidamento n) ++ "var " ++ id ++ " " ++ (printType t) ++ " = " ++ v ++ "\n" ++ (printVar xs n)


--data SFunz = SFunz Id Type [Param] [Stm]
printFunc [] = ""
printFunc ((SFunz (Id nome) t lp lstm _):xf)  = (printFunc xf) ++ "func " ++ nome ++ "(" ++ (printPar (reverse lp)) ++ ") " ++ (printType t) ++ " {\n" ++ (printListStm lstm 1) ++ "\n}\n"

--data Param = Par Id Type Mode 
--data Mode = ValMode | ConstMode | ValResMode 
printPar [] = ""
printPar [(Par (Id nome) t m)]
	| m == ValMode  = nome ++ " " ++ (printType t) ++ ""
	| m == ConstMode = nome ++ " " ++ (printType t) ++ " cnst"
	| m == ValResMode = nome ++ " " ++ (printType t) ++ " valres" 
printPar ((Par (Id nome) t m):z)
	| m == ValMode  = nome ++ " " ++ (printType t) ++ "," ++ (printPar z)
	| m == ConstMode = nome ++ " " ++ (printType t) ++ " cnst," ++ (printPar z)
	| m == ValResMode = nome ++ " " ++ (printType t) ++ " valres," ++ (printPar z)


printListStm [] n = ""
printListStm (x:xs) n = (printStm n x) ++ "\n" ++ (printListStm xs n)

--Statement

--SDic [Var]
printStm n (SDic lvar) = printVar lvar n
--NFor RExp RExp RExp [Stm] Int
printStm n (NFor exp exp2 exp3 lstm _) = (lvAnnidamento n) ++ "for " ++ (printExp exp) ++ ";" ++ (printExp exp2) ++ ";" ++ (printExp exp3) ++ "{\n" ++ (printListStm lstm (n+1)) ++ (lvAnnidamento n) ++ "}"
--While RExp [Stm] Int
printStm n (While exp lstm _ ) = (lvAnnidamento n) ++ "for " ++ (printExp exp) ++ "{\n" ++ (printListStm lstm (n+1)) ++ (lvAnnidamento n) ++"}"
--SIf  RExp [Stm] Int
printStm n (SIf  exp lstm _ ) = (lvAnnidamento n) ++ "if " ++ (printExp exp) ++ "{\n" ++ (printListStm lstm (n+1)) ++ (lvAnnidamento n) ++"}"
--SIfElse RExp [Stm] [Stm] Int
printStm n (SIfElse exp lstm1 lstm2 _ ) = (lvAnnidamento n) ++ "if " ++ (printExp exp) ++ "{\n" ++ (printListStm lstm1 (n+1))++ (lvAnnidamento n) ++ "} else {\n" ++ (printListStm lstm2 (n+1)) ++ (lvAnnidamento n) ++"}"
--SBlock [Stm]
printStm n (SBlock lstm) = (lvAnnidamento n) ++ "{\n" ++ (printListStm lstm (n+1)) ++ (lvAnnidamento n) ++ (lvAnnidamento n) ++ "}"
--SSw Id [SCase] Int
printStm n (SSw (Id id) lcase _ ) = (lvAnnidamento n) ++ "switch " ++ id ++ "{\n" ++ (printListCase lcase (n+1)) ++ (lvAnnidamento n) ++"}"
--STry [Stm] [Stm] Int
printStm n (STry lstm1 lstm2 _ ) = (lvAnnidamento n) ++ "try {\n" ++ (printListStm lstm1 (n+1)) ++ (lvAnnidamento n) ++ "} catch {" ++ (printListStm lstm2 (n+1)) ++ (lvAnnidamento n) ++"}"
--SRExp RExp Int
printStm n (SRExp r _) = (lvAnnidamento n) ++ (printExp r) 
--SRetVoid Int
printStm n (SRetVoid _) = (lvAnnidamento n) ++ "return"
--SRet RExp Int
printStm n (SRet r _) = (lvAnnidamento n) ++ "return " ++ (printExp r) 
--SContinue Int
printStm n (SContinue _) = (lvAnnidamento n) ++ "continue"
--SBreak Int 
printStm n (SBreak _) = (lvAnnidamento n) ++ "break"


--data SCase = SCase Valore [Stm] Int 
printListCase [] n = ""
--lst:[]
--printListCase (SCase (Valore v s) lst _ ) n
printListCase (x:xs) n = (printCase x n) ++ (printListCase xs n)

printCase (SCase (Valore v s) lst _) n
	| v == Void = (lvAnnidamento n) ++ "default " ++ s ++ " :" ++ (printListStm lst (n+1)) 
	| otherwise = (lvAnnidamento n) ++ "case " ++ s ++ " :" ++ (printListStm lst (n+1))
-- = (lvAnnidamento n) ++ "case " ++ s ++ " : " ++ (printListStm lst (n+1))


--RVal Valore
printExp (RVal (Valore t id)) 
	| t == Str =  "\"" ++ id ++ "\""
	| otherwise = id
--DPunt LExp
printExp (DPunt lexp) = "&" ++ (printLExp lexp)
--Assg LExp RExp Int
printExp (Assg l r _) = (printLExp l) ++ " = " ++ (printExp r)
--FCall Id [RExp] Int
printExp (FCall (Id id) lr _) = id ++ "(" ++ (printListExp (reverse lr)) ++ ")"
--LRExp LExp
printExp (LRExp l) = (printLExp l)
--RE RExp
printExp (RE r) = "(" ++ (printExp r) ++ ")"
--MathExp String RExp RExp Int
printExp (MathExp s rs rd _) =  (printExp rs) ++ " " ++ s ++ " " ++ (printExp rd)
--BoolExp String RExp RExp Int
printExp (BoolExp s rs rd _ ) =  (printExp rs) ++ " " ++ s ++ " " ++ (printExp rd)
--RelExp String RExp RExp Int
printExp (RelExp s rs rd _ ) =  (printExp rs) ++ " " ++ s ++ " " ++ (printExp rd)
--UnOp String RExp Int
printExp (UnOp s r _) = s ++ (printExp r)

printListExp [] = ""
printListExp [x] = (printExp x) 
printListExp (x:xs) = (printExp x) ++ "," ++ (printListExp xs)

{-
LID Id 
LPunt RExp 
LVett LExp RExp 
-}
printLExp (LID (Id id)) = id 
printLExp (LPunt r) = "*" ++ (printExp r)
printLExp (LVett l r) = (printLExp l) ++ "[" ++ (printExp r) ++ "]"

lvAnnidamento 0 = ""
lvAnnidamento n = "  " ++ lvAnnidamento (n-1)

--data Type = Void | Integer | Byte | Flt32 | Flt64 | Str | Bool | Ptr Type | Arr Int Type 
printType t 
	| t == Integer = "int"
 	| t == Byte = "rune"
	| t == Flt32 = "float32"
	| t == Flt64 = "float64"
	| t == Str = "string"
	| t == Bool = "bool"
	| t == Void = ""
printType (Ptr t) = "*" ++ printType t
printType (Arr i t) =  "[" ++ (show(i)) ++ "]" ++ (printType t)







