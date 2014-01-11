{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
module Main where

import Dati
import Lexer
import GeneralAbs
import Function
import PrettyPrint
import qualified Tac
--Se si vuole avere output colorato decommentare le seguenti righe
--NECESSARIO AVERE IL PACKAGE System.Console.ANSI
--Installabile con cabal install ansi-terminal
--import System.Console.ANSI
import qualified Data.Array as Happy_Data_Array
import qualified GHC.Exts as Happy_GHC_Exts

-- parser produced by Happy Version 1.18.10

newtype HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: t4 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: t5 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: t6 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: t7 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: t8 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: t9 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: t10 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: t11 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: t12 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: t13 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: t14 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: t15 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: t16 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: t17 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: t18 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: t19 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: t20 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: t21 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: t22 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: t23 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: t24 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: t25 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: t26 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> t26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyInTok :: ((Info,Token)) -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26)
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26) -> ((Info,Token))
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x26\x02\x26\x02\x16\x02\xec\x01\x20\x02\x22\x02\x1d\x02\x05\x00\x1e\x02\x19\x02\x1b\x02\x93\x01\x18\x02\xdd\x00\x00\x00\x0f\x02\x1a\x02\x0a\x02\x14\x02\x15\x02\x00\x00\x12\x02\x20\x01\x02\x02\x00\x00\x00\x00\x00\x00\x00\x00\xdd\x00\x00\x00\x00\x00\x06\x02\x0e\x02\xdd\x00\x00\x00\x0d\x02\x10\x02\x40\x01\x01\x02\xfb\x01\x0c\x02\x00\x00\x00\x00\x0b\x02\x05\x02\x03\x02\xdd\x00\x09\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdd\x00\xdf\x00\x08\x02\x07\x02\xf8\x01\x40\x01\x00\x00\x04\x02\xe5\xff\xf5\x01\xdd\x00\xef\x01\x00\x00\xff\x01\xdd\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\xf1\x01\xe5\xff\xfe\x01\xfd\x01\xfe\xff\xfc\x01\xfa\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfa\x01\xfe\xff\x67\x00\x31\x00\xfd\xff\x45\x00\xf2\x01\x18\x00\xf7\x01\x45\x00\x32\x00\x45\x00\xd7\x01\xf6\x01\xf4\x01\x45\x00\x45\x00\xef\xff\xd5\x01\x00\x00\x00\x00\x25\x00\x00\x00\x00\x00\xee\x01\x0e\x01\x00\x00\xd3\x00\x29\x00\x45\x00\x5a\x00\x00\x00\xe5\x01\x98\x00\xdf\x01\xdd\x00\x45\x00\x45\x00\x00\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x45\x00\x00\x00\xd8\x01\xcd\x01\x8b\x00\x43\x01\x5c\x01\x55\x00\x06\x00\xec\xff\x01\x01\xc1\x00\x48\x00\x00\x00\x9e\x01\x25\x00\x20\x00\x29\x00\x36\x01\xa5\x00\xa2\x00\xb8\x01\x00\x00\xea\x01\x00\x00\x36\x01\xb3\x01\xb9\x01\x00\x00\x45\x00\x8f\x01\x8e\x01\xa8\x01\x00\x00\x97\x01\x17\x00\xfe\xff\x8c\x01\x8c\x01\x1b\x01\x45\x00\x00\x00\x00\x00\x8d\x01\x00\x00\x40\x01\x00\x00\x00\x00\x80\x01\x7e\x01\x36\x01\x45\x00\x00\x00\x00\x00\x7c\x01\x79\x01\x40\x01\x74\x01\xfe\xff\x72\x01\x7a\x01\x73\x01\xe0\x00\x00\x00\x00\x00\x00\x00\x78\x01\x00\x00\xfe\xff\x77\x01\x00\x00\x77\x01\x17\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x5d\x01\x00\x00\x00\x00\x00\x00\x00\x00\x5e\x01\x76\x01\x00\x00\x00\x00\x00\x00\x55\x01\x00\x00\x00\x00\x54\x01\x00\x00\x00\x00\x5a\x01\x58\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x51\x01\x00\x00\x00\x00\x31\x01\x00\x00\x2e\x01\x00\x00\x00\x00\x2c\x01\x29\x01\x1b\x00\x1c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x01\x00\x00\x00\x00\x17\x01\xe2\x00\x12\x01\x00\x00\xe6\x00\xdb\x00\x00\x00\xe1\x00\xe3\x00\x00\x00\xd6\x00\xda\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd9\x00\xd5\x00\xbd\x00\x00\x00\x98\x01\xb7\x00\xa9\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x00\x91\x01\x00\x00\x00\x00\x00\x00\xeb\x01\x9e\x00\xe4\x01\x00\x00\xe0\x01\x14\x01\xdb\x01\x00\x00\x00\x00\x00\x00\xda\x01\xd9\x01\x8d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x96\x00\x33\x00\x00\x00\x94\x00\x00\x00\x9d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9a\x00\xd3\x01\xd2\x01\x00\x00\xc9\x01\xc8\x01\xc2\x01\xc1\x01\xc0\x01\xbb\x01\xb7\x01\xb0\x01\xae\x01\xaa\x01\xa9\x01\xa5\x01\xa3\x01\x9c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x68\x00\x00\x00\x72\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7f\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5d\x00\x8a\x01\x60\x00\x5c\x00\x00\x00\x4e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x61\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x00\x00\x63\x00\x00\x00\x5f\x00\x00\x00\x13\x01\x00\x00\x00\x00\x00\x00\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x99\x00\x37\x00\x00\x00\x0a\x00\xf8\xff\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\xf5\xff\x00\x00\x00\x00\x00\x00\xe0\xff\x00\x00\x00\x00\xe9\xff\xfe\xff\x00\x00\xfd\xff\x00\x00\x00\x00\x00\x00\xfc\xff\x00\x00\x00\x00\x00\x00\xe8\xff\xe7\xff\xe5\xff\xe6\xff\xe9\xff\xe3\xff\xe2\xff\xf1\xff\x00\x00\xe9\xff\xe4\xff\x00\x00\xf5\xff\x00\x00\xde\xff\xf9\xff\x00\x00\xfb\xff\xfa\xff\x00\x00\x00\x00\xdd\xff\xe9\xff\x00\x00\xec\xff\xee\xff\xed\xff\xeb\xff\xea\xff\xf4\xff\xe9\xff\x00\x00\x00\x00\xf5\xff\xf1\xff\x00\x00\xe1\xff\xf5\xff\xd8\xff\x00\x00\xe9\xff\xf9\xff\xf8\xff\x00\x00\xe9\xff\xdc\xff\xd7\xff\xda\xff\xd9\xff\xf3\xff\x00\x00\xef\xff\xf2\xff\xf1\xff\xd8\xff\xf7\xff\x00\x00\xd3\xff\xe0\xff\xf7\xff\xdb\xff\xf0\xff\xf6\xff\xdf\xff\xa8\xff\xca\xff\xf7\xff\xd3\xff\x00\x00\xac\xff\x00\x00\x00\x00\x00\x00\x00\x00\xa3\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa9\xff\xa3\xff\xad\xff\xae\xff\xc4\xff\xc5\xff\x00\x00\x00\x00\xcf\xff\x00\x00\xa2\xff\xa7\xff\x00\x00\xc7\xff\x00\x00\x00\x00\x00\x00\xe9\xff\x00\x00\x00\x00\xc8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd2\xff\x00\x00\x00\x00\xb0\xff\xb2\xff\xb1\xff\xb5\xff\xb6\xff\xb7\xff\xb8\xff\xb3\xff\xb4\xff\xb9\xff\xba\xff\xbc\xff\xbd\xff\xbb\xff\xab\xff\x00\x00\x00\x00\xf1\xff\xaf\xff\x00\x00\xc6\xff\xa5\xff\x00\x00\xa6\xff\xd0\xff\x00\x00\xce\xff\x00\x00\x00\x00\xcb\xff\x00\x00\xc0\xff\xd3\xff\x00\x00\x00\x00\x00\x00\x00\x00\xaa\xff\xc9\xff\x00\x00\xc3\xff\x00\x00\xa1\xff\xd6\xff\x00\x00\x00\x00\xa4\xff\x00\x00\xcd\xff\xcc\xff\xf7\xff\x00\x00\x00\x00\x00\x00\xd3\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc1\xff\xc2\xff\xd1\xff\xd5\xff\xd4\xff\xd3\xff\xf7\xff\xbe\xff\xf7\xff\xc0\xff\xbf\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x03\x00\x13\x00\x06\x00\x06\x00\x20\x00\x21\x00\x22\x00\x0a\x00\x1d\x00\x12\x00\x06\x00\x1d\x00\x0f\x00\x04\x00\x11\x00\x13\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1d\x00\x17\x00\x05\x00\x06\x00\x33\x00\x34\x00\x23\x00\x24\x00\x1d\x00\x26\x00\x0a\x00\x0b\x00\x29\x00\x2a\x00\x0d\x00\x2c\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1d\x00\x38\x00\x39\x00\x06\x00\x08\x00\x34\x00\x04\x00\x0a\x00\x1d\x00\x27\x00\x28\x00\x0d\x00\x0e\x00\x1d\x00\x12\x00\x2c\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x06\x00\x2c\x00\x2d\x00\x2e\x00\x1d\x00\x38\x00\x39\x00\x2d\x00\x2e\x00\x07\x00\x07\x00\x2d\x00\x2e\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x2c\x00\x05\x00\x13\x00\x13\x00\x1d\x00\x16\x00\x16\x00\x1d\x00\x07\x00\x04\x00\x07\x00\x0d\x00\x38\x00\x39\x00\x05\x00\x0d\x00\x06\x00\x12\x00\x04\x00\x2c\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1d\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x38\x00\x39\x00\x0d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x07\x00\x07\x00\x0d\x00\x08\x00\x16\x00\x07\x00\x0f\x00\x0d\x00\x05\x00\x1d\x00\x10\x00\x11\x00\x0d\x00\x13\x00\x04\x00\x09\x00\x16\x00\x13\x00\x14\x00\x15\x00\x16\x00\x12\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x09\x00\x04\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x0a\x00\x1d\x00\x06\x00\x0d\x00\x0c\x00\x08\x00\x0d\x00\x05\x00\x08\x00\x03\x00\x0c\x00\x06\x00\x08\x00\x0a\x00\x05\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1d\x00\x12\x00\x31\x00\x32\x00\x33\x00\x34\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x0a\x00\x07\x00\x07\x00\x07\x00\x05\x00\x08\x00\x1d\x00\x03\x00\x0d\x00\x0d\x00\x08\x00\x10\x00\x11\x00\x05\x00\x13\x00\x13\x00\x0d\x00\x16\x00\x16\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x07\x00\x05\x00\x12\x00\x32\x00\x33\x00\x34\x00\x08\x00\x06\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x1d\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x08\x00\x02\x00\x01\x00\x08\x00\x00\x00\x09\x00\x01\x00\x1d\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x1d\x00\x37\x00\x05\x00\x05\x00\x05\x00\x0b\x00\x05\x00\x0e\x00\x05\x00\x0e\x00\x05\x00\x0b\x00\x05\x00\x07\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x07\x00\x13\x00\x37\x00\x07\x00\x16\x00\x0a\x00\x0d\x00\x07\x00\x06\x00\x10\x00\x11\x00\x05\x00\x13\x00\x0d\x00\x07\x00\x16\x00\x10\x00\x11\x00\x07\x00\x13\x00\x0d\x00\x13\x00\x16\x00\x10\x00\x11\x00\x07\x00\x13\x00\x07\x00\x05\x00\x16\x00\x13\x00\x07\x00\x07\x00\x16\x00\x25\x00\x25\x00\x07\x00\x13\x00\x07\x00\x13\x00\x16\x00\x07\x00\x16\x00\x13\x00\x13\x00\x07\x00\x16\x00\x16\x00\x13\x00\x07\x00\x13\x00\x16\x00\x0c\x00\x16\x00\x07\x00\x07\x00\x07\x00\x13\x00\x13\x00\x2e\x00\x16\x00\x13\x00\x07\x00\x07\x00\x16\x00\x05\x00\x13\x00\x13\x00\x13\x00\x16\x00\x16\x00\x16\x00\x07\x00\x07\x00\x13\x00\x13\x00\x08\x00\x16\x00\x16\x00\x07\x00\x07\x00\x07\x00\x0b\x00\x05\x00\x13\x00\x13\x00\x07\x00\x16\x00\x16\x00\x13\x00\x07\x00\x13\x00\x13\x00\x13\x00\x16\x00\x16\x00\x16\x00\x07\x00\x13\x00\x0a\x00\x10\x00\x16\x00\x13\x00\x0a\x00\x05\x00\x16\x00\x05\x00\x0a\x00\x06\x00\x13\x00\x05\x00\x04\x00\x16\x00\x05\x00\x05\x00\x13\x00\x05\x00\x17\x00\x03\x00\x13\x00\x0a\x00\x03\x00\x13\x00\x07\x00\x05\x00\x05\x00\x0c\x00\x05\x00\x05\x00\x17\x00\x03\x00\x13\x00\x07\x00\x09\x00\x15\x00\x06\x00\x13\x00\x05\x00\x07\x00\x02\x00\x05\x00\x05\x00\x04\x00\x03\x00\x17\x00\x13\x00\x05\x00\x02\x00\x05\x00\x3a\x00\x01\x00\xff\xff\x13\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x5f\x00\x6e\x00\x7d\x00\x60\x00\x47\x00\x48\x00\x49\x00\x51\x00\x82\x00\xd7\x00\x09\x00\x64\x00\x61\x00\xd6\x00\x62\x00\x7e\x00\x63\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x83\x00\x84\x00\x85\x00\x86\x00\x64\x00\x0a\x00\x7a\x00\x60\x00\x8b\x00\x8c\x00\x65\x00\x66\x00\x82\x00\x67\x00\x2c\x00\x2d\x00\x68\x00\x69\x00\xcf\x00\x6a\x00\x63\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x83\x00\x84\x00\x85\x00\x86\x00\x64\x00\x6b\x00\x6c\x00\x60\x00\x7f\x00\x8c\x00\xd4\x00\x51\x00\x82\x00\xc7\x00\xc8\x00\xac\x00\xad\x00\x82\x00\x80\x00\x6a\x00\x63\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x60\x00\x84\x00\x85\x00\x86\x00\x64\x00\x6b\x00\x6c\x00\x85\x00\x86\x00\x58\x00\x58\x00\x85\x00\x86\x00\x63\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x6a\x00\xa7\x00\xcc\x00\xc0\x00\x64\x00\x5d\x00\x5d\x00\x82\x00\xc9\x00\xcb\x00\xbe\x00\xc2\x00\x6b\x00\x6c\x00\x81\x00\xc3\x00\xb9\x00\xc5\x00\x90\x00\x6a\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x82\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x6b\x00\x6c\x00\xb8\x00\x83\x00\x84\x00\x85\x00\x86\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\xa5\x00\x58\x00\xaa\x00\xa2\x00\x6c\x00\x58\x00\xaf\x00\x59\x00\xbb\x00\x82\x00\xd5\x00\x5b\x00\x7a\x00\x5c\x00\x56\x00\xbd\x00\x5d\x00\xa7\x00\xa8\x00\xa9\x00\x5d\x00\xbc\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x57\x00\x52\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x51\x00\x82\x00\x55\x00\xac\x00\x54\x00\x4e\x00\x4f\x00\x3b\x00\x18\x00\x42\x00\x45\x00\x4b\x00\x43\x00\x51\x00\x49\x00\x83\x00\x84\x00\x85\x00\x86\x00\x82\x00\x3c\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\xaf\x00\x4a\x00\x58\x00\x58\x00\x4c\x00\x3c\x00\x82\x00\x2a\x00\x59\x00\x74\x00\x3e\x00\xd3\x00\x5b\x00\x25\x00\x5c\x00\x75\x00\xc2\x00\x5d\x00\x5d\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x2f\x00\x35\x00\x26\x00\x8a\x00\x8b\x00\x8c\x00\x37\x00\x20\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x82\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x22\x00\x12\x00\x14\x00\x16\x00\x03\x00\x0e\x00\x06\x00\x82\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x8e\x00\x8f\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x8d\x00\x82\x00\x8f\x00\x0a\x00\x54\x00\xbe\x00\xd1\x00\xd2\x00\xd3\x00\x54\x00\xc9\x00\xce\x00\xcb\x00\xcf\x00\x58\x00\x83\x00\x84\x00\x85\x00\x86\x00\x87\x00\x88\x00\x89\x00\x8a\x00\x8b\x00\x8c\x00\x58\x00\xb5\x00\x8f\x00\xc0\x00\x5d\x00\x51\x00\x59\x00\x58\x00\x0d\x00\xc4\x00\x5b\x00\xb2\x00\x5c\x00\x59\x00\x58\x00\x5d\x00\x8f\x00\x5b\x00\x58\x00\x5c\x00\x59\x00\x0e\x00\x5d\x00\x5a\x00\x5b\x00\x58\x00\x5c\x00\x58\x00\xb3\x00\x5d\x00\x92\x00\x58\x00\x58\x00\x5d\x00\xb4\x00\xb5\x00\x58\x00\x93\x00\x58\x00\x94\x00\x5d\x00\xb8\x00\x5d\x00\x95\x00\x96\x00\x58\x00\x5d\x00\x5d\x00\x97\x00\x58\x00\x98\x00\x5d\x00\xb7\x00\x5d\x00\x58\x00\x58\x00\x58\x00\x99\x00\x22\x00\x86\x00\x5d\x00\x9a\x00\x58\x00\x58\x00\x5d\x00\xbe\x00\x9b\x00\x9c\x00\x9d\x00\x5d\x00\x5d\x00\x5d\x00\x58\x00\x58\x00\x9e\x00\x9f\x00\x7f\x00\x5d\x00\x5d\x00\x58\x00\x58\x00\x58\x00\x92\x00\xa4\x00\xa0\x00\xa1\x00\x58\x00\x5d\x00\x5d\x00\x73\x00\x58\x00\x6e\x00\x6f\x00\x73\x00\x5d\x00\x5d\x00\x5d\x00\x58\x00\x76\x00\x51\x00\xa6\x00\x5d\x00\x78\x00\xb1\x00\x71\x00\x5d\x00\x72\x00\x51\x00\x78\x00\x7b\x00\x54\x00\x10\x00\x5d\x00\x52\x00\x54\x00\x22\x00\x4e\x00\x2c\x00\x0c\x00\x45\x00\x51\x00\x0c\x00\x22\x00\x41\x00\x3a\x00\x3e\x00\x40\x00\x42\x00\x2a\x00\x2c\x00\x0c\x00\x2f\x00\x39\x00\x37\x00\x24\x00\x27\x00\x22\x00\x28\x00\x29\x00\x08\x00\x20\x00\x11\x00\x10\x00\x0c\x00\x14\x00\x16\x00\x12\x00\x08\x00\x06\x00\xff\xff\x03\x00\x00\x00\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 94) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94)
	]

happy_n_terms = 59 :: Int
happy_n_nonterms = 23 :: Int

happyReduce_1 = happyReduce 6# 0# happyReduction_1
happyReduction_1 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut5 happy_x_4 of { happy_var_4 -> 
	case happyOut9 happy_x_5 of { happy_var_5 -> 
	case happyOut13 happy_x_6 of { happy_var_6 -> 
	happyIn4
		 (Pr happy_var_2 happy_var_4 happy_var_5 happy_var_6
	) `HappyStk` happyRest}}}}

happyReduce_2 = happySpecReduce_0  1# happyReduction_2
happyReduction_2  =  happyIn5
		 ([]
	)

happyReduce_3 = happyReduce 4# 1# happyReduction_3
happyReduction_3 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { ((a, Stringa happy_var_2)) -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	case happyOut5 happy_x_4 of { happy_var_4 -> 
	happyIn5
		 ((Imp happy_var_2 (getL happy_var_3)): happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_4 = happyReduce 6# 1# happyReduction_4
happyReduction_4 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_4 of { happy_var_4 -> 
	happyIn5
		 (happy_var_4
	) `HappyStk` happyRest}

happyReduce_5 = happySpecReduce_3  2# happyReduction_5
happyReduction_5 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Stringa happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	happyIn6
		 ((Imp happy_var_1 (getL happy_var_2)) : happy_var_3
	)}}}

happyReduce_6 = happySpecReduce_0  3# happyReduction_6
happyReduction_6  =  happyIn7
		 ([]
	)

happyReduce_7 = happySpecReduce_3  3# happyReduction_7
happyReduction_7 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Stringa happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 ((Imp happy_var_1 (getL happy_var_2)) : happy_var_3
	)}}}

happyReduce_8 = happySpecReduce_0  4# happyReduction_8
happyReduction_8  =  happyIn8
		 (
	)

happyReduce_9 = happySpecReduce_2  4# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  happyIn8
		 (
	)

happyReduce_10 = happySpecReduce_0  5# happyReduction_10
happyReduction_10  =  happyIn9
		 ([]
	)

happyReduce_11 = happyReduce 5# 5# happyReduction_11
happyReduction_11 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOut9 happy_x_5 of { happy_var_5 -> 
	happyIn9
		 ((Var happy_var_3 (Id happy_var_2 ) (Valore happy_var_3 "") ValMode (getL happy_var_1)) : happy_var_5
	) `HappyStk` happyRest}}}}

happyReduce_12 = happyReduce 7# 5# happyReduction_12
happyReduction_12 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOut11 happy_x_5 of { happy_var_5 -> 
	case happyOut9 happy_x_7 of { happy_var_7 -> 
	happyIn9
		 ((Var (inferTypeVar happy_var_3 happy_var_5) (Id happy_var_2 ) happy_var_5 ValMode (getL happy_var_1)) : happy_var_7
	) `HappyStk` happyRest}}}}}

happyReduce_13 = happyReduce 7# 5# happyReduction_13
happyReduction_13 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut10 happy_x_4 of { happy_var_4 -> 
	case happyOut9 happy_x_7 of { happy_var_7 -> 
	happyIn9
		 (happy_var_4 ++ happy_var_7
	) `HappyStk` happyRest}}

happyReduce_14 = happySpecReduce_0  6# happyReduction_14
happyReduction_14  =  happyIn10
		 ([]
	)

happyReduce_15 = happyReduce 6# 6# happyReduction_15
happyReduction_15 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((a, Ident happy_var_1)) -> 
	case happyOut12 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	case happyOut11 happy_x_4 of { happy_var_4 -> 
	case happyOut10 happy_x_6 of { happy_var_6 -> 
	happyIn10
		 ((Var (inferTypeVar happy_var_2 happy_var_4) (Id happy_var_1 ) happy_var_4 ValMode (getL happy_var_3)) : happy_var_6
	) `HappyStk` happyRest}}}}}

happyReduce_16 = happyReduce 4# 6# happyReduction_16
happyReduction_16 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((a, Ident happy_var_1)) -> 
	case happyOut12 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	case happyOut10 happy_x_4 of { happy_var_4 -> 
	happyIn10
		 ((Var happy_var_2 (Id happy_var_1 ) (Valore happy_var_2 "") ValMode (getL happy_var_3)) : happy_var_4
	) `HappyStk` happyRest}}}}

happyReduce_17 = happySpecReduce_1  7# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Intero happy_var_1)) -> 
	happyIn11
		 ((Valore Integer happy_var_1)
	)}

happyReduce_18 = happySpecReduce_1  7# happyReduction_18
happyReduction_18 happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Reale happy_var_1)) -> 
	happyIn11
		 ((Valore Flt32 happy_var_1)
	)}

happyReduce_19 = happySpecReduce_1  7# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Booleano happy_var_1)) -> 
	happyIn11
		 ((Valore Bool happy_var_1)
	)}

happyReduce_20 = happySpecReduce_1  7# happyReduction_20
happyReduction_20 happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Stringa happy_var_1)) -> 
	happyIn11
		 ((Valore Str happy_var_1)
	)}

happyReduce_21 = happySpecReduce_1  7# happyReduction_21
happyReduction_21 happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Char happy_var_1)) -> 
	happyIn11
		 ((Valore Byte happy_var_1)
	)}

happyReduce_22 = happySpecReduce_0  8# happyReduction_22
happyReduction_22  =  happyIn12
		 (Void
	)

happyReduce_23 = happySpecReduce_1  8# happyReduction_23
happyReduction_23 happy_x_1
	 =  happyIn12
		 (Byte
	)

happyReduce_24 = happySpecReduce_1  8# happyReduction_24
happyReduction_24 happy_x_1
	 =  happyIn12
		 (Bool
	)

happyReduce_25 = happySpecReduce_1  8# happyReduction_25
happyReduction_25 happy_x_1
	 =  happyIn12
		 (Str
	)

happyReduce_26 = happySpecReduce_1  8# happyReduction_26
happyReduction_26 happy_x_1
	 =  happyIn12
		 (Integer
	)

happyReduce_27 = happySpecReduce_2  8# happyReduction_27
happyReduction_27 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn12
		 (Ptr happy_var_2
	)}

happyReduce_28 = happySpecReduce_1  8# happyReduction_28
happyReduction_28 happy_x_1
	 =  happyIn12
		 (Flt32
	)

happyReduce_29 = happySpecReduce_1  8# happyReduction_29
happyReduction_29 happy_x_1
	 =  happyIn12
		 (Flt64
	)

happyReduce_30 = happyReduce 4# 8# happyReduction_30
happyReduction_30 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { ((a, Intero happy_var_2)) -> 
	case happyOut12 happy_x_4 of { happy_var_4 -> 
	happyIn12
		 (Arr (read happy_var_2) happy_var_4
	) `HappyStk` happyRest}}

happyReduce_31 = happySpecReduce_0  9# happyReduction_31
happyReduction_31  =  happyIn13
		 ([]
	)

happyReduce_32 = happyReduce 9# 9# happyReduction_32
happyReduction_32 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut14 happy_x_4 of { happy_var_4 -> 
	case happyOut12 happy_x_6 of { happy_var_6 -> 
	case happyOut17 happy_x_7 of { happy_var_7 -> 
	case happyOut13 happy_x_9 of { happy_var_9 -> 
	happyIn13
		 ((SFunz (Id happy_var_2) happy_var_6 happy_var_4 happy_var_7 (getL happy_var_1)) : happy_var_9
	) `HappyStk` happyRest}}}}}}

happyReduce_33 = happySpecReduce_0  10# happyReduction_33
happyReduction_33  =  happyIn14
		 ([]
	)

happyReduce_34 = happySpecReduce_1  10# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_35 = happySpecReduce_3  11# happyReduction_35
happyReduction_35 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Ident happy_var_1)) -> 
	case happyOut12 happy_x_2 of { happy_var_2 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 ([(Par (Id happy_var_1) happy_var_2 happy_var_3)]
	)}}}

happyReduce_36 = happyReduce 5# 11# happyReduction_36
happyReduction_36 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_3 of { ((a, Ident happy_var_3)) -> 
	case happyOut12 happy_x_4 of { happy_var_4 -> 
	case happyOut16 happy_x_5 of { happy_var_5 -> 
	happyIn15
		 ((Par (Id happy_var_3) happy_var_4 happy_var_5) : happy_var_1
	) `HappyStk` happyRest}}}}

happyReduce_37 = happySpecReduce_1  12# happyReduction_37
happyReduction_37 happy_x_1
	 =  happyIn16
		 (ValResMode
	)

happyReduce_38 = happySpecReduce_1  12# happyReduction_38
happyReduction_38 happy_x_1
	 =  happyIn16
		 (ConstMode
	)

happyReduce_39 = happySpecReduce_0  12# happyReduction_39
happyReduction_39  =  happyIn16
		 (ValMode
	)

happyReduce_40 = happySpecReduce_1  12# happyReduction_40
happyReduction_40 happy_x_1
	 =  happyIn16
		 (ValMode
	)

happyReduce_41 = happyReduce 6# 13# happyReduction_41
happyReduction_41 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut20 happy_x_3 of { happy_var_3 -> 
	happyIn17
		 (happy_var_3
	) `HappyStk` happyRest}

happyReduce_42 = happyReduce 5# 14# happyReduction_42
happyReduction_42 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut20 happy_x_3 of { happy_var_3 -> 
	happyIn18
		 (happy_var_3
	) `HappyStk` happyRest}

happyReduce_43 = happyReduce 5# 15# happyReduction_43
happyReduction_43 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut22 happy_x_3 of { happy_var_3 -> 
	happyIn19
		 (happy_var_3
	) `HappyStk` happyRest}

happyReduce_44 = happySpecReduce_0  16# happyReduction_44
happyReduction_44  =  happyIn20
		 ([]
	)

happyReduce_45 = happySpecReduce_2  16# happyReduction_45
happyReduction_45 happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	case happyOut20 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (happy_var_1 : happy_var_2
	)}}

happyReduce_46 = happyReduce 7# 17# happyReduction_46
happyReduction_46 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_4 of { happy_var_4 -> 
	case happyOut23 happy_x_6 of { happy_var_6 -> 
	case happyOut17 happy_x_7 of { happy_var_7 -> 
	happyIn21
		 ((NFor happy_var_2 happy_var_4 happy_var_6 happy_var_7 (getL happy_var_1))
	) `HappyStk` happyRest}}}}}

happyReduce_47 = happySpecReduce_3  17# happyReduction_47
happyReduction_47 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 ((While happy_var_2 happy_var_3 (getL happy_var_1))
	)}}}

happyReduce_48 = happySpecReduce_2  17# happyReduction_48
happyReduction_48 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_2 of { happy_var_2 -> 
	happyIn21
		 ((While (RVal (Valore Bool "true")) happy_var_2 (getL happy_var_1))
	)}}

happyReduce_49 = happySpecReduce_3  17# happyReduction_49
happyReduction_49 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 ((SIf  happy_var_2 happy_var_3 (getL happy_var_1))
	)}}}

happyReduce_50 = happyReduce 5# 17# happyReduction_50
happyReduction_50 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	case happyOut17 happy_x_5 of { happy_var_5 -> 
	happyIn21
		 ((SIfElse happy_var_2 happy_var_3 happy_var_5 (getL happy_var_1))
	) `HappyStk` happyRest}}}}

happyReduce_51 = happyReduce 5# 17# happyReduction_51
happyReduction_51 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	case happyOut18 happy_x_3 of { happy_var_3 -> 
	case happyOut17 happy_x_5 of { happy_var_5 -> 
	happyIn21
		 ((SIfElse happy_var_2 happy_var_3 happy_var_5 (getL happy_var_1))
	) `HappyStk` happyRest}}}}

happyReduce_52 = happySpecReduce_3  17# happyReduction_52
happyReduction_52 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 ((SSw (Id happy_var_2) happy_var_3 (getL happy_var_1))
	)}}}

happyReduce_53 = happySpecReduce_1  17# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	happyIn21
		 ((SBlock happy_var_1)
	)}

happyReduce_54 = happyReduce 4# 17# happyReduction_54
happyReduction_54 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_2 of { happy_var_2 -> 
	case happyOut17 happy_x_4 of { happy_var_4 -> 
	happyIn21
		 ((STry happy_var_2 happy_var_4 (getL happy_var_1))
	) `HappyStk` happyRest}}}

happyReduce_55 = happySpecReduce_2  17# happyReduction_55
happyReduction_55 happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	happyIn21
		 ((SRExp happy_var_1 (getL happy_var_2))
	)}}

happyReduce_56 = happySpecReduce_2  17# happyReduction_56
happyReduction_56 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn21
		 ((SRetVoid (getL happy_var_1))
	)}

happyReduce_57 = happySpecReduce_3  17# happyReduction_57
happyReduction_57 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn21
		 ((SRet happy_var_2 (getL happy_var_1))
	)}}

happyReduce_58 = happySpecReduce_2  17# happyReduction_58
happyReduction_58 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn21
		 ((SContinue (getL happy_var_1))
	)}

happyReduce_59 = happySpecReduce_2  17# happyReduction_59
happyReduction_59 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn21
		 ((SBreak (getL happy_var_1))
	)}

happyReduce_60 = happyReduce 4# 17# happyReduction_60
happyReduction_60 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 ((SDic [(Var happy_var_3 (Id happy_var_2 ) (Valore happy_var_3 "") ValMode (getL happy_var_1))])
	) `HappyStk` happyRest}}}

happyReduce_61 = happyReduce 6# 17# happyReduction_61
happyReduction_61 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { ((a, Ident happy_var_2)) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOut11 happy_x_5 of { happy_var_5 -> 
	happyIn21
		 ((SDic [(Var (inferTypeVar happy_var_3 happy_var_5) (Id happy_var_2 ) happy_var_5 ValMode (getL happy_var_1))])
	) `HappyStk` happyRest}}}}

happyReduce_62 = happyReduce 6# 17# happyReduction_62
happyReduction_62 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut10 happy_x_4 of { happy_var_4 -> 
	happyIn21
		 ((SDic happy_var_4)
	) `HappyStk` happyRest}

happyReduce_63 = happySpecReduce_0  18# happyReduction_63
happyReduction_63  =  happyIn22
		 ([]
	)

happyReduce_64 = happyReduce 6# 18# happyReduction_64
happyReduction_64 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut20 happy_x_4 of { happy_var_4 -> 
	case happyOut22 happy_x_6 of { happy_var_6 -> 
	happyIn22
		 ((SCase happy_var_2 happy_var_4 (getL happy_var_1)) : happy_var_6
	) `HappyStk` happyRest}}}}

happyReduce_65 = happyReduce 4# 18# happyReduction_65
happyReduction_65 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut20 happy_x_3 of { happy_var_3 -> 
	happyIn22
		 ([(SCase (Valore Void "") happy_var_3 (getL happy_var_1))]
	) `HappyStk` happyRest}}

happyReduce_66 = happySpecReduce_3  19# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((MathExp "+" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_67 = happySpecReduce_3  19# happyReduction_67
happyReduction_67 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((MathExp "-" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_68 = happySpecReduce_3  19# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((MathExp "*" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_69 = happySpecReduce_3  19# happyReduction_69
happyReduction_69 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((MathExp "/" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_70 = happySpecReduce_3  19# happyReduction_70
happyReduction_70 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((MathExp "^" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_71 = happySpecReduce_3  19# happyReduction_71
happyReduction_71 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((RelExp "<" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_72 = happySpecReduce_3  19# happyReduction_72
happyReduction_72 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((RelExp "<=" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_73 = happySpecReduce_3  19# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((RelExp ">" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_74 = happySpecReduce_3  19# happyReduction_74
happyReduction_74 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((RelExp ">=" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_75 = happySpecReduce_3  19# happyReduction_75
happyReduction_75 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((RelExp "==" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_76 = happySpecReduce_3  19# happyReduction_76
happyReduction_76 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((RelExp "!=" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_77 = happySpecReduce_3  19# happyReduction_77
happyReduction_77 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((BoolExp "or" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_78 = happySpecReduce_3  19# happyReduction_78
happyReduction_78 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((BoolExp "and" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_79 = happySpecReduce_3  19# happyReduction_79
happyReduction_79 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((BoolExp "xor" happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_80 = happySpecReduce_3  19# happyReduction_80
happyReduction_80 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn23
		 ((RE happy_var_2)
	)}

happyReduce_81 = happySpecReduce_2  19# happyReduction_81
happyReduction_81 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn23
		 ((UnOp "-" happy_var_2 (getL happy_var_1))
	)}}

happyReduce_82 = happySpecReduce_2  19# happyReduction_82
happyReduction_82 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn23
		 ((UnOp "!" happy_var_2 (getL happy_var_1))
	)}}

happyReduce_83 = happySpecReduce_1  19# happyReduction_83
happyReduction_83 happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 ((LRExp happy_var_1)
	)}

happyReduce_84 = happySpecReduce_3  19# happyReduction_84
happyReduction_84 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((Assg happy_var_1 happy_var_3 (getL happy_var_2))
	)}}}

happyReduce_85 = happyReduce 4# 19# happyReduction_85
happyReduction_85 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((a, Ident happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut24 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 ((FCall (Id happy_var_1) happy_var_3 (getL happy_var_2))
	) `HappyStk` happyRest}}}

happyReduce_86 = happySpecReduce_2  19# happyReduction_86
happyReduction_86 happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_2 of { happy_var_2 -> 
	happyIn23
		 ((DPunt happy_var_2)
	)}

happyReduce_87 = happySpecReduce_1  19# happyReduction_87
happyReduction_87 happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 ((RVal happy_var_1)
	)}

happyReduce_88 = happySpecReduce_0  20# happyReduction_88
happyReduction_88  =  happyIn24
		 ([]
	)

happyReduce_89 = happySpecReduce_1  20# happyReduction_89
happyReduction_89 happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	happyIn24
		 (happy_var_1
	)}

happyReduce_90 = happySpecReduce_1  21# happyReduction_90
happyReduction_90 happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	happyIn25
		 ([happy_var_1]
	)}

happyReduce_91 = happySpecReduce_3  21# happyReduction_91
happyReduction_91 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn25
		 (happy_var_3 : happy_var_1
	)}}

happyReduce_92 = happySpecReduce_1  22# happyReduction_92
happyReduction_92 happy_x_1
	 =  case happyOutTok happy_x_1 of { ((a, Ident happy_var_1)) -> 
	happyIn26
		 ((LID (Id happy_var_1))
	)}

happyReduce_93 = happySpecReduce_2  22# happyReduction_93
happyReduction_93 happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn26
		 ((LPunt happy_var_2)
	)}

happyReduce_94 = happyReduce 4# 22# happyReduction_94
happyReduction_94 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut26 happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn26
		 ((LVett happy_var_1 happy_var_3)
	) `HappyStk` happyRest}}

happyNewToken action sts stk [] =
	happyDoAction 58# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	(a, Package) -> cont 1#;
	(a, Import) -> cont 2#;
	(a, DVar) -> cont 3#;
	(a, Func) -> cont 4#;
	(a, End) -> cont 5#;
	(a, OpenR) -> cont 6#;
	(a, CloseR) -> cont 7#;
	(a, OpenQ) -> cont 8#;
	(a, CloseQ) -> cont 9#;
	(a, OpenG) -> cont 10#;
	(a, CloseG) -> cont 11#;
	(a, Comma) -> cont 12#;
	(a, Semicol) -> cont 13#;
	(a, Col) -> cont 14#;
	(a, Try) -> cont 15#;
	(a, Catch) -> cont 16#;
	(a, Return) -> cont 17#;
	(a, Uguale) -> cont 18#;
	(a, Ident happy_dollar_dollar) -> cont 19#;
	(a, Booleano happy_dollar_dollar) -> cont 20#;
	(a, Intero happy_dollar_dollar) -> cont 21#;
	(a, Reale happy_dollar_dollar) -> cont 22#;
	(a, Stringa happy_dollar_dollar) -> cont 23#;
	(a, Char happy_dollar_dollar) -> cont 24#;
	(a, TRune) -> cont 25#;
	(a, TBool) -> cont 26#;
	(a, TInt) -> cont 27#;
	(a, TStr) -> cont 28#;
	(a, Ast) -> cont 29#;
	(a, TFloat32) -> cont 30#;
	(a, TFloat64) -> cont 31#;
	(a, Val) -> cont 32#;
	(a, Valres) -> cont 33#;
	(a, Cnst) -> cont 34#;
	(a, For) -> cont 35#;
	(a, If) -> cont 36#;
	(a, Else) -> cont 37#;
	(a, Switch) -> cont 38#;
	(a, Case) -> cont 39#;
	(a, Default) -> cont 40#;
	(a, Continue) -> cont 41#;
	(a, Break) -> cont 42#;
	(a, Plus) -> cont 43#;
	(a, Minus) -> cont 44#;
	(a, Div) -> cont 45#;
	(a, Pow) -> cont 46#;
	(a, OpEq) -> cont 47#;
	(a, OpNEq) -> cont 48#;
	(a, OpDiseqL) -> cont 49#;
	(a, OpDiseqLE) -> cont 50#;
	(a, OpDiseqG) -> cont 51#;
	(a, OpDiseqGE) -> cont 52#;
	(a, And) -> cont 53#;
	(a, Or) -> cont 54#;
	(a, Xor) -> cont 55#;
	(a, Not) -> cont 56#;
	(a, DePunt) -> cont 57#;
	_ -> happyError' (tk:tks)
	}

happyError_ 58# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [((Info,Token))] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parseProgram tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut4 x))

happySeq = happyDontSeq


main = do
	inStr <- getContents
	let pParsed = parseProgram (alexScanTokens inStr)
	let errList = typeCheck pParsed
	putStrLn ""
	if all (=="[WARN]") (map (take 6) errList) || errList == [] then do
		writeFile "prettyPrintedFile.txt" (prettyPrint pParsed)
		putStrLn $ show pParsed
		putStrLn "--INIZIO STAMPA TAC--"
		putStr $ show $ Tac.createTac pParsed
		putStrLn "--FINE TAC--"
	else (writeList errList)
	where
		writeList [] = putStrLn "-- Fine --"
		writeList (x:xs) = (putStrLn x) >> (writeList xs)
{-
		writeColor x = if (take 6 x) == "[WARN]" then colorPutStrLn Yellow x 
			else putStrLn x

colorPutStrLn :: Color -> String -> IO ()
colorPutStrLn color str = do
    setSGR  [ SetColor Foreground Dull color
            , SetConsoleIntensity NormalIntensity
            ]
    putStrLn str
    setSGR []

-}

getL ((_,line, _),_) = line
getS (_,s) = s

-- error reporting
parseError (((c,l,s), Lundef):xs) = error $ "Lexical error at : "++show(l)++","++show(c)++", near: "++s
parseError (((c,l,s), _ ):xs) = error $ "Syntax error at : "++show(l)++","++show(c)++" near: "++s

inferTypeVar (Arr i t1) v = (Arr i (inferTypeVar t1 v))
inferTypeVar t v | t == Void = faux v
				
			   	 | otherwise = t
	where
		faux (Valore t _) = t
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList





{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	(happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
	= {- nothing -}


	  case action of
		0#		  -> {- nothing -}
				     happyFail i tk st
		-1# 	  -> {- nothing -}
				     happyAccept i tk st
		n | (n Happy_GHC_Exts.<# (0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

				     (happyReduceArr Happy_Data_Array.! rule) i tk st
				     where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
		n		  -> {- nothing -}


				     happyShift new_state i tk st
				     where (new_state) = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where (off)    = indexShortOffAddr happyActOffsets st
         (off_i)  = (off Happy_GHC_Exts.+# i)
	 check  = if (off_i Happy_GHC_Exts.>=# (0# :: Happy_GHC_Exts.Int#))
			then (indexShortOffAddr happyCheck off_i Happy_GHC_Exts.==#  i)
			else False
         (action)
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st

{-# LINE 130 "templates/GenericTemplate.hs" #-}


indexShortOffAddr (HappyA# arr) off =
	Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 163 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let (i) = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
	 sts1@((HappyCons (st1@(action)) (_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@((HappyCons (st1@(action)) (_)))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@((HappyCons (st1@(action)) (_)))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

             (off) = indexShortOffAddr happyGotoOffsets st1
             (off_i) = (off Happy_GHC_Exts.+# nt)
             (new_state) = indexShortOffAddr happyTable off_i




happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where (off) = indexShortOffAddr happyGotoOffsets st
         (off_i) = (off Happy_GHC_Exts.+# nt)
         (new_state) = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 0# tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
	happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
