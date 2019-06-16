# Zadanie z Fortrana majace na celu porownanie szybkosci dzialan funkcji mnozacych macierze

## Organizacja plikow
W katalogu /src znajduje sie plik CMake oraz fragmety kodu napisenego w Fortranie:<br/>
-3 moduly (naivemath.F90, bettermath.F90 i dotmath.F90) - kazdy z nich odpowiada za inny sposob mnozenia macierzy <br/>
-program glowny (main.F90) - sprawdza i zapisuje do plikow tesktowych czasy wykonywania sie mnozenia macierzy (w zaleznosci od sposobu mnozenia i wielkosci macierzy)<br/>

W katalogu /res znajduja sie:<br/>
-pliki tekstowe z wynikami pomiarow utworzone przez program glowny (main.F90)<br/>
-pliki pdf zawierajace wykresy pomiarow utworzone za pomaca programu gnuplot<br/>

## Sposoby mnozenia
-naivmull - zwykle mnozenie macierzy, ktore przechodzi po wierszach macierzy<br/>
-bettmull - to samo co naiv_mul tyle ze przechodzi po kolumnach macierzy (skuteczniejszy, poniewaz w Fortran-ie macierz przechowywana jest kolumnami<br/>
-dotmull - podobnie jak naiv mul, tylko korzysta z wbudowanej funkcji dot_product, ktora sluzy do mnozenia skalarnego 2 wektorow<br/>
-matmul - wbudowana funkcja, ktora sluzy do mnozenia 2 macierzy przez siebie<br/>

## Wyniki
Ponizej widoczne sa wykresy (odpowiednio dla kind = 4, 8, 16)<br/>
![wykres4](res/wykres4.png)
![wykres4](res/wykres8.png)
![wykres4](res/wykres16.png)

## Wnioski
Na pierwszych 2 (kind = 4 i kind = 8) wykresach wyraznie widac ze od pewnej wielkosci macierzy hierarchia szybkosci mnozenia reprezentuje sie tak (od najszybszego do najwolnieszego):<br/>
-matmul<br/>
-bettmull<br/>
-dotmull<br/>
-naivmull<br/>
<br/>
Na 3 wykresie (kind = 16) mozemy powiedziec o takiej samej hierarchii, ale z tym wyjatkiem, ze od pewnej wielkosci macierzy matmul i bettmull nachodza na siebie

## Sposoby mnozenia
-naivmull - zwykle mnozenie macierzy, ktore przechodzi po wierszach macierzy<br/>
-bettmull - to samo co naiv_mul tyle ze przechodzi po kolumnach macierzy (skuteczniejszy, poniewaz w Fortran-ie macierz przechowywana jest kolumnami<br/>
-dotmull - podobnie jak naiv mul, tylko korzysta z wbudowanej funkcji dot_product, ktora sluzy do mnozenia skalarnego 2 wektorow<br/>
-matmul - wbudowana funkcja, ktora sluzy do mnozenia 2 macierzy przez siebie<br/>

## Wyniki
Ponizej widoczne sa wykresy (odpowiednio dla kind = 4, 8, 16)<br/>
![wykres4](res/wykres4.png)
![wykres4](res/wykres8.png)
![wykres4](res/wykres16.png)

## Wnioski
Na pierwszych 2 (kind = 4 i kind = 8) wykresach wyraznie widac ze od pewnej wielkosci macierzy hierarchia szybkosci mnozenia reprezentuje sie tak (od najszybszego do najwolnieszego):<br/>
-matmul<br/>
-bettmull<br/>
-dotmull<br/>
-naivmull<br/>
<br/>
Na 3 wykresie (kind = 16) mozemy powiedziec o takiej samej hierarchii, ale z tym wyjatkiem, ze od pewnej wielkosci macierzy matmul i bettmull nachodza na siebie
