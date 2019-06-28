all: shared test

shared:
	ifort integrate_functions.f90 functions.f90 -std08 main.f90 -o main -coarray=shared

distributed:
	ifort integrate_functions.f90 functions.f90 -std08 main.f90 -o main -coarray=distributed

test:
	./main

