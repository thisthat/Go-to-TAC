module Tac where
import GeneralAbs
import Dati
--RIMUOVERE PRIMA DELLA CONSEGNA
import Debug.Trace
{-
data BinOp = Sum | Sub | Mul | Div | Pow |
             And | Or | Xor | 
             Equ | NEqu | LT | GT | LTE | GTE
			deriving (Eq)

data UnOp = Minus | Not
 			deriving (Eq)

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
-}

{-}
createTac (Pr _ _ lvar lfun) = (createTacFunList lfun) 
createTacFunList [] = ""
createTacFunList (f:fs) = showString (createTacFun f) (createTacFunList fs) 
createTacFun (GeneralAbs.SFunz (GeneralAbs.Id name) _ _ lstm _ ) = showString name "\n"
{ -}
createTac :: Program -> String
createTac (Pr _ _ lvar lfun) = createTacFunList lfun 

createTacFunList [] = ""
createTacFunList (f:fs) = showString (createTacFun f) (createTacFunList fs) 

createTacFun (SFunz (Id name) _ _ lstm _ ) = createTacStmList lstm 0

createTacStmList [] _ = ""
createTacStmList (s:ss) c =  showString tacList (createTacStmList ss counter)
	where 
		(tacList,counter) = createTacStm s c

createTacStm (SRExp r _) counter = (tac,cc)
	where
		(cc,_,tac) = createTacRexp r counter
createTacStm _ _ = ("",0)

--Ultimo registro usato
--Address della espressione
--TAC espressione
createTacRexp :: RExp -> Int -> (Int,String,String)

createTacRexp (RVal (Valore t str)) counter = (addr, dest, tac)
	where 
		addr = counter + 1
		dest = showString "t" $ show addr
		tac =  showString dest . showString " = " . showString str $ "\n"

createTacRexp (LRExp left) counter = createTacLexp left counter

createTacRexp (DPunt left) counter = (t, tac, "")
	where
		(t,addr,tacL) = createTacLexp left counter
		tac = '&' : addr

createTacRexp (Assg left right _) counter = (nRegR, addrL, tac)
	where
		(nRegL,addrL,tacL) = createTacLexp left counter
		(nRegR,addrR,tacR) = createTacRexp right nRegL
		tac = showString tacL . showString tacR . showString addrL . showString " = " . showString addrR $ "\n"

createTacRexp (RE rexp) counter = createTacRexp rexp counter

createTacRexp (MathExp op rl rr _ ) counter = (addr, dest , tac)
	where
		(nRegL,addrL,tacRl) = createTacRexp rl counter
		(nRegR,addrR,tacRr) = createTacRexp rr nRegL
		addr = (nRegR + 1)
		dest = showString "t" $ show addr
		tac = showString tacRl . showString tacRr . showString dest . showString " = " . showString addrL . showString " " . showString op . showString " " . showString addrR $ "\n"

createTacRexp (BoolExp op r1 r2 _ ) counter = (addr, dest , tac)
	where
		(nReg1,addr1,tac1) = createTacRexp r1 counter
		(nReg2,addr2,tac2) = createTacRexp r2 nReg1
		addr = (nReg2 + 1)
		dest = showString "t" $ show addr
		tac = showString tac1 . showString tac2 $ "NOT IMPLEMENTED YET BOOLEXP\n"

createTacRexp (RelExp op r1 r2 _ ) counter = (addr, dest , tac)
	where
		(nReg1,addr1,tac1) = createTacRexp r1 counter
		(nReg2,addr2,tac2) = createTacRexp r2 nReg1
		addr = (nReg2 + 1)
		dest = showString "t" $ show addr
		tac = showString tac1 . showString tac2 $ "NOT IMPLEMENTED YET RELEXP\n"

createTacRexp (UnOp op r _ ) counter = (addr, dest, tac)
	where
		(nReg1,addr1,tac1) = createTacRexp r counter
		addr = (nReg1 + 1)
		dest = showString "t" $ show addr
		tac =  showString tac1 . showString dest . showString " = " . showString op . showString addr1 $ "\n" 

createTacRexp (FCall (Id name) lre _) counter = (addr, tac, tac)
	where
		(lastR,listAddr,tacReg) = composeTac lre counter
		addr = lastR + 1
		n = show (length lre)
		tac = showString tacReg . showString "call " . showString name . showString "/" .  showString n $ "\n" 
		composeTac _ _ = (0,[],"")

createTacLexp (LID (Id i)) counter = (counter, i, "")
 