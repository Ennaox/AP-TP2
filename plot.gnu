set term png size 1900,1000

set output "plot.png"

set grid

set ylabel "Latency in cycles"

set xlabel "Simulation iteration"

plot "out0.dat" t "C version" w lp, "out0_sd.dat" t "SSE scalar" w lp, "out0_pd.dat" t "SSE packed" w lp
