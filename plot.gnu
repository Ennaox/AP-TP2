set term png size 1280,720

set output "plot.png"

set grid

set ylabel "Latency in cycles"

set xlabel "Simulation iteration"

plot "out0.dat" t "C version" w l, "out0_sd.dat" t "SSE scalar" w l, "out0_pd.dat" t "SSE packed" w l
