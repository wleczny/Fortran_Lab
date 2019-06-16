all: comp test plot

sumsignals:
	ifort -o sumsignals sumsignals.f90 -Ldirectory -lfftw3
	./sumsignals

noisermv:
	ifort -o noiser noiser.f90 -Ldirectory -lfftw3
	./noisermv

comp:
	ifort -o sumsignals sumsignals.f90 -Ldirectory -lfftw3
	ifort -o noiser noiser.f90 -Ldirectory -lfftw3

test:
	./sumsignals
	./noiser

plot:
	bash gnuplot.sh
