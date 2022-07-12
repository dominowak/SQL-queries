--Przedstawienie danych zawartych w ka�dej tabeli
SELECT * FROM CenyProduktow
SELECT * FROM Dostawa
SELECT * FROM DostawaProduktow
SELECT * FROM Dostawcy

SELECT * FROM KartaStalegoKlienta
SELECT * FROM KategorieProduktow

SELECT * FROM Klienci
SELECT * FROM Pracownicy
SELECT * FROM Produkty

SELECT * FROM PromocjaZakupowSklepStacjonarny
SELECT * FROM PromocjaZamowienieOnline
SELECT * FROM Promocje

SELECT * FROM RodzajDostawy
SELECT * FROM ZakupySklepOnline
SELECT * FROM ZakupySklepOnlineProdukt
SELECT * FROM ZakupySklepStacjonarny
SELECT * FROM ZakupySklepStacjonarnyProdukt
SELECT * FROM Zwroty

--Wyszukaj klient�w, kt�rych email zaczyna si� od litery 'K', uszereguj ich alfabetycznie wed�ug nazwiska
SELECT * FROM Klienci WHERE email Like 'K%' ORDER BY Nazwisko
--Wyszukaj klient�w, kt�rych email ko�czy si� na 's.com', od najm�odszego do najstarszego
SELECT * FROM Klienci WHERE email Like '%s.com' ORDER BY Wiek

--Wyszukaj bez powt�rze� imiona klient�w
SELECT DISTINCT Imie FROM Klienci
--Wyszukaj imiona kobiet w�r�d klient�w
SELECT DISTINCT Imie FROM Klienci WHERE RTRIM(Imie) LIKE '%a' OR Imie  LIKE 'Nancy' OR Imie LIKE 'Robyn'
--Wyszukaj imiona m�czyzn w�r�d klient�w
SELECT DISTINCT Imie FROM Klienci WHERE RTRIM(Imie) NOT LIKE '%a' AND Imie NOT LIKE 'Nancy' AND Imie NOT LIKE 'Robyn'

--Wyszukaj klient�w, kt�rych imi� ma na pierwszym i trzecim miejscu liter� 'a'
SELECT * FROM Klienci WHERE Imie Like 'A%A%'
--Wyszukaj klient�w, kt�rych imi� ma na pierwszym i trzecim miejscu liter� 'a' oraz s� w wieku pomi�dzy 40 a 50 lat
SELECT * FROM Klienci WHERE Imie Like 'A%A%' AND Wiek BETWEEN 40 AND 55
--Wyszukaj klient�w, kt�rych nazwisko ko�czy si� na liter� 'i', mieszkaj� w Gdyni oraz s� w wieku pomi�dzy 30 a 55 lat
SELECT * FROM Klienci WHERE Nazwisko Like '%I' AND Miasto = 'Gdynia' AND Wiek BETWEEN 30 AND 55
--Wyszukaj klient�w kt�rych nazwiska ko�cz� si� na liter� z zakresu b-c, uszereguj ich wed�ug miasta zamieszkania
SELECT * FROM Klienci WHERE Nazwisko LIKE '%[b-c]' ORDER BY Miasto
--Wyszukaj klient�w, kt�rzy maj� trzyliterowe nazwisko
SELECT * FROM Klienci WHERE Nazwisko LIKE '___'
--Wy�wietli� klient�w z nazwiskiem sk�adaj�cym si� z 6 liter - uszeregowa� ich w odwrotnej kolejnosci alfabetycznej
SELECT IdKlienci, Imie, Nazwisko FROM Klienci WHERE Nazwisko LIKE '______' ORDER BY Nazwisko DESC

--Wyszukaj klient�w, kt�rzy mieszkaj� na uliczy zaczynaj�cej si� na 'za' i mieszkaj� w Gdyni
SELECT * FROM Klienci WHERE Ulica Like '%Za%' AND Miasto = 'Gdynia'
--Wyszukaj klient�w, kt�rzy mieszjaj� na ulicy zaczynaj�cej si� na liter� 'k' oraz numerze ulicy pomi�dzy 20 a 30
SELECT * FROM Klienci WHERE Ulica Like 'K%' AND NumerUlicy BETWEEN 20 AND 30
--Wyswietl klient�w, kt�rych nazwiska zaczynaj� si� na litery od M do Z i mieszkaj� w Gdyni, uszereguj ich wed�ug ulicy
SELECT * FROM Klienci WHERE RTRIM(Nazwisko) LIKE '[M-Z]%' AND Miasto LIKE 'Gdynia' ORDER BY Ulica
--Wyszukaj bez powt�rze� miasta zamieszkania klientow
SELECT DISTINCT Miasto FROM Klienci

--Wyszukaj pracownik�w, kt�rzy zostali zatrudnieni od 1 listopada 2015 lub p�niej i maj� premi� ponad 20, od najwy�szej pensji podstawowej do najwy�szej
SELECT * FROM Pracownicy WHERE DataZatrudnienia > '2015-11-01 00:00:00.000' AND Premia > 20 ORDER BY PensjaPodstawowa
--Wyszukaj pracownik�w, kt�rych pensja podstawowa wynosi pomi�dzy 2000 a 3000, od najwy�szej pensji podstawowej do najwy�szej
SELECT * FROM Pracownicy WHERE PensjaPodstawowa BETWEEN 2000 AND 3000 ORDER BY PensjaPodstawowa
--Wyszukaj pracownik�w, kt�rzy dostaj� premi� ni�sz� ni� 40, ale nie wynosz�c� 20 
SELECT * FROM Pracownicy WHERE Premia != 20 AND Premia < 40;
--Wyszukacj pracownik�w, kt�rzy zarabiaj� minimum 3000 przy jednoczesnej premii wynosz�cej minimum 30. Jako alternatywny warunek wyszukaj najnowszych, najmniejefektywnych pracownik�w - 
--takich, kt�rzy s� zatrudnieni od 2017 roku i maj� premi� poni�ej 15
SELECT * FROM Pracownicy WHERE (Premia >=30 AND PensjaPodstawowa >= 3000)
OR DataZatrudnienia >= '2017-01-01 00:00:00.000' AND Premia <15
ORDER BY PensjaPodstawowa

--Wyszukaj produk�w, kt�re kosztuj� wi�cej ni� 300 i uszereguj je od najdro�szego do najta�szego
SELECT * FROM Produkty WHERE Cena > 3000 ORDER BY Cena DESC
--Wyszukaj produkty, kt�rych cena jest pomi�dzy 1000 a 2000, uszereguj je od najdroszego do najta�szego
SELECT * FROM Produkty WHERE Cena >= 1000 AND Cena <= 2000 ORDER BY Cena DESC
--Wyszukaj produkty, kt�re sk�adaj� si� z przynajmniej 5 oddzielnych znak�w (s��w, liter, oznacze� itp.)
SELECT DISTINCT Nazwa FROM Produkty WHERE Nazwa Like '% % % % %'

--Wyszukaj ile jest rodzaj�w produk�w, bez powt�rze�
SELECT DISTINCT IdProduktu FROM CenyProduktow
--Wyszukaj cen produkt�w, kt�re by�y aktualne w sklepie od 1 stycznia 2020 r. i by�y powy�ej 1000
SELECT * FROM CenyProduktow WHERE DataOd = '2020-01-01 00:00:00.000' AND Cena > 1000
--Wyszukaj cen produkt�w, kt�re by�y aktualne w sklepie do 1 wrze�nia 2020 r. i by�y poni�ej 1000
SELECT * FROM CenyProduktow WHERE DataDo > '2020-09-01 00:00:00.000' AND Cena < 1000

--Wyszukaj dostaw, kt�re by�y realizowane po 1 czerwca 2020 r. i obs�ugiwane przez pracownik�w o numerach id pomi�dzy 8 i 14
SELECT * FROM Dostawa WHERE DataDostawy > '2020-06-01' AND IdPracownicy BETWEEN 8 AND 14
--Wyszukaj dostaw, kt�re by�y dostarczane przez dostawc� numer 1 i obs�ugiwane przez pracownika o numerze id = 11
SELECT * FROM Dostawa WHERE IdDostawcy = 1 AND IdPracownicy = 11 
--Wyszukaj dostaw produkt�w, dla produkt�w o id pomi�dzy 10 i 30, dla numer�w dostaw powy�ej 20 oraz cenie za sztuk� powy�ej 300
SELECT * FROM DostawaProduktow WHERE IdProduktu BETWEEN 10 AND 30 AND NumerDostawy>20 AND CenaZaSztuke>300
--Wyszukaj dostaw, kt�re by�y obs�ugiwane przez pracownik�w 1, 5, 6
SELECT * FROM Dostawa WHERE IdPracownicy IN (1,5,6)

--Wy�wietl komentarze do zam�wie� ze sklepu online, kt�re s� d�u�sze ni� 2 znaki
SELECT * FROM ZakupySklepOnline WHERE LEN(Komentarz) > 2
--Wy�wietl komentarze do zam�wie� ze sklepu stacjonarnego, kt�re s� d�u�sze ni� 1 znak
SELECT * FROM ZakupySklepStacjonarny WHERE LEN(Komentarz) > 1

--Wyswietl IdProduktu, nazw� produnktu, d�ugo�� nazwy produktu, miejsce litery '�' w nazwie i cen� produktu. Uszereguj produkty wed�ug miejsca litery '�' oraz ceny rosn�co
SELECT IdProdukty, Nazwa, LEN(Nazwa) AS D�ugo��, CHARINDEX('�', Nazwa,1) AS gdzie_�, Cena FROM Produkty ORDER BY gdzie_�, Cena

--Wy�wietl �redni� cen� sprzedawanych produkt�w (ze wzgl�du na wszystkie ceny, w r�nych terminach) oraz nazw� tego produktu. Uszereguj produkty od najwy�szej do najni�szej ceny
--Wyniki zaokr�glij do pe�nej warto�ci w d�
SELECT a.IdProduktu,b.Nazwa,FLOOR(AVG(a.Cena)) AS SredniaCena FROM CenyProduktow a
INNER JOIN Produkty b
ON a.IdProduktu = b.IdProdukty
GROUP BY a.IdProduktu, b.Nazwa
ORDER BY FLOOR(AVG(a.Cena))

--Wy�wietl nazw� produkt�w wraz z przydzielon� nazw� kategorii
SELECT a.Nazwa, b.Nazwa AS [Kategoria] FROM Produkty a
INNER JOIN KategorieProduktow b
ON a.IdKategorii = b.IdKategorieProduktow

--Wy�wietl idproduktu (powy�ej nr. 10), nazw� produktu, �redni� liczb� sztuk w zam�wieniu z dostawy (zaokr�gli� w g�r�) oraz ��czn� kwot� zam�wienia dostawy
--Uszereguj produkty wed�ug �redniej ilosci sztuk w dostawie i ��cznej kwoty zam�wienia rosn�co
SELECT  a.IdProduktu,b.Nazwa, CEILING(AVG(Ilosc)) AS srednia_ilosc_sztuk_w_zamowieniu, SUM(Ilosc*CenaZaSztuke) AS �aczna_kwota
FROM DostawaProduktow a INNER JOIN Produkty b ON a.IdProduktu = b.IdProdukty
WHERE IdProduktu >= 10
GROUP BY a.IdProduktu, b.Nazwa
ORDER BY srednia_ilosc_sztuk_w_zamowieniu,�aczna_kwota

--Wyszukaj nazw� produktu, cen�, ilo�� i dat� zakupu, kt�re kupili klienci z kart� sta�ego klienta, ich imi�, nazwisko, miasto zamieszkania oraz numer karty sta�ego klienta. 
--Ilo�� zakupionych produkt�w ma wynosi� minimum 2
--Uszereguj wyszukania rosn�co wed�ug daty, a kolejno ceny produktu
SELECT a.Nazwa, a.Cena, b.Ilosc, c.DataZakupu, d.Imie, d.Nazwisko, d.Miasto, e.NumerKarty FROM Produkty a
INNER JOIN ZakupySklepOnlineProdukt b 
ON a.IdProdukty = b.IdProduktu
INNER JOIN ZakupySklepOnline c
ON b.IdZakupySklepOnlineProdukt= c.IdZakupySklepOnline
INNER JOIN Klienci d
ON c.IdKlienta= d.IdKlienci
INNER JOIN KartaStalegoKlienta e
ON d.IdKlienci= e.IdKlienta
WHERE b.Ilosc >=2
ORDER BY c.DataZakupu, a.Cena

--Wy�wietl sum� wszystkich zakupionych produkt�w w sklepie online, kt�ra jest wi�ksza ni� 14, pogrupuj je wed�ug idproduktu, nazwy i kategorii produktu
--Uszereguj produkty po numerze idproduktu.
SELECT b.IdProdukty, b.Nazwa, c.Nazwa AS [Kategoria],
SUM(a.Ilosc) as [Suma zakup�w online]
FROM ZakupySklepOnlineProdukt a
INNER JOIN Produkty b 
ON b.IdProdukty = a.IdProduktu
INNER JOIN KategorieProduktow c
ON b.IdKategorii = c.IdKategorieProduktow
GROUP BY b.IdProdukty, b.Nazwa, c.Nazwa
HAVING SUM(a.Ilosc) > 14
ORDER BY b.IdProdukty

--Wy�wietl sum� wszystkich zakupionych produkt�w w sklepie stacjonarnym, kt�ra jest mniejsza ni� 80, pogrupuj je wed�ug idproduktu, nazwy i kategorii produktu
--Uszereguj produkty po numerze idproduktu.
SELECT b.IdProdukty, b.Nazwa, c.Nazwa AS [Kategoria],
SUM(a.Ilosc) as [Suma zakup�w stacjonarych]
FROM ZakupySklepStacjonarnyProdukt a
INNER JOIN Produkty b 
ON b.IdProdukty = a.IdProduktu
INNER JOIN KategorieProduktow c
ON b.IdKategorii = c.IdKategorieProduktow
GROUP BY b.IdProdukty, b.Nazwa, c.Nazwa
HAVING SUM(a.Ilosc) < 80
ORDER BY b.IdProdukty

--Wy�wietli� imi�, nazwisko i inicja�y klient�w, kt�rzy dokonali zwrotu zakupionych towar�w, wraz z przyczyn� zwrotu, nazw� produktu, dat� zakupu i form� dostawy
--Uszeregowa� wy�wietlone informacje wed�ug daty zakupu
SELECT b.DataZakupu, f.Nazwa, c.Nazwa,e.IdZakupu, e.Przyczyna, a.Imie, a.Nazwisko, SUBSTRING(a.Imie,1,1) + '.' + LEFT(a.Nazwisko,1)+'.'AS Inicja�y FROM Klienci a
INNER JOIN ZakupySklepOnline b
ON a.IdKlienci= b.IdKlienta
INNER JOIN RodzajDostawy c
ON b.Dostawa= c.IdRodzajDostawy
INNER JOIN ZakupySklepOnlineProdukt d
ON d.IdZakupySklepOnlineProdukt= b.IdZakupySklepOnline
INNER JOIN Zwroty e
ON d.IdZakupySklepOnlineProdukt= e.IdZakupu
INNER JOIN Produkty f 
ON f.IdProdukty = d.IdProduktu
ORDER BY b.DataZakupu

--Wy�wietl nazw� produktu wraz z pierwsz� liter� kategorii produktu, d�ugo�� nazwy produktu oraz miejsce pierwszej spacji w nazwie produktu
--Powy�sze dane maj� by� wy�wietlone dla cen dwucyfrowych
--Uszeregowa� wed�ug d�ugo�ci nazwy produktu rosn�co
SELECT a.Nazwa+' '+LEFT(b.Nazwa,1)+'.' [Nazwa produktu ze skr�tem kategorii], LEN(a.Nazwa) [D�ugo�� nazwy produktu], a.Cena,
CHARINDEX(' ', a.Nazwa) [Miejsce pierwszej spacji w nazwie produktu] FROM Produkty a
INNER JOIN KategorieProduktow b
ON a.IdKategorii = b.IdKategorieProduktow
WHERE a.Cena LIKE'__' 
ORDER BY [D�ugo�� nazwy produktu]

--Wy�wietli� liczb� zrealizowanych zam�wie� w poszczeg�lnych sklepach w miastach, w sklepach stacjonarnych, po 1 maja 2020
--Zak�adamy, �e klient robi zakupy w miejscu swojego zamieszkania
SELECT a.Miasto, COUNT(a.Miasto) AS 'Liczba zrealizowanych zam�wie� w danym sklepie stacjonarnym'
FROM Klienci a
INNER JOIN ZakupySklepStacjonarny b
ON a.IdKlienci= b.IdKlienta
WHERE b.DataZakupu > '2020-05-01 00:00:00.000' 
GROUP BY a.Miasto
ORDER BY 'Liczba zrealizowanych zam�wie� w danym sklepie stacjonarnym'

--Wy�wietli� liczb� zrealizowanych zam�wie� przez mieszka�c�w poszczeg�lnych miast w sklepie internetowym od 1 marca 2020 
SELECT a.Miasto, COUNT(a.Miasto) AS 'Liczba zrealizowanych zam�wie� przez mieszka�c�w poszczeg�lnych miast w sklepie internetowym'
FROM Klienci a
INNER JOIN ZakupySklepOnline b
ON a.IdKlienci= b.IdKlienta
WHERE b.DataZakupu >= '2020-03-01 00:00:00.000' 
GROUP BY a.Miasto
ORDER BY 'Liczba zrealizowanych zam�wie� przez mieszka�c�w poszczeg�lnych miast w sklepie internetowym'

--Wy�wietl liczb� klient�w sklepu, liczb� zam�wie� w sklepie online i stacjonarnym
SELECT COUNT (*) AS 'Liczba klient�w zarejestrowanych w systemie' FROM Klienci
SELECT COUNT (*) AS 'Liczba zam�wie� sklep online' FROM ZakupySklepOnline
SELECT COUNT (*) AS 'Liczba zam�wie� sklep stscjonarny' FROM ZakupySklepStacjonarny

--Wy�wietl dost�pne produkty w sklepie wraz z nazw� kategorii, cen� oraz podzia�em ze wzgl�du na p�k� cenow� (niska, �rednia i wysoka)
--Uszereguj wy�wietlone dane wed�ug ceny rosn�co
SELECT a.Nazwa, a.Cena, b.Nazwa AS 'Kategoria',
CASE
WHEN a.Cena >= 2000 THEN 'Wysoka p�ka cenowa'
WHEN a.Cena >= 200 AND a.Cena < 2000 THEN '�rednia p�ka cenowa'
ELSE 'Niska p�ka cenowa'
END as 'P�ki cenowe produkt�w'
FROM Produkty a
INNER JOIN KategorieProduktow b
ON a.IdKategorii = b.IdKategorieProduktow
ORDER BY a.Cena

--Wy�wietl cen� i nazwy produkt�w wielkimi literami. Uszereguj wed�ug ceny rosn�co
SELECT Cena, UPPER(Nazwa) as 'NAZWA WIELKIMI LITERAMI' FROM Produkty ORDER BY Cena

--Wy�wietl pracownik�w, kt�rzy urodzili si� po 1990, od najstarszego do najm�odszego
SELECT * FROM Pracownicy WHERE DATEPART(year,DataUrodzenia)> 1990 ORDER BY DataUrodzenia
--Wyswitl pracownik�w, kt�rzy urodzili si� p�niej ni� w czerwcu, od najm�odszego do najstarszego
SELECT * FROM Pracownicy WHERE DATEPART(month,DataUrodzenia)> 06 ORDER BY DataUrodzenia DESC
--Wyswitlic pracownik�w, kt�rzy urodzili si� od 1970 do 1990 roku, od lutego do sierpnia
--Wy�wietl wyszukania alfabetycznie wed�ug nazwiska
SELECT * FROM Pracownicy
WHERE YEAR (DataUrodzenia) BETWEEN 1970 AND 1990 AND DATEPART(month,DataUrodzenia) BETWEEN 02 AND 08 ORDER BY Nazwisko
--Wy�wietl pracownik�w, kt�rzy prze�yli od 7000 do 10000 dni oraz urodzili si� od maja do grudnia
--Uszereguj ich od najm�odszego do najstarszego
SELECT * FROM Pracownicy WHERE DATEDIFF(DAY,DataUrodzenia, GETDATE()) BETWEEN 7000 AND 10000 AND MONTH(DataUrodzenia) BETWEEN 5 AND 12
ORDER BY DataUrodzenia DESC
--Wyswietl pracownik�w, kt�rzy prze�yli od 300 do 400 miesi�cy
SELECT*, DATEDIFF(MONTH,DataUrodzenia, GETDATE()) AS 'Liczba miesi�cy'
FROM Pracownicy
WHERE DATEDIFF (MONTH,DataUrodzenia, GETDATE()) BETWEEN 300 AND 400 
ORDER BY Nazwisko

--Wy�wietl czteroznakowy kod nazwy produktuw celu oceny podobie�stwa dw�ch wyra�e�
--Uszereguj kody alfabetycznie
SELECT Cena,Nazwa, SOUNDEX(Nazwa) as 'Kod' FROM Produkty ORDER BY 'Kod'

--Wy�wietl liczb� oferowanych rodzaj�w produkt�w w asortymencie, najwy�sz� i najni�sz� cen� produktu oraz �redni� cen� wszystkich produkt�w
SELECT COUNT(*) AS [Liczba produkt�w w asortymencie],
MAX(Cena) AS [Najwy�sza cena produktu], 
MIN(Cena) AS [Najni�sza cena produktu],
AVG(Cena) AS [�rednia cena produkt�w]
FROM Produkty

--Wy�wietl ile zosta�o zrealizowanych dostaw dla danego produktu (wy�wietl tak�e idproduktu i jego nazw�) - do 5 dostaw w��cznie
SELECT a.IdProduktu, COUNT(*) AS [Liczba dostaw produktu], b.Nazwa
FROM DostawaProduktow a
INNER JOIN Produkty b 
ON b.IdProdukty = a.IdProduktu
GROUP BY a.IdProduktu, b.Nazwa
HAVING COUNT(*) <= 5
ORDER BY [Liczba dostaw produktu]

--Wy�wietl id, imi� i nazwisko klienta, kt�ry zrealizowa� najwi�cej zam�wie� w sklepie online. Wy�wietli� tak�e liczb� tych zam�wie� oraz ich sum�
SELECT TOP 1 a.IdKlienta, b.Imie, b.Nazwisko, COUNT(a.IdZakupySklepOnline) [Liczba zam�wie�], SUM(d.Cena) [Suma koszt�w wszystkich zam�wie�]
FROM ZakupySklepOnline a JOIN Klienci b ON a.IdKlienta=b.IdKlienci
JOIN ZakupySklepOnlineProdukt c ON a.IdZakupySklepOnline=c.IdZakupySklepOnlineProdukt
JOIN Produkty d ON c.IdProduktu=d.IdProdukty
GROUP BY a.IdKlienta, b.Imie, b.Nazwisko
ORDER BY COUNT(a.IdZakupySklepOnline) DESC

--Wy�wietl id, imi� i nazwisko klienta, kt�ry zrealizowa� najwi�cej zam�wie� w sklepie stacjonarnym. Wy�wietli� tak�e liczb� tych zam�wie� oraz ich sum�
SELECT TOP 1 a.IdKlienta, b.Imie, b.Nazwisko, COUNT(a.IdZakupySklepStacjonarny) [Liczba zam�wie�], SUM(d.Cena) [Suma koszt�w wszystkich zam�wie�]
FROM ZakupySklepStacjonarny a JOIN Klienci b ON a.IdKlienta=b.IdKlienci
JOIN ZakupySklepStacjonarnyProdukt c ON a.IdZakupySklepStacjonarny=c.IdZakupySklepStacjonarnyProdukt
JOIN Produkty d ON c.IdProduktu=d.IdProdukty
GROUP BY a.IdKlienta, b.Imie, b.Nazwisko
ORDER BY COUNT(a.IdZakupySklepStacjonarny) DESC

--Wy�wietli� id, nazwisko, imi�, pensj� podsawow� premi� i nazw� dzia�u pracy pracownik�w, kt�rzy maj� pensj� wynosz�c� conajmniej 2200 i premi� licz�c� nast�puj�ce liczby 10,15,20,30,50,80
SELECT a.IdPracownicy, Nazwisko, Imie, PensjaPodstawowa, Premia, NazwaDzialu FROM Pracownicy a JOIN Dzialy b ON a.IdDzialu=b.IdDzialy
WHERE Premia IN (10,15,20,30,50,80) AND [PensjaPodstawowa]>=2200

--Wyswietli� id dostawcy, jego nazw� oraz ilo�� zrealizowanych dostaw
SELECT b.IdDostawcy, Nazwa, COUNT(distinct(IdDostawa)) AS 'liczba zrealizowanych dostaw przez dostawce'
FROM Dostawa AS a JOIN Dostawcy AS b ON a.IdDostawcy=b.IdDostawcy
GROUP BY b.IdDostawcy, Nazwa

--Wy�wietli� id, nazw� produktu i ilo�� zmian jego ceny, kt�ra jest wy�sza ni� 3
--Wyniki wy�weitli� od najmniejszej liczby zmian ceny
SELECT IdProduktu, b.Nazwa, COUNT(IdProduktu) AS [Liczba zmian ceny]
FROM CenyProduktow AS a JOIN Produkty AS b ON a.IdProduktu =b.IdProdukty
GROUP BY IdProduktu, b.Nazwa
HAVING COUNT(IdProduktu) >3
ORDER BY [Liczba zmian ceny] ASC

--Wy�wietl najstarszych klient�w sklepu z ka�dego miasta
--Uszereguj ich od najstrszego do najm�odszego
SELECT Miasto, MAX(Wiek) AS [Najwy�szy wiek klienta]
FROM Klienci
GROUP BY miasto
ORDER BY [Najwy�szy wiek klienta] DESC

--Podaj �redni wiek klienta sklepu internetowego, z poszczeg�lnych miast, dla wszystkich sposob�w dostawy poza odbiorem osobistym
SELECT ROUND(AVG(Wiek),0) AS '�redni wiek klienta', Miasto, c.Nazwa
FROM Klienci AS a JOIN ZakupySklepOnline AS b ON a.IdKlienci=b.IdKlienta
JOIN RodzajDostawy AS c ON c.IdRodzajDostawy=b.Dostawa
WHERE b.Dostawa <=3
GROUP BY Miasto, c.Nazwa

--Uszeregowa� produkty w sklepie wed�ug ceny malej�co dodaj�c numer pozycjiproduktu w rankingu
SELECT a.IdProdukty, Nazwa, Cena, IdKategorii, ROW_NUMBER() OVER (ORDER BY Cena DESC) AS Pozycja
FROM Produkty a ORDER BY Pozycja
--Wy�wietli� 10 produkt�w o najwy�szej cenie
SELECT TOP(10) IdProdukty, Nazwa, Cena, IdKategorii
FROM Produkty
ORDER BY Cena DESC

--Znale�� produkty, kt�rych cena przy zakupie by�a r�wna lub wi�ksza od tej oferowanej klientom, w r�ych datach
--Uszereguj wyniki wed�ug pozycji - od najwy�szej
SELECT  Cena, IdCenyProduktow, IdProduktu,
(SELECT COUNT(*) FROM Produkty WHERE Cena>=a.Cena) AS Pozycja
FROM CenyProduktow a
WHERE (SELECT COUNT(*) FROM Produkty WHERE Cena>=a.Cena) BETWEEN 1 AND 20
ORDER BY Pozycja

--Wy�weitl id, imi� i nazwisko pracownika, pensj� oraz nazw� dzia�, kt�rzy zarabiaj� najwi�cej w swoim dziale
SELECT IdPracownicy, Imie, Nazwisko, PensjaPodstawowa, NazwaDzialu
FROM Pracownicy a JOIN Dzialy b on a.IdDzialu=b.IdDzialy
WHERE PensjaPodstawowa=(SELECT MAX(PensjaPodstawowa) FROM
Pracownicy a2 join Dzialy b2 on a2.IdDzialu=b2.IdDzialy
WHERE b2.NazwaDzialu=b.NazwaDzialu
GROUP BY b2.NazwaDzialu)

--Wy�wietl id i nazw� produktu wraz z jego ilo�ci� w ka�dej z dostaw danego produktu oraz numer tej dostawy. Dodatkowo podaej cen� produktu w systemie, cen� jednostkow� za sztuk� produktu
--kupowanego od dostawcy oraz �redni� cen� produktu we wszystkich terminach zmiany ceny - powy�ej 3000. Uszereguj produkty od ceny kupna od dostawc�w malej�co
SELECT IdProdukty, Nazwa, b.Ilosc , b.NumerDostawy, a.Cena AS [Cena w systemie], b.CenaZaSztuke AS [Cena kupna od dostawcy], AVG(c.Cena) AS [�rednia cena w sklepie we wszystkich terminach]
FROM Produkty a JOIN DostawaProduktow b ON a.IdProdukty=b.IdProduktu
JOIN CenyProduktow c ON c.IdProduktu=b.IdProduktu
GROUP BY IdProdukty, Nazwa, b.Ilosc , b.NumerDostawy, a.Cena, b.CenaZaSztuke
HAVING AVG(c.Cena)>3000
ORDER BY b.CenaZaSztuke DESC

--Znale�� pracownik�w, kt�rych stawka pensji podstawowej przypadaj�ca na 2 dni pracy jest wy�sza ni� mediana ceny jednostkowej wszystkich produk�w kupowanych od dostawc�w 
--Wy�wietl stawki do 2 miejsc po przecinku oraz dzia�, w kt�rym pracuje pracownik
--Uszereguj wyniki wed�ug stawki dwudniowej malej�co
SELECT a.IdPracownicy, Imie, Nazwisko, d.NazwaDzialu, CAST((PensjaPodstawowa/15) AS DECIMAL(5, 2)) AS [Stawka pracownika za 2 dni pracy (�rednio)],
( (SELECT MAX(CenaZaSztuke) FROM
   (SELECT TOP 50 PERCENT CenaZaSztuke FROM DostawaProduktow ORDER BY CenaZaSztuke) AS BH)
 +
 (SELECT MIN(CenaZaSztuke) FROM
   (SELECT TOP 50 PERCENT CenaZaSztuke FROM DostawaProduktow ORDER BY CenaZaSztuke DESC) AS TH)
) / 2 AS [Mediana cen produkt�w w systemia]
FROM Pracownicy AS a JOIN Dostawa AS b ON a.IdPracownicy=b.IdPracownicy
JOIN DostawaProduktow AS c ON c.IdDostawaProduktow=b.IdDostawa
JOIN Dzialy AS d ON a.IdDzialu=d.IdDzialy
GROUP BY a.IdPracownicy, Imie, Nazwisko, d.NazwaDzialu, CAST((PensjaPodstawowa/15) AS DECIMAL(5, 2))
HAVING( (SELECT MAX(CenaZaSztuke) FROM
   (SELECT TOP 50 PERCENT CenaZaSztuke FROM DostawaProduktow ORDER BY CenaZaSztuke) AS BH)
 +
 (SELECT MIN(CenaZaSztuke) FROM
   (SELECT TOP 50 PERCENT CenaZaSztuke FROM DostawaProduktow ORDER BY CenaZaSztuke DESC) AS TH)
) / 2 < CAST((PensjaPodstawowa/15) AS DECIMAL(5, 2))
ORDER BY [Stawka pracownika za 2 dni pracy (�rednio)] DESC

--Wy�wietl nazwisko, wiek, email, ulic�, numer ulicy i miasto klient�w z Gdyni, Gda�ska, Warszawy i Krakowa oraz te same dane klient�w, kt�rzy mieszkaj� na ulicy o numerze 2 lub maj� 40 lat
SELECT Nazwisko, Wiek, email, Ulica, NumerUlicy, Miasto FROM Klienci
WHERE Miasto IN ( 'Gdynia', 'Gda�sk', 'Warszawa', 'Krak�w')
UNION
SELECT Nazwisko, Wiek, email,  Ulica, NumerUlicy, Miasto FROM Klienci
WHERE NumerUlicy = 2
UNION
SELECT Nazwisko, Wiek, email,  Ulica, NumerUlicy, Miasto FROM Klienci
WHERE Wiek = 40
ORDER BY Miasto, Nazwisko