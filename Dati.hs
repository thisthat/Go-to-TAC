module Dati where
import GeneralAbs
--Radice Dell'albero di sintassi astratta
--Il primo parametro è l'identificatore di package
data Program = Pr String [Imp] [Var] [SFunz] deriving (Eq, Show, Ord)
--Import con linea per error reporting
data Imp = Imp String Int  deriving (Eq, Show, Ord)






