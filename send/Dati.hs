module Dati where
import GeneralAbs
--Radice Dell'albero di sintassi astratta
data Program = Pr PRIdent [Imp] [Var] [SFunz] deriving (Eq, Show, Ord)
--Import
data Imp = Imp String Info  deriving (Eq, Show, Ord)
--IDentificatore programma
data PRIdent = PRI String Info deriving (Eq, Show, Ord)




