ADA = src/ada
FOR = src/fortran
C = src/c

all : adaIter adaRec fortranRec fortranIter cIter cRec clean

adaIter: $(ADA)/iterative.adb $(ADA)/stack.adb $(ADA)/stack.ads
	gnatmake $(ADA)/iterative.adb -o bin/AdaIter

adaRec: $(ADA)/recursive.adb
	gnatmake $(ADA)/recursive.adb -o bin/AdaRec

fortranIter: $(FOR)/iterative.f95
	gfortran $(FOR)/iterative.f95 -o bin/FortranIder

fortranRec: $(FOR)/recursive.f95
	gfortran $(FOR)/recursive.f95 -o bin/FortranRec

cIter: $(C)/iterative.c
	gcc -Wall $(C)/iterative.c -o bin/CIter

cRec: $(C)/recursive.c
	gcc -Wall $(C)/recursive.c -o bin/CRec

clean:
	rm -f *.o *.ali *.mod
