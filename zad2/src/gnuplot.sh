
for i in fft noisyFft clearedFft
do
    gnuplot -e    "set terminal png size 1200,800;    set xlabel 'Frequency';    set ylabel 'Intensity';     set grid;    set output '../res/plot_$i.png';    plot '../res/$i.txt' with lines";
    done
for i in sum cos noisy cleared
do
    gnuplot -e    "set terminal png size 1200,800;    set xlabel 'Time';    set ylabel 'Value';     set grid;    set output '../res/plot_$i.png';    plot '../res/$i.txt' with lines";
done
