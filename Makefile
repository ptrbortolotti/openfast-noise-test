ifeq ($(OS),Windows_NT)
	OS=Windows
	RMDIR=rmdir /S /Q
	EXEEXT='.exe'
else
    OS=$(shell uname -s)
	RMDIR=rm -rf
endif
BUILD_DIR=build$(suffix)

all: test

_outputs-OF2:
	mkdir  _outputs-OF2

_outputs-F8:
	mkdir  _outputs-F8

test: _outputs-OF2
	@rm -f  _outputs-OF2/*
	./openfast$(EXEEXT) Test18_OF2.fst
	mv 5MW_Baseline/AAOutput* _outputs-OF2
	mv *.out                  _outputs-OF2/
	mv *.sum                  _outputs-OF2/
	mv *.txt                  _outputs-OF2/
	mv fort.*                 _outputs-OF2/
	mv *.bin                  _outputs-OF2/

testf8: _outputs-F8
	@rm -f  _outputs-F8/*
	./fast8$(EXEEXT) Test18_F8.fst
	mv 5MW_Baseline/AAOutput* _outputs-F8/
	mv *.out                  _outputs-F8/
	mv *.sum                  _outputs-F8/
	mv *.txt                  _outputs-F8/
	mv fort.*                 _outputs-F8/
	mv *.bin                  _outputs-F8/

