########################################################
#	Makefile for Solving Ax=b
#	Written by Brian Vargas, AMS 209, UCSC
#	Adapted from Professor Dongwook Lee
########################################################

FC	= gfortran

FFLAGS_DEBUG = -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=all -fbacktrace

FFLAGS_OPT = -ggdb -O3 -fdefault-real-8 -fdefault-double-8 -ffree-line-length-none -Wuninitialized

EXE_FILE = linear_solve.exe

OBJS = 	LU_decomp.o \
	write_data.o \
	linear_solve.o \
	forward_solve.o \
	backward_solve.o \
	write_to_screen.o

.PHONY: clean
########################################################
#COMPILING AND LINKING USING GENERIC SUFFIX RULE FOR F90

$(EXE_FILE) : $(OBJS)
	@$(FC) $(FFLAGS_OPT) $(OBJS) -o $(EXE_FILE)
	@echo "Code is now linking..."

#LET'S APPLY GENERIC SUFFIX RULE HERE FOR FORTRAN 90

#method 2 using inference rule
%.o: %.f90
	$(FC) $(FFLAGS_OPT) -c $<

########################################################
#SOME USEFUL COMMANDS
clean:
	@rm -f *.o *.mod *~ linear_solve.exe

#debug: clean
debug: FFLAGS_OPT = $(FFLAGS_DEBUG)
debug: $(EXE_FILE)

########################################################
#LET'S DEFINE SOME MODULE DEPENDENCIES:
linear_solve.o: forward_solve.o backward_solve.o write_to_screen.o write_data.o LU_decomp.o

########################################################
