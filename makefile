all: exe scal_exe vect_exe

exe: nbody0
	taskset -c 4 ./nbody0 > out0.dat

scal_exe: scalar_nbody0
	taskset -c 4 ./scalar_nbody0 > out0_sd.dat

vect_exe: vect_nbody0
	taskset -c 4 ./vect_nbody0 > out0_pd.dat

soa_exe: soa_nbody0
	taskset -c 4 ./soa_nbody0 > out0_soa.dat

nbody0: nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

vect_nbody0: vect_nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

scalar_nbody0: scalar_nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

soa_nbody0: soa_nbody0.c
	gcc -g -Ofast -funroll-loops -finline-functions -ftree-vectorize $< -o $@ -lm -lSDL2 

clean:
	rm -Rf *~ nbody0
