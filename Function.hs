module Function where
import GeneralAbs
import Dati

-----------------------
---	ENV FUNCTION	---
-----------------------

newEnvirorment oldEnv = (Env [] [] oldEnv)

--Var
--Si assume che la variabile Esista
getVarEnv i@(Id id) (Env [] _ oldEnv) = getVarEnv i oldEnv
getVarEnv i@(Id id) (Env (v@(Var _ (Id nome) _ _ _):vs) f e) 
	| id == nome = v
	| otherwise = getVarEnv i (Env vs f e)

--Boolean
--Ci dice se una var esiste nell'envirorment
existsVarEnv (Id id) EmptyEnv = False
existsVarEnv i@(Id id) (Env [] _ oldEnv) = existsVarEnv i oldEnv
existsVarEnv i@(Id id) (Env ((Var _ (Id nome) _ _ _ ):vs) f e) 
	| id == nome = True
	| otherwise = existsVarEnv i (Env vs f e)

--Boolean
--Ci dice se una var esiste nell'envirorment più alto
existsVarEnvTop (Id id) EmptyEnv = False
existsVarEnvTop i@(Id id) (Env [] _ oldEnv) = False
existsVarEnvTop i@(Id id) (Env ((Var _ (Id nome) _ _ _ ):vs) f e) 
	| id == nome = True
	| otherwise = existsVarEnvTop i (Env vs f e)


--SFun
--Si assume che la funzione Esista
getFunEnv i@(Id id) (Env _ [] oldEnv) = getFunEnv i oldEnv
getFunEnv i@(Id id) (Env v (f@(SFunz (Id nome) _ _ _ _):fs) e) 
	| id == nome = f
	| otherwise = getFunEnv i (Env v fs e)

--Boolean
--Ci dice se una funzione esiste nell'envirorment
existsFunEnv (Id id) EmptyEnv = False
existsFunEnv i@(Id id) (Env _ [] oldEnv) = existsFunEnv i oldEnv
existsFunEnv i@(Id id) (Env v (f@(SFunz (Id nome) _ _ _ _):fs) e)  
	| id == nome = True
	| otherwise = existsFunEnv i (Env v fs e)

--Env
--Si assume che la variabile non sia già presente nell'env
insertVarEnv v (Env vs f oldEnv) = (Env (v:vs) f oldEnv)

--Env
--Si assume che la funzione non sia già presente nell'env
insertFunEnv f (Env v fs oldEnv) = (Env v (f:fs) oldEnv)

--Env
--Si aggiungono i parametri creando variabili
createEnvParam listParam (Env vs fs oldEnv) = (Env lvar fs oldEnv)
	where
		lvar = aux vs listParam
		aux vs [] = vs
		aux vs ((Par i t m):ps) = (Var t i (Valore t "") m 0) : (aux vs ps)


--FUNZIONI TOOL
getNameFromId (Id id) = id

getFunId (SFunz i _ _ _ _) = i
getLineFun (SFunz _ _ _ _ line) = line
getTypeFun (SFunz _ t _ _ _ ) = getBaseType t
getListParam id env = aux $ getFunEnv id env
	where
		aux (SFunz _ _ lp _ _) = lp
getNumParam i@(Id id) env = length $ getListParam i env

getVarId (Var _ i _ _ _) = i
getLineVar (Var _ _ _ _ line) = line
getTypeVar (Var t _ _ _ _) = getBaseType t
getTypeInitVar (Var _ _ (Valore t _) _ _) =  t
getModeVar (Var _ _ _ m _ ) = m
-----------------------
---		TIPI		---
-----------------------

--Bool
--Compatibilità per espressioni matematiche e assegnamenti
compatibilityType Flt64 Bool = False
compatibilityType Flt64 Str = False
compatibilityType Flt32 Bool = False
compatibilityType Flt32 Str = False
compatibilityType Flt32 Flt64 = False
compatibilityType Byte Str = False
compatibilityType Byte Bool = False
compatibilityType Byte Flt64 = False
compatibilityType Byte Flt32 = False
compatibilityType Byte Integer = False
compatibilityType Integer Bool = False
compatibilityType Integer Str = False
compatibilityType Integer Flt64 = False
compatibilityType Integer Flt32 = False
compatibilityType Bool Byte = False
compatibilityType Bool Integer = False
compatibilityType Bool Flt32 = False
compatibilityType Bool Flt64 = False
compatibilityType Bool Str = False
compatibilityType t1 Void = False
compatibilityType Void t1 = False
compatibilityType (Ptr t1) t2 = compatibilityType t1 t2
compatibilityType (Arr _ t1) t2 = compatibilityType t1 t2
compatibilityType t1 (Ptr t2) = compatibilityType t1 t2
compatibilityType t1 (Arr _ t2) = compatibilityType t1 t2
compatibilityType _ _  = True

--Bool
--Compatibilità per espressioni booleane
compatibilityTypeRel Void _ = False
compatibilityTypeRel _ Void = False
compatibilityTypeRel Integer Str = False
compatibilityTypeRel Str Integer = False
compatibilityTypeRel Byte Str = False
compatibilityTypeRel Str Byte = False
compatibilityTypeRel Flt32 Str = False
compatibilityTypeRel Str Flt32 = False
compatibilityTypeRel Flt64 Str = False
compatibilityTypeRel Str Flt64 = False
compatibilityTypeRel Bool _ = False
compatibilityTypeRel _ Bool = False
compatibilityTypeRel _ _ = True

--Type
--Ritorna il tipo base
getBaseType (Arr _ t) = getBaseType t
getBaseType (Ptr t) = getBaseType t
getBaseType t = t

--Error Type -> Ok type compatibile
--			 -> Failed type incompatibile
--Ritorna il tipo massimo tra i due
--Si suppone che siano compatibili
maxType Integer Flt32 = Flt32
maxType Integer Flt64 = Flt64
maxType Integer Str = Str
maxType Byte Integer = Integer
maxType Byte Flt32 = Flt32
maxType Byte Flt64 = Flt64
maxType Byte Str = Str
maxType Flt32 Flt64 = Flt64
maxType Flt32 Str = Str
maxType Flt64 Str = Str
maxType (Ptr t1) t2 = maxType t1 t2
maxType t1 (Ptr t2) = maxType t1 t2
maxType (Arr _ t1) t2 = maxType t1 t2
maxType t1 (Arr _ t2) = maxType t1 t2
maxType t1 _ = t1


--Type
--Data una LEXP ritorna il tipo
getTypeL (LID id) env 
	| existsVarEnv id env = getTypeVar $ getVarEnv id env
	| otherwise = Void
getTypeL (LPunt rexp) env = getTypeR rexp env
getTypeL (LVett lexp _) env = getTypeL lexp env

--Type
--Data una REXP ritorna il tipo
getTypeR (RVal (Valore t _)) env = t
getTypeR (DPunt lexp) env = getTypeL lexp env
getTypeR (Assg lexp _ _) env = getTypeL lexp env
getTypeR (FCall id _ _) env = getTypeFun (getFunEnv id env)
getTypeR (LRExp lexp) env = getTypeL lexp env
getTypeR (RE rexp) env = getTypeR rexp env
getTypeR (MathExp s r1 r2 _) env = maxType (getTypeR r1 env) (getTypeR r2 env)
getTypeR (BoolExp _ _ _ _ ) env = Bool 
getTypeR (RelExp _ _ _ _ ) env = Bool
getTypeR (UnOp s rexp _ ) env
	| s == "!" = Bool
	| otherwise = getTypeR rexp env


getTypePar (Par _ t _ ) = t

-----------------------
---		Program		---
-----------------------
typeCheck (Pr _ _ lv lf) = listError ++ (checkFunctions lf newEnv)
	where 
		(newEnv, listError)  = insertInEnv lv lf (newEnvirorment EmptyEnv) []
		insertInEnv [] [] e lerr = (e,lerr)
		insertInEnv [] (f:fs) e lerr 
			| existsFunEnv (getFunId f) e = insertInEnv [] fs e (("Funzione " ++ (getNameFromId (getFunId f)) ++ " @line:" ++  (show (getLineFun f)) ++ " precedentemente dichiarata @line:" ++ (show (getLineFun $ getFunEnv (getFunId f) e))):lerr)
			| otherwise = insertInEnv [] fs (insertFunEnv f e) lerr
		insertInEnv (v:vs) f e lerr 
			| not (compatibilityType tvar tvarInit) = insertInEnv vs f (insertVarEnv v e) (("Tipo di inizializzazione " ++ (show tvarInit) ++ " non compatibile con tipo dichiarato " ++ (show tvar) ++ " @line" ++ show(getLineVar v) ):lerr)
			| existsVarEnv (getVarId v) e = insertInEnv vs f e (("Variabile " ++ (getNameFromId (getVarId v)) ++ " @line:" ++  (show (getLineVar v)) ++ " precedentemente dichiarata @line:" ++ (show (getLineVar $ getVarEnv (getVarId v) e))):lerr)
			| otherwise = insertInEnv vs f (insertVarEnv v e) lerr
			where
				tvar = getTypeVar v
				tvarInit = getTypeInitVar v


--Creiamo un nuovo envirorment e inseriamo i parametri all'interno come variabili
--Poi verifichiamo gli stms e la correttezza dei return
checkFunctions [] env = []
checkFunctions ((SFunz id t listParam stms line ):fs) env = errRet ++ (checkStms stms (createEnvParam listParam (newEnvirorment env)) t False) ++ (checkFunctions fs env) 
	where
		isRet = if t == Void then 1
				else checkRet stms
		errRet = case isRet of
								0 -> ["Manca il comando 'return' nella funzione " ++ getNameFromId id ++ " dichiarata @line:" ++ show line ]
								1 -> []
								2 -> ["Presente un comando 'return' all'interno di un if, ma non fuori. Funzione " ++ getNameFromId id ++ " dichiarata @line:" ++ show line ]
								3 -> ["Presente un comando 'return' all'interno di un if, ma non nell'else. Funzione " ++ getNameFromId id ++ " dichiarata @line:" ++ show line ]
								4 -> ["Presente un comando 'return' all'interno di un else, ma non nell'if. Funzione " ++ getNameFromId id ++ " dichiarata @line:" ++ show line ]				


-----------------------
---		Return		---
-----------------------
existsRet [] = False
existsRet ((SRetVoid _):ss) = True
existsRet ((SRet _ _):ss) = True
existsRet (s:ss) = existsRet ss

--Int
-- 0 -> Non esiste return
-- 1 -> Tutto Ok
-- 2 -> Esiste return nell'if ma non fuori
-- 3 -> Esiste return nell'if ma non nell'else
-- 4 -> Esiste return nell'else ma non nell'if
checkRet [] = 0
checkRet ((SIf _ lstmif _):ss)
	| existsRet lstmif && not (existsRet ss) = 2
	| not(existsRet lstmif) && (existsRet ss) = 1
	| otherwise = checkRet ss
checkRet ((SIfElse _ ls1 ls2 _):ss) 
	| existsRet ls1 && not (existsRet ls2) = 3
	| not(existsRet ls1) && (existsRet ls2) = 4
	| otherwise = checkRet ss
checkRet ((SRetVoid _):ss) = 1
checkRet ((SRet _ _):ss) = 1
checkRet (s:ss) = checkRet ss

-----------------------
---		STMS		---
-----------------------
checkStms :: [Stm] -> Env -> Type -> Bool -> [String]
checkStms [] env _ _ = []

--Controllo Codice dopo return Return
checkStms ((SRetVoid line):s:ss) env _ _ = ["[WARN] Codice dopo il return @line:" ++ show line]
checkStms ((SRet _ line):s:ss) env _ _ = ["[WARN] Codice dopo il return @line:" ++ show line]
--Controlli altri stm
checkStms (stm:ss) env t bCiclo = errList ++ (checkStms ss newEnv t bCiclo)
	where
		(errList,newEnv) = (checkStm stm env t bCiclo)

--Controlli sui singoli stm
--Ad ogni Blocco si crea un nuovo envirorment
--Si ritorna la lista degli errori e l'envirorment 
--che è valido dopo lo statement
checkStm (SDic lvar) env _ _ = (errList,newEnv)
	where 
		(errList,newEnv) = insertInEnv lvar env []
		insertInEnv [] e lerr = (lerr,e)
		insertInEnv (v:vs) e lerr 
			| not (compatibilityType tvar tvarInit) = insertInEnv vs (insertVarEnv v e) (("Tipo di inizializzazione " ++ (show tvarInit) ++ " non compatibile con tipo dichiarato " ++ (show tvar) ++ " @line" ++ show(getLineVar v) ):lerr)
			| existsVarEnvTop (getVarId v) e = insertInEnv vs e (("Variabile " ++ (getNameFromId (getVarId v)) ++ " @line:" ++  (show (getLineVar v)) ++ " precedentemente dichiarata @line:" ++ (show (getLineVar $ getVarEnv (getVarId v) e))):lerr)
			| otherwise = insertInEnv vs (insertVarEnv v e) lerr
			where
				tvar = getTypeVar v
				tvarInit = getTypeInitVar v

checkStm (NFor r1 r2 r3 lstm line) env tFun _ = (errList,env)
	where
		errR1 = checkRexp r1 env line
		errR2 = checkRexp r2 env line
		errR3 = checkRexp r3 env line
		t     = (getTypeR r2 env)
		errB  = if t == Bool then []
				else ["La seconda espressione del for deve essere Bool invece che " ++ (show t) ++ " @line:" ++ (show line)]
		errList = errR1 ++ errR2 ++ errR3 ++ errB ++ (checkStms lstm (newEnvirorment env) tFun True)

checkStm (While rexp lstm line) env tFun _ = (errList,env)
	where
		errR = checkRexp rexp env line
		t	 = (getTypeR rexp env)
		errB = if t == Bool then []
				else ["L'espressione del While deve essere Bool invece che " ++ (show t) ++ " @line:" ++ (show line)]
		errList = errR ++ errB ++ (checkStms lstm (newEnvirorment env) tFun True)

checkStm (SIf  rexp lstm line) env tFun bCiclo = (errList, env)
	where
		errR = checkRexp rexp env line
		t	 = (getTypeR rexp env)
		errB = if t == Bool then []
				else ["L'espressione dell'If deve essere Bool invece che " ++ (show t) ++ " @line:" ++ (show line)]
		errList = errR ++ errB ++ (checkStms lstm (newEnvirorment env) tFun bCiclo)

checkStm (SIfElse rexp lstm1 lstm2 line) env tFun bCiclo = (errList,env)
	where
		errR = checkRexp rexp env line
		t	 = (getTypeR rexp env)
		errB = if t == Bool then []
				else ["L'espressione dell'If deve essere Bool invece che " ++ (show t) ++ " @line:" ++ (show line)]
		errList = errR ++ errB ++ (checkStms lstm1 (newEnvirorment env) tFun bCiclo) ++ (checkStms lstm2 (newEnvirorment env) tFun bCiclo)

checkStm (SBlock lstm) env tFun bCiclo = (checkStms lstm (newEnvirorment env) tFun bCiclo, env)

checkStm (SSw id lcase line) env tFun bCiclo = if existsVarEnv id env then (checkCaseList (getTypeVar $ getVarEnv id env) lcase env tFun bCiclo, env)
								else (["Variabile " ++ (getNameFromId id) ++ " passata allo Switch inesistente @line:" ++ (show line)], env)

checkStm (STry lstm1 lstm2 _) env tFun bCiclo = ((checkStms lstm1 (newEnvirorment env) tFun bCiclo) ++ (checkStms lstm2 (newEnvirorment env) tFun bCiclo), env)

checkStm (SRExp rexp line) env _ _ = (checkRexp rexp env line, env)

checkStm (SRetVoid line ) env t _ = if t == Void then ([] , env)
										else (["Tipo return non corretto, atteso " ++ show t ++ " @line:" ++ show line],env)
checkStm (SRet rexp line) env t _ = if compatibilityType t (getTypeR rexp env) then ([] , env)
									else (["Tipo return non corretto, atteso " ++ show t ++ " ritornato invece "++ show (getTypeR rexp env) ++ " @line:" ++ show line], env)

checkStm (SContinue line) env _ bCiclo = if bCiclo then ([] , env)
											else (["Comando 'continue' non presente dentro ad un ciclo @line:" ++ show line], env)

checkStm (SBreak line) env _ bCiclo = if bCiclo then ([] , env)
											else (["Comando 'break' non presente dentro ad un ciclo @line:" ++ show line], env)

--Verifiche per il case
checkCaseList t [] env tFun bCiclo = []
checkCaseList t (l:ls) env tFun bCiclo = (checkCase t l env tFun bCiclo) ++ (checkCaseList t ls env tFun bCiclo)

checkCase t1 (SCase (Valore t2 _) lstm line) env tFun bCiclo = errList
	where
		errTipo = if t2 == Void || compatibilityType t1 t2 then []
					else ["Il valore del case deve essere di tipo " ++ (show t1) ++ ", rilevato invece " ++ (show t2) ++ " @line:" ++ (show line)]
		errList = errTipo ++ (checkStms lstm (newEnvirorment env) tFun bCiclo)



-----------------------
---	LEXP FUNCTION	---
-----------------------

--num
--Ritorna la dimensione di un vettore dichiarato
dimVectorDeclared (Arr _ t) = 1 + (dimVectorDeclared t)
dimVectorDeclared _ = 0
--num
--Ritorna la dimensione di un vettore stm
dimVectorStm (LVett l _) = 1 + (dimVectorStm l)
dimVectorStm _ = 0

--Bool
--Ritorna se in una lexp è presente un identificatore
existsId (LRExp lexp) = existsIdL lexp
existsId (DPunt lexp) = existsIdL lexp
existsId (Assg lexp _ _) = existsIdL lexp
existsId (RE rexp) = existsId rexp
existsId (MathExp _ r1 r2 _ ) = existsId r1 || existsId r2
existsId _ = False
existsIdL (LID _ ) = True
existsIdL (LPunt rexp ) = existsId rexp
existsIdL (LVett lexp _ ) = existsIdL lexp

getIdR (LRExp lexp) = getIdL lexp
getIdR (DPunt lexp) = getIdL lexp
getIdR (Assg lexp _ _) = getIdL lexp
getIdR (RE rexp) = getIdR rexp
getIdR (MathExp _ r1 r2 _ ) = if (getIdR r1) == (Id "") then getIdR r2
								else (getIdR r1)
getIdR _ = (Id "")
getIdL (LID id) = id
getIdL (LPunt rexp ) = getIdR rexp
getIdL (LVett lexp _ ) = getIdL lexp

checkLexp :: LExp -> Env -> Int -> [String]
checkLexp (LID id) env line 
	| existsVarEnv id env = []
	| otherwise = ["Uso della variabile '" ++ getNameFromId id ++ "' non dichiarata @line:" ++ show line]

checkLexp (LPunt rexp) env line = errList
	where
		errRexp = checkRexp rexp env line
		errId = if existsId rexp then []
				else ["Manca un identificatore nell'operatore di deferimento (*) @line:" ++ show line]
		errList = errId ++ errRexp
		
checkLexp (LVett lexp _ ) env line
	| existsVarEnv idL env && isArray varEnv && (dimVectorDeclared tvar) == 1+(dimVectorStm lexp) = []
	| not (existsVarEnv idL env) = ["Uso della variabile '" ++ getNameFromId idL ++ "' non dichiarata @line:" ++ show line]
	| not (isArray varEnv) = ["Variabile '" ++ getNameFromId idL ++ "' non è un vettore @line:" ++ show line]
	| otherwise = ["Dimensione del vettore '" ++ getNameFromId idL ++ "' non corrispondente alla dimensione dichiarata @line:" ++ show line]
	where 
		idL = getIdL lexp
		varEnv = getVarEnv idL env
		tvar = getArr varEnv
		getArr (Var t _ _ _ _) = t
		isArray (Var (Arr _ _) _ _ _ _) = True
		isArray _ = False

--Mode
--Ritorniamo la modalità della variabile
--Sopprimiamo gli errori in modo da non duplicarli
getModeLexp (LID id) env 
	| existsVarEnv id env = getModeVar $ getVarEnv id env
	| otherwise = ValMode
getModeLexp (LPunt rexp) env 
	| existsId rexp = getModeVar ( getVarEnv (getIdR rexp) env)
	| otherwise = ValMode
getModeLexp (LVett lexp _ ) env = getModeLexp lexp env


-----------------------
---	REXP FUNCTION	---
-----------------------

checkRexp (RVal _) env line = []

checkRexp (DPunt lexp) env line = if existsIdL lexp then []
									else ["Mancanza di un identificatore per l'operatore di refer (&) @line:" ++ show line]

checkRexp (Assg lexp rexp line) env _ = errList
	where
		errLeft  = checkLexp lexp env line
		errRight = checkRexp rexp env line
		typeL 	 = if errLeft == [] then getModeLexp lexp env 
					else ValMode
		errAss 	 = if typeL == ConstMode then ["Impossibile assegnare un valore ad una variabile dichiarata const @line:"++ show line]
					else []
		tLexp	 = getTypeL lexp env
		tRexp	 = getTypeR rexp env
		errVar	 = if  tLexp /= Void && not (compatibilityType tLexp tRexp) then ["Impossibile assegnare " ++ show tRexp ++ " a " ++ show tLexp ++ " @line:" ++ show line]
						else []  
		errList  = errVar ++ errLeft ++ errRight ++ errAss
		
checkRexp (FCall id lRexpPar line) env _ = errList
	where
		errParam = checkParam lRexpPar env
		exists = existsFunEnv id env
		errNotEx = if exists then []
					else ["Chiamata a " ++ getNameFromId id ++ " inesistente @line:" ++ show line]
		errNumPar = if exists && (getNumParam id env) == length lRexpPar then []
					else ["Numero parametri non compatibile nella chiamata di " ++ getNameFromId id ++ " @line" ++ show line]
		errCompa = if exists then checkCompatibilityParam (getListParam id env) lRexpPar env 0
					else []
		errList = errParam ++ errNotEx ++ errNumPar ++ errCompa
		checkParam [] env = []
		checkParam (r:rs) env = (checkParam rs env) ++ (checkRexp r env line)
		checkCompatibilityParam [] r2 env _ = []
		checkCompatibilityParam r1 [] env _ = []
		checkCompatibilityParam (r1:rs1) (r2:rs2) env i = if compatibilityType t1 t2  then (checkCompatibilityParam rs1 rs2 env (i+1) )
														else ("Tipo " ++ show t2 ++ " incompatibile con " ++ show t1 ++ " nel " ++ show i ++ "° parametro della chiamata di " ++ show (getNameFromId id) ++ " @line:" ++ show line) : (checkCompatibilityParam rs1 rs2 env (i+1))
			where
				t1 = (getTypePar r1)
				t2 = (getTypeR r2 env)

checkRexp (LRExp lexp) env line = checkLexp lexp env line

checkRexp (RE rexp) env line = checkRexp rexp env line

checkRexp (MathExp op r1 r2 line) env lineStm = errList
	where
		errR1 = checkRexp r1 env line
		errR2 = checkRexp r2 env line
		t1 	  = getTypeR r1 env 
		t2	  = getTypeR r2 env
		errCmp= if t1 == Void || t2 == Void || compatibilityType t1 t2 then []
				else ["Incompatibilità di tipo tra " ++ show t1 ++ " e " ++ show t2 ++ " vicino a " ++ op ++ " @line:" ++ show line]
		errList = errR1 ++ errR2 ++ errCmp

checkRexp (RelExp op r1 r2 line) env lineStm = errList
	where
		errR1 = checkRexp r1 env line
		errR2 = checkRexp r2 env line
		t1 	  = getTypeR r1 env 
		t2	  = getTypeR r2 env
		errCmp= if t1 == Void || t2 == Void || compatibilityTypeRel t1 t2 then []
				else ["Incompatibilità di tipo tra " ++ show t1 ++ " e " ++ show t2 ++ " vicino a " ++ op ++ " @line:" ++ show line]
		errList = errR1 ++ errR2 ++ errCmp

checkRexp (BoolExp op r1 r2 line) env lineStm = errList
	where
		errR1 = checkRexp r1 env line
		errR2 = checkRexp r2 env line
		t1 	  = getTypeR r1 env 
		t2	  = getTypeR r2 env
		errCmp= if t1 == Void || t2 == Void || compatibilityType t1 t2 then []
				else ["Incompatibilità di tipo tra " ++ show t1 ++ " e " ++ show t2 ++ " vicino a " ++ op ++ " @line:" ++ show line]
		errList = errR1 ++ errR2 ++ errCmp

-- || (t1 == Bool && t1 == t2)

checkRexp (UnOp op rexp line) env lineStm
	| op == "-" = errListMeno
	| otherwise = errListNot
		where
			errRexp = checkRexp rexp env line
			t = getTypeR rexp env
			errListNot = if t == Void  || t == Bool then []
						else ["Espressione non valida, atteso tipo Bool per l'operatore '!' @line:" ++ show line] ++ errRexp
			errListMeno = if t == Void || any (==t) [Integer,Byte,Flt32,Flt64] then []
						else ["Espressione non valida, atteso tipo numerico per l'operatore '-' @line:" ++ show line] ++ errRexp


