# Zadanie z Fortrana z szybkiej transformacji Fouriera

## Organizacja plikow

### Katalog /src
	- fftw3.f03 - plik biblioteczny, w ktorym zadeklarowane sa funkcje pomocne przy wykonywaniu fft<br/>
	- sumsignals.f90 - program, ktory sumuje ze soba funkcje sin(2*π*t*200) oraz 2*sin(2*π*t*400). Nastepnie program wykonuje fft na wczesniej otrzymanej sumie. W miedzyczasie program zapisuje do plikow tekstowych dane, na podstawie ktorych beda tworzone wykresy.<br/>
	- noiser.f90 - program, ktory zaburza sygnal cos(t) dodajac do niego losowa wartosc z zakresu od 0 do 1 i wykonuje na nim fft. Nastepnie pozbywa sie zaklocen poprzez wyzerowanie wszytskich wartosci, ktore wynosza ponizej 50. Na takich danych wykonywana jest odwrotna transformacja Fouriera. W miedzyczasie program zapisuje do plikow tekstowych dane, na podstawie ktorych beda tworzone wykresy.<br/>
	- gnuplot.sh - program, ktory tworzy wykresy w formacie png na podstawie wczesniej wygenerowanych danych.<br/>
	- Makefile - plik sluzacy do zbudowania projektu.<br/>

### Katalog /res
	- sum.txt - plik tekstowy zawierajacy wspolrzedne punktow sumy dwoch funkcji sinus<br/>
	- plot_sum.png - wykres odpowiadajacy danym z pliku sum.txt<br/>
	- fft.txt - plik tekstowy zawierajacy wspolrzedne punktow po przeprowadzaniu na powyzszej sumie fft<br/>
	- plot_fft.png - wykres odpowiadajacy danym z pliku fft.txt<br/>
	- cos.txt - plik tekstowy zawierajacy wspolrzedne punktow funkcji cosinus<br/>
	- plot_cos.png - wykres odpowiadajacy danym z pliku cos.txt<br/>
	- noisy.txt - plik tekstowy zawierajacy wspolrzedne punktow zaburzonego sygnalu cosinus<br/>
	- plot_noisy.png - wykres odpowiadajacy danym z pliku noisy.txt<br/>
	- noisyFft.txt - plik tekstowy zawierajacy wspolrzedne punktow po przeprowadzaniu fft na powyzszym sygnale<br/>
	- plot_noisyFft.png - wykres odpowiadajacy danym z pliku noisyFft.txt<br/>
	- clearedFft.txt - plik tekstowy zawierajacy wspolrzedne punktow po wyczyszczeniu sygnalu.<br/>
	- plot_clearedFft.png - wykres odpowiadajacy danym z pliku clearedFft.txt<br/>
	- cleared.txt - plik tekstowy zawierajacy wspolrzedne punktow po przeprowadzeniu odwrotnej transformacji Fouriera.<br/>
	- plot_cleared.png - wykres odpowiadajacy danym z pliku cleared.txt<br/>


### Wykonoanie programu
	Po kompilacji programu tworzone sa wszytskie pliki tekstowe i oraz wykresy:<br/>
<br/>
**plot_sum.png**
![wykres1](res/sum.png)
<br/>
**plot_fft.png**
![wykres2](res/plot_fft.png)
<br/>
**plot_cos.png**
![wykres3](res/plot_cos.png)
<br/>
**plot_noisy.png**
![wykres4](res/plot_noisy.png)
<br/>
**plot_noisyFft.png**
![wykres5](res/plot_noisyFft.png)
<br/>
**plot_clearedFft.png**
![wykres6](res/plot_clearedFft.png)
<br/>
**plot_cleared.png**
![wykres7](res/plot_cleared.png)
<br/>

### Wnioski
Dzieki fft i odwrotnej fft jestesmy wstanie odszumic sygnal i pozbyc sie wszystkich szumow. Nalezy pamietac o odpowiednim doborze czestosci probek sygnalu. 

