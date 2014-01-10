
all: compile
	

compile: Lexer.hs Main.hs
	ghc Main.hs

Main.hs: Main.y
	happy -gcai Main.y

Lexer.hs: Lexer.x
	alex Lexer.x

.PHONY: clean
clean:
	rm *.hi

demoTac:
	./Main < TestTAC
demo:
	./Main < incrementalTest
# DO NOT DELETE: Beginning of Haskell dependencies
GeneralAbs.o : GeneralAbs.hs
Lexer.o : Lexer.hs
Dati.o : Dati.hs
Dati.o : GeneralAbs.hi
Function.o : Function.hs
Function.o : Dati.hi
Function.o : GeneralAbs.hi
PrettyPrint.o : PrettyPrint.hs
PrettyPrint.o : Dati.hi
PrettyPrint.o : GeneralAbs.hi
Tac.o : Tac.hs
Tac.o : Dati.hi
Tac.o : GeneralAbs.hi
Main.o : Main.hs
Main.o : Tac.hi
Main.o : PrettyPrint.hi
Main.o : Function.hi
Main.o : GeneralAbs.hi
Main.o : Lexer.hi
Main.o : Dati.hi
# DO NOT DELETE: End of Haskell dependencies
