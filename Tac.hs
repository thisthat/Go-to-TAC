module Tac where
import GeneralAbs
import Dati
--RIMUOVERE PRIMA DELLA CONSEGNA
import Debug.Trace

data TACProgram = Program String [Function]
data Function = Function String [Instruction]
data Value = Constant String 		|
             Temporary Int          |
             Variable String 		|
             Dereference Value
  deriving (Eq)
  {--
             FloatConstant String   |
             CharConstant String    |
             StringConstant String  |
             BoolConstant String   	|
             --}

data Label = Label String Int
  deriving (Eq)

data Instruction = BinaryOperator BinOp Value Value Value	|
                   UnaryOperator UnOp Value Value           |
                   Assignment Value Value                   |
                   Goto Label                               |
                   GotoIf Value Label                       |
                   GotoIfFalse Value Label                  |
                   OnExceptionGoto Label                    | -- Come implemento?
                   Param Value                              |
                   FuncCall String Int Value                |
                   ProcCall String Int                      |
                   FuncRet Value                            |
                   ProcRet                                  |
                   Throw                                    |
                   LabelMarker Label
  deriving (Eq)

data BinOp = Sum | Sub | Mul | Div | Pow |
             And | Or | Xor | 
             Equ | NEqu | LT | GT | LTE | GTE
			deriving (Eq)

data UnOp = Minus | Not
 			deriving (Eq)

data NextIfPos = Elsif | Else | EndIf
 deriving (Eq)

 -- Liste "funzional level" per la concatenazione efficiente delle espressioni
type FList a = [a] -> [a]

unknown = traceStack "" undefined

binaryExprOp :: GeneralAbs.RExp -> BinOp
binaryExprOp (GeneralAbs.MathExp op _ _ _) 
	| op == "+" = Tac.Sum
	| op == "*" = Tac.Mul
	| op == "/" = Tac.Div
	| op == "-" = Tac.Sub
	| op == "^"	= Tac.Pow
	| otherwise = Tac.unknown

binaryExprOp (GeneralAbs.BoolExp op _ _ _) 
	| op == "and" = Tac.And
	| op == "or" = Tac.Or
	| op == "xor" = Tac.Xor
	| otherwise = Tac.unknown

binaryExprOp (GeneralAbs.RelExp op _ _ _) 
	| op == "==" = Tac.Equ
	| op == "!=" = Tac.NEqu
	| op == "<" = Tac.LT
	| op == "<=" = Tac.LTE
	| op == ">" = Tac.GT
	| op == ">=" = Tac.GTE
	| otherwise = unknown

binaryExprOp _ = unknown

unaryExprOp :: GeneralAbs.RExp -> UnOp
unaryExprOp (GeneralAbs.UnOp op _ _) 
	| op == "-" = Minus
	| op == "!" = Not
	| otherwise = unknown

unaryExprOp _ = unknown

instance Show TACProgram where
	show (Program name fs) = showString "PROGRAM " . showString name . showString "\n" . (showF fs) $ "\n" 
		where 
			showF [] = id
			showF (f:fs) =  showString (show f) . showString "\n" . showF fs	

instance Show Function where
	showsPrec _ (Function name lstm) = showString "\nfunction: " . showString name . showString "\n" . foldr aux id lstm
		where
			aux x l = shows x . showString "\n" . l

instance  Show Instruction where
	showsPrec _ (BinaryOperator op result v1 v2) = showString "\t" . (shows result) . showString " = " . (shows v1) . (shows op) . (shows v2)
	showsPrec _ (UnaryOperator op result value) = showString "\t" . shows result . showString " = " . shows op . shows value
	showsPrec _ (Assignment result value) = showString "\t" . shows result . showString " = " . shows value
	showsPrec _ (Goto label) = showString "\tgoto " . shows label
	showsPrec _ (GotoIf value label) = showString "\tif " . shows value . showString " goto " . shows label
	showsPrec _ (GotoIfFalse value label) = showString "\tif not " . shows value . showString " goto " . shows label
	showsPrec _ (OnExceptionGoto label) = showString "\ton exception goto " . shows label
	showsPrec _ (Throw) = showString "\tthrow"
	showsPrec _ (Param value) = showString "\tparam " . shows value
	showsPrec _ (ProcCall name n) = showString "\tcall " . showString name . showString " " . shows n
	showsPrec _ (FuncCall name n v) = showString "\t" . shows v . showString " = call " . showString name . showString "/" . shows n
	showsPrec _ (ProcRet ) = showString "\tret"
	showsPrec _ (FuncRet v) = showString "\tretf " . shows v
	showsPrec _ (LabelMarker label) = shows label . showString ":"


instance Show Value where
	show (Constant s)  	=  s		
	show (Temporary s) 	=  't':(show s)       
	show (Variable s)  	=  s
	show (Dereference s) =  '&':(show s)

instance Show BinOp where
	show Tac.Sum = " + "
	show Tac.Sub = " - "
	show Tac.Mul = " * "
	show Tac.Div = " / "
	show Tac.Pow = " ^ "
	show Tac.And = " and "
	show Tac.Or  = " or "  
	show Tac.Xor = " xor "
	show Tac.Equ = " == "
	show Tac.NEqu = " != "
	show Tac.LT  = " < "
	show Tac.LTE = " <= "
	show Tac.GT  = " > "
	show Tac.GTE = " >= "

instance Show UnOp where
	show Tac.Minus = "-"
	show Tac.Not = "!" 

instance Show Label where
   showsPrec _ (Label name c) = showString name . showString "." . (shows c)

createTac :: Program -> TACProgram
createTac (Pr name _ lvar lfun) = (Program name (createTacFunList lfun))

createTacFunList :: [SFunz] -> [Function]
createTacFunList [] = []
createTacFunList ((SFunz (Id name) _ _ lstm _ ):fs) = (Function name ls ) : createTacFunList fs
	where
		ls = (createTacStmList lstm 0 0) []

createTacStmList :: [Stm] -> Int -> Int -> FList Instruction
createTacStmList [] _ _ = id
createTacStmList (s:ss) c l =  stm .  (createTacStmList ss counter label)
	where 
		(stm,counter,label) = createTacStm s c l


createTacStm (SRExp r _) counter label = (instr,cc,ll)
	where
		(cc,ll,_,instr) = createTacRexp r counter label
createTacStm _ _ _ = ((UnaryOperator Not (Constant "0") (Constant "0") :) ,0,0)

--IN
--	Exp, n° registro, n° label
--OUT
--Ultimo registro usato
--Ultima label usata
--Address della espressione
--Costrutto espressione
createTacRexp :: RExp -> Int -> Int -> (Int,Int,Value,FList Instruction)

createTacRexp (RVal (Valore t str)) counter l = (addr,l, dest, tac)
	where 
		addr = counter + 1
		dest = Temporary addr
		tac =  (Assignment dest (Constant str) :)

createTacRexp (LRExp left) counter label = createTacLexp left counter label

createTacRexp (DPunt left) counter label = (t, l, dest ,tacL . tac)
	where
		(t,l,addr,tacL) = createTacLexp left counter label
		addr' = t + 1
		dest = Temporary addr'
		tac = (Assignment dest (Dereference addr) :)

createTacRexp (Assg left right _) counter label = (nRegR,l, addrL, tacL . tacR . tac)
	where
		(nRegL,label',addrL,tacL) = createTacLexp left counter label
		(nRegR,l,addrR,tacR) = createTacRexp right nRegL label'
		tac = (Assignment addrL addrR :)

createTacRexp (RE rexp) counter label = createTacRexp rexp counter label

createTacRexp rop@(MathExp op rl rr _ ) counter label = (addr, l, dest , tacRl . tacRr . tac)
	where
		(nRegL,label',addrL,tacRl) = createTacRexp rl counter label
		(nRegR,l,addrR,tacRr) = createTacRexp rr nRegL label'
		addr = (nRegR + 1)
		dest = Temporary addr
		tac = (BinaryOperator (binaryExprOp rop)  dest addrL addrR :)

--Casi speciali per LE short-cut
createTacRexp rop@(BoolExp "and" r1 r2 _ ) counter label = genExpAnd r1 r2 counter label
createTacRexp rop@(BoolExp "or"  r1 r2 _ ) counter label = genExpOr  r1 r2 counter label
createTacRexp rop@(BoolExp op r1 r2 _ ) counter label = (addr, l, dest ,tac1 . tac2 . tac)
	where
		(nReg1,label',addr1,tac1) = createTacRexp r1 counter label
		(nReg2,l,addr2,tac2) = createTacRexp r2 nReg1 label'	
		addr = (nReg2 + 1)
		dest = Temporary addr
		tac = (BinaryOperator (binaryExprOp rop)  dest addr1 addr2 :)

createTacRexp rop@(RelExp op r1 r2 _ ) counter label = (addr, l, dest , tac1 . tac2 . tac )
	where
		(nReg1,label',addr1,tac1) = createTacRexp r1 counter label
		(nReg2,l,addr2,tac2) = createTacRexp r2 nReg1 label'
		addr = (nReg2 + 1)
		dest = Temporary addr
		tac = (BinaryOperator (binaryExprOp rop)  dest addr1 addr2 :)

createTacRexp rop@(UnOp op r _ ) counter label = (addr,l, dest, tac1 . tac )
	where
		(nReg1,l,addr1,tac1) = createTacRexp r counter label
		addr = (nReg1 + 1)
		dest = Temporary addr
		tac = (UnaryOperator (unaryExprOp rop)  dest addr1 :)

createTacRexp (FCall (Id name) param _) counter label = (addr, l, dest , tac )
	where
		(c,l, lAddrPar,tacGenParam) = createTacParam counter label param 
		addr = (c + 1)
		dest = Temporary addr
		tac  = tacGenParam . (pars lAddrPar) . (FuncCall name (length lAddrPar) dest :) 
		pars [] = id
		pars (p:ps) = (Param p:).(pars ps)

		                

createTacLexp (LID (Id i)) counter label = (counter,label, Temporary counter, ((UnaryOperator Not (Constant "L") (Constant "0")):) )


createTacParam :: Int -> Int -> [RExp] -> (Int,Int,[Value], FList Instruction)
createTacParam c l [] = (c,l,[],id)
createTacParam c l (p:ps) = (c',l',lPar, tac)
	where
		(counter,label, destRexp,tacRexp) = createTacRexp p c l
		(c',l', lPar',tac') = createTacParam counter label ps 
		lPar = destRexp:lPar'
		tac = tacRexp . tac'

genExpAnd :: RExp -> RExp -> Int -> Int -> (Int, Int,Value, FList Instruction)
genExpAnd r1 r2 counter label = (0,0,(Constant "AND"),id)

genExpOr r1 r2 counter label = (0,0,(Constant "0"),id)

{-}
genConjunctionExpr :: AST.Expr -> Maybe Value -> Environment -> Int -> Int -> (Value, FList Instruction, Int, Int)
genConjunctionExpr (AST.And left right _ _) target env m count = (target', insts, m', count'')
       where (target', m') = allocTemporary target rightm
             (leftv, leftinst, leftm, count') = genExpr left (Just target') env m count
             (rightv, rightinst, rightm, count'') = genExpr right (Just target') env leftm (count' + 1)
             insts = leftinst .
                     (GotoIfFalse target' endLabel:) .
                     rightinst . 
                     (LabelMarker endLabel:)
             endLabel = Label "and.exit" (count'' + 1)
-}


















 