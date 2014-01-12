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
	show Tac.Sum = "+"
	show Tac.Sub = "-"
	show Tac.Mul = "*"
	show Tac.Div = "/"
	show Tac.Pow = "^"
	show Tac.And = "and"
	show Tac.Or  = "or"
	show Tac.Xor = "xor"
	show Tac.Equ = "=="
	show Tac.NEqu = "!="
	show Tac.LT  = "<"
	show Tac.LTE = "<="
	show Tac.GT  = ">"
	show Tac.GTE = ">="

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
		ls = (createTacStmList lstm 0) []

createTacStmList :: [Stm] -> Int -> FList Instruction
createTacStmList [] _ = id
createTacStmList (s:ss) c =  stm .  (createTacStmList ss counter)
	where 
		(stm,counter) = createTacStm s c


createTacStm (SRExp r _) counter = (instr,cc)
	where
		(cc,_,instr) = createTacRexp r counter
createTacStm _ _ = ((UnaryOperator Not (Constant "0") (Constant "0") :) ,0)

--Ultimo registro usato
--Address della espressione
--Costrutto espressione
createTacRexp :: RExp -> Int -> (Int,Value,FList Instruction)

createTacRexp (RVal (Valore t str)) counter = (addr, dest, tac)
	where 
		addr = counter + 1
		dest = Temporary addr
		tac =  (Assignment dest (Constant str) :)

createTacRexp (LRExp left) counter = createTacLexp left counter

createTacRexp (DPunt left) counter = (t, dest ,tacL . tac)
	where
		(t,addr,tacL) = createTacLexp left counter
		addr' = t + 1
		dest = Temporary addr'
		tac = (Assignment dest (Dereference addr) :)

createTacRexp (Assg left right _) counter = (nRegR, addrL, tacL . tacR . tac)
	where
		(nRegL,addrL,tacL) = createTacLexp left counter
		(nRegR,addrR,tacR) = createTacRexp right nRegL
		tac = (Assignment addrL addrR :)

createTacRexp (RE rexp) counter = createTacRexp rexp counter

createTacRexp rop@(MathExp op rl rr _ ) counter = (addr, dest , tacRl . tacRr . tac)
	where
		(nRegL,addrL,tacRl) = createTacRexp rl counter
		(nRegR,addrR,tacRr) = createTacRexp rr nRegL
		addr = (nRegR + 1)
		dest = Temporary addr
		tac = (BinaryOperator (binaryExprOp rop)  dest addrL addrR :)

createTacRexp rop@(BoolExp op r1 r2 _ ) counter = (addr, dest ,tac1 . tac2 . tac)
	where
		(nReg1,addr1,tac1) = createTacRexp r1 counter
		(nReg2,addr2,tac2) = createTacRexp r2 nReg1
		addr = (nReg2 + 1)
		dest = Temporary addr
		tac = (BinaryOperator (binaryExprOp rop)  dest addr1 addr2 :)

createTacRexp rop@(RelExp op r1 r2 _ ) counter = (addr, dest , tac1 . tac2 . tac )
	where
		(nReg1,addr1,tac1) = createTacRexp r1 counter
		(nReg2,addr2,tac2) = createTacRexp r2 nReg1
		addr = (nReg2 + 1)
		dest = Temporary addr
		tac = (BinaryOperator (binaryExprOp rop)  dest addr1 addr2 :)

createTacRexp rop@(UnOp op r _ ) counter = (addr, dest, tac1 . tac )
	where
		(nReg1,addr1,tac1) = createTacRexp r counter
		addr = (nReg1 + 1)
		dest = Temporary addr
		tac = (UnaryOperator (unaryExprOp rop)  dest addr1 :)

createTacRexp (FCall (Id name) param _) counter = (addr, dest , tac )
	where
		(c,lAddrPar,tacGenParam) = createTacParam counter param
		addr = (c + 1)
		dest = Temporary addr
		tac  = tacGenParam . (pars lAddrPar) . (FuncCall name (length lAddrPar) dest :) 
		pars [] = id
		pars (p:ps) = (Param p:).(pars ps)

		                

createTacLexp (LID (Id i)) counter = (counter, Temporary counter, ((UnaryOperator Not (Constant "L") (Constant "0")):) )


createTacParam :: Int -> [RExp] -> (Int,[Value], FList Instruction)
createTacParam c [] = (c,[],id)
createTacParam c (p:ps) = (c',lPar, tac)
	where
		(counter,destRexp,tacRexp) = createTacRexp p c
		(c',lPar',tac') = createTacParam counter ps
		lPar = destRexp:lPar'
		tac = tacRexp . tac'






















 