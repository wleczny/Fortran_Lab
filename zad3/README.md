# Zadanie z Fortrana z funkcji calkujacych

## Organizacja plikow

### Katalog /src
 - functions.f90 - program, zawierajacy w sobie definicje funkcji, ktore beda calkowane <br/>
 - integrate_functions.f90 - modul, ktory zawiera definicje funkcji calkujacych <br/>
 - main.f90 - program, ktory wykonuje funkcje calkujace zdefiniowane w integrate_functions.f90 na funkcjach z functions.f90. W miedzyczasie program zapisuje do plikow tekstowych wyniki tych operacji. Program korzysta z coarrays, aby wykonywac obliczenia wspolbieznie.<br/>
 - Makefile - plik sluzacy do zbudowania projektu.<br/>

### Katalog /res
 - gauss_res.txt - wyniki calkowania gaussa<br/>
  - rectangle_res.txt - wyniki calkowania metoda prostokatow<br/>
 - trapezoid_res.txt - wyniki calkowania metoda trapezow<br/>
 - table.png - tabela zawierajaca wszystkie wyniki calkowania wraz z roznica miedzy nimi a wynikiem calki numerycznej (numeric)<br/>

### Wykonanie programu
Po kompilacji programu tworzone sa wszytskie pliki tekstowe.<br/>

Nastepnie na ich podstawie zrealizowalem tabele:<br/>
**table.png**</br>
![wykres7](res/table.png)
<br/>

### Wnioski
Metoda prostokatow dala lepsze rezultaty od metody trapezow. Wyniki calkowania metoda Gaussa daly bardzo niedokladne rezultaty - mozliwe ze jest to blad implementacji, lecz nie umialem go znalezc.