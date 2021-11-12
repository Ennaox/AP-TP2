all: exe scal_exe vect_exe

compil_all: nbody0 scalar_nbody0 vect_nbody0

exe: nbody0
	taskset -c 3 ./nbody0 > out0.dat

scal_exe: scalar_nbody0
	taskset -c 3 ./scalar_nbody0 > out0_sd.dat

vect_exe: vect_nbody0
	taskset -c 3 ./vect_nbody0 > out0_pd.dat

nbody0: nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

vect_nbody0: vect_nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

scalar_nbody0: scalar_nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

clean:
	rm -Rf *~ nbody0
