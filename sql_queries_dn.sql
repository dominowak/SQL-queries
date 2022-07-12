--Przedstawienie danych zawartych w ka¿dej tabeli
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

--Wyszukaj klientów, których email zaczyna siê od litery 'K', uszereguj ich alfabetycznie wed³ug nazwiska
SELECT * FROM Klienci WHERE email Like 'K%' ORDER BY Nazwisko
--Wyszukaj klientów, których email koñczy siê na 's.com', od najm³odszego do najstarszego
SELECT * FROM Klienci WHERE email Like '%s.com' ORDER BY Wiek

--Wyszukaj bez powtórzeñ imiona klientów
SELECT DISTINCT Imie FROM Klienci
--Wyszukaj imiona kobiet wœród klientów
SELECT DISTINCT Imie FROM Klienci WHERE RTRIM(Imie) LIKE '%a' OR Imie  LIKE 'Nancy' OR Imie LIKE 'Robyn'
--Wyszukaj imiona mê¿czyzn wœród klientów
SELECT DISTINCT Imie FROM Klienci WHERE RTRIM(Imie) NOT LIKE '%a' AND Imie NOT LIKE 'Nancy' AND Imie NOT LIKE 'Robyn'

--Wyszukaj klientów, których imiê ma na pierwszym i trzecim miejscu literê 'a'
SELECT * FROM Klienci WHERE Imie Like 'A%A%'
--Wyszukaj klientów, których imiê ma na pierwszym i trzecim miejscu literê 'a' oraz s¹ w wieku pomiêdzy 40 a 50 lat
SELECT * FROM Klienci WHERE Imie Like 'A%A%' AND Wiek BETWEEN 40 AND 55
--Wyszukaj klientów, których nazwisko koñczy siê na literê 'i', mieszkaj¹ w Gdyni oraz s¹ w wieku pomiêdzy 30 a 55 lat
SELECT * FROM Klienci WHERE Nazwisko Like '%I' AND Miasto = 'Gdynia' AND Wiek BETWEEN 30 AND 55
--Wyszukaj klientów których nazwiska koñcz¹ siê na literê z zakresu b-c, uszereguj ich wed³ug miasta zamieszkania
SELECT * FROM Klienci WHERE Nazwisko LIKE '%[b-c]' ORDER BY Miasto
--Wyszukaj klientów, którzy maj¹ trzyliterowe nazwisko
SELECT * FROM Klienci WHERE Nazwisko LIKE '___'
--Wyœwietliæ klientów z nazwiskiem sk³adaj¹cym siê z 6 liter - uszeregowaæ ich w odwrotnej kolejnosci alfabetycznej
SELECT IdKlienci, Imie, Nazwisko FROM Klienci WHERE Nazwisko LIKE '______' ORDER BY Nazwisko DESC

--Wyszukaj klientów, którzy mieszkaj¹ na uliczy zaczynaj¹cej siê na 'za' i mieszkaj¹ w Gdyni
SELECT * FROM Klienci WHERE Ulica Like '%Za%' AND Miasto = 'Gdynia'
--Wyszukaj klientów, którzy mieszjaj¹ na ulicy zaczynaj¹cej siê na literê 'k' oraz numerze ulicy pomiêdzy 20 a 30
SELECT * FROM Klienci WHERE Ulica Like 'K%' AND NumerUlicy BETWEEN 20 AND 30
--Wyswietl klientów, których nazwiska zaczynaj¹ siê na litery od M do Z i mieszkaj¹ w Gdyni, uszereguj ich wed³ug ulicy
SELECT * FROM Klienci WHERE RTRIM(Nazwisko) LIKE '[M-Z]%' AND Miasto LIKE 'Gdynia' ORDER BY Ulica
--Wyszukaj bez powtórzeñ miasta zamieszkania klientow
SELECT DISTINCT Miasto FROM Klienci

--Wyszukaj pracowników, którzy zostali zatrudnieni od 1 listopada 2015 lub póŸniej i maj¹ premiê ponad 20, od najwy¿szej pensji podstawowej do najwy¿szej
SELECT * FROM Pracownicy WHERE DataZatrudnienia > '2015-11-01 00:00:00.000' AND Premia > 20 ORDER BY PensjaPodstawowa
--Wyszukaj pracowników, których pensja podstawowa wynosi pomiêdzy 2000 a 3000, od najwy¿szej pensji podstawowej do najwy¿szej
SELECT * FROM Pracownicy WHERE PensjaPodstawowa BETWEEN 2000 AND 3000 ORDER BY PensjaPodstawowa
--Wyszukaj pracowników, którzy dostaj¹ premiê ni¿sz¹ ni¿ 40, ale nie wynosz¹c¹ 20 
SELECT * FROM Pracownicy WHERE Premia != 20 AND Premia < 40;
--Wyszukacj pracowników, którzy zarabiaj¹ minimum 3000 przy jednoczesnej premii wynosz¹cej minimum 30. Jako alternatywny warunek wyszukaj najnowszych, najmniejefektywnych pracowników - 
--takich, którzy s¹ zatrudnieni od 2017 roku i maj¹ premiê poni¿ej 15
SELECT * FROM Pracownicy WHERE (Premia >=30 AND PensjaPodstawowa >= 3000)
OR DataZatrudnienia >= '2017-01-01 00:00:00.000' AND Premia <15
ORDER BY PensjaPodstawowa

--Wyszukaj produków, które kosztuj¹ wiêcej ni¿ 300 i uszereguj je od najdro¿szego do najtañszego
SELECT * FROM Produkty WHERE Cena > 3000 ORDER BY Cena DESC
--Wyszukaj produkty, których cena jest pomiêdzy 1000 a 2000, uszereguj je od najdroszego do najtañszego
SELECT * FROM Produkty WHERE Cena >= 1000 AND Cena <= 2000 ORDER BY Cena DESC
--Wyszukaj produkty, które sk³adaj¹ siê z przynajmniej 5 oddzielnych znaków (s³ów, liter, oznaczeñ itp.)
SELECT DISTINCT Nazwa FROM Produkty WHERE Nazwa Like '% % % % %'

--Wyszukaj ile jest rodzajów produków, bez powtórzeñ
SELECT DISTINCT IdProduktu FROM CenyProduktow
--Wyszukaj cen produktów, które by³y aktualne w sklepie od 1 stycznia 2020 r. i by³y powy¿ej 1000
SELECT * FROM CenyProduktow WHERE DataOd = '2020-01-01 00:00:00.000' AND Cena > 1000
--Wyszukaj cen produktów, które by³y aktualne w sklepie do 1 wrzeœnia 2020 r. i by³y poni¿ej 1000
SELECT * FROM CenyProduktow WHERE DataDo > '2020-09-01 00:00:00.000' AND Cena < 1000

--Wyszukaj dostaw, które by³y realizowane po 1 czerwca 2020 r. i obs³ugiwane przez pracowników o numerach id pomiêdzy 8 i 14
SELECT * FROM Dostawa WHERE DataDostawy > '2020-06-01' AND IdPracownicy BETWEEN 8 AND 14
--Wyszukaj dostaw, które by³y dostarczane przez dostawcê numer 1 i obs³ugiwane przez pracownika o numerze id = 11
SELECT * FROM Dostawa WHERE IdDostawcy = 1 AND IdPracownicy = 11 
--Wyszukaj dostaw produktów, dla produktów o id pomiêdzy 10 i 30, dla numerów dostaw powy¿ej 20 oraz cenie za sztukê powy¿ej 300
SELECT * FROM DostawaProduktow WHERE IdProduktu BETWEEN 10 AND 30 AND NumerDostawy>20 AND CenaZaSztuke>300
--Wyszukaj dostaw, które by³y obs³ugiwane przez pracowników 1, 5, 6
SELECT * FROM Dostawa WHERE IdPracownicy IN (1,5,6)

--Wyœwietl komentarze do zamówieñ ze sklepu online, które s¹ d³u¿sze ni¿ 2 znaki
SELECT * FROM ZakupySklepOnline WHERE LEN(Komentarz) > 2
--Wyœwietl komentarze do zamówieñ ze sklepu stacjonarnego, które s¹ d³u¿sze ni¿ 1 znak
SELECT * FROM ZakupySklepStacjonarny WHERE LEN(Komentarz) > 1

--Wyswietl IdProduktu, nazwê produnktu, d³ugoœæ nazwy produktu, miejsce litery '³' w nazwie i cenê produktu. Uszereguj produkty wed³ug miejsca litery '³' oraz ceny rosn¹co
SELECT IdProdukty, Nazwa, LEN(Nazwa) AS D³ugoœæ, CHARINDEX('³', Nazwa,1) AS gdzie_³, Cena FROM Produkty ORDER BY gdzie_³, Cena

--Wyœwietl œredni¹ cenê sprzedawanych produktów (ze wzglêdu na wszystkie ceny, w ró¿nych terminach) oraz nazwê tego produktu. Uszereguj produkty od najwy¿szej do najni¿szej ceny
--Wyniki zaokr¹glij do pe³nej wartoœci w dó³
SELECT a.IdProduktu,b.Nazwa,FLOOR(AVG(a.Cena)) AS SredniaCena FROM CenyProduktow a
INNER JOIN Produkty b
ON a.IdProduktu = b.IdProdukty
GROUP BY a.IdProduktu, b.Nazwa
ORDER BY FLOOR(AVG(a.Cena))

--Wyœwietl nazwê produktów wraz z przydzielon¹ nazw¹ kategorii
SELECT a.Nazwa, b.Nazwa AS [Kategoria] FROM Produkty a
INNER JOIN KategorieProduktow b
ON a.IdKategorii = b.IdKategorieProduktow

--Wyœwietl idproduktu (powy¿ej nr. 10), nazwê produktu, œredni¹ liczbê sztuk w zamówieniu z dostawy (zaokr¹gliæ w górê) oraz ³¹czn¹ kwotê zamówienia dostawy
--Uszereguj produkty wed³ug œredniej ilosci sztuk w dostawie i ³¹cznej kwoty zamówienia rosn¹co
SELECT  a.IdProduktu,b.Nazwa, CEILING(AVG(Ilosc)) AS srednia_ilosc_sztuk_w_zamowieniu, SUM(Ilosc*CenaZaSztuke) AS ³aczna_kwota
FROM DostawaProduktow a INNER JOIN Produkty b ON a.IdProduktu = b.IdProdukty
WHERE IdProduktu >= 10
GROUP BY a.IdProduktu, b.Nazwa
ORDER BY srednia_ilosc_sztuk_w_zamowieniu,³aczna_kwota

--Wyszukaj nazwê produktu, cenê, iloœæ i datê zakupu, które kupili klienci z kart¹ sta³ego klienta, ich imiê, nazwisko, miasto zamieszkania oraz numer karty sta³ego klienta. 
--Iloœæ zakupionych produktów ma wynosiæ minimum 2
--Uszereguj wyszukania rosn¹co wed³ug daty, a kolejno ceny produktu
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

--Wyœwietl sumê wszystkich zakupionych produktów w sklepie online, która jest wiêksza ni¿ 14, pogrupuj je wed³ug idproduktu, nazwy i kategorii produktu
--Uszereguj produkty po numerze idproduktu.
SELECT b.IdProdukty, b.Nazwa, c.Nazwa AS [Kategoria],
SUM(a.Ilosc) as [Suma zakupów online]
FROM ZakupySklepOnlineProdukt a
INNER JOIN Produkty b 
ON b.IdProdukty = a.IdProduktu
INNER JOIN KategorieProduktow c
ON b.IdKategorii = c.IdKategorieProduktow
GROUP BY b.IdProdukty, b.Nazwa, c.Nazwa
HAVING SUM(a.Ilosc) > 14
ORDER BY b.IdProdukty

--Wyœwietl sumê wszystkich zakupionych produktów w sklepie stacjonarnym, która jest mniejsza ni¿ 80, pogrupuj je wed³ug idproduktu, nazwy i kategorii produktu
--Uszereguj produkty po numerze idproduktu.
SELECT b.IdProdukty, b.Nazwa, c.Nazwa AS [Kategoria],
SUM(a.Ilosc) as [Suma zakupów stacjonarych]
FROM ZakupySklepStacjonarnyProdukt a
INNER JOIN Produkty b 
ON b.IdProdukty = a.IdProduktu
INNER JOIN KategorieProduktow c
ON b.IdKategorii = c.IdKategorieProduktow
GROUP BY b.IdProdukty, b.Nazwa, c.Nazwa
HAVING SUM(a.Ilosc) < 80
ORDER BY b.IdProdukty

--Wyœwietliæ imiê, nazwisko i inicja³y klientów, którzy dokonali zwrotu zakupionych towarów, wraz z przyczyn¹ zwrotu, nazw¹ produktu, dat¹ zakupu i form¹ dostawy
--Uszeregowaæ wyœwietlone informacje wed³ug daty zakupu
SELECT b.DataZakupu, f.Nazwa, c.Nazwa,e.IdZakupu, e.Przyczyna, a.Imie, a.Nazwisko, SUBSTRING(a.Imie,1,1) + '.' + LEFT(a.Nazwisko,1)+'.'AS Inicja³y FROM Klienci a
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

--Wyœwietl nazwê produktu wraz z pierwsz¹ liter¹ kategorii produktu, d³ugoœæ nazwy produktu oraz miejsce pierwszej spacji w nazwie produktu
--Powy¿sze dane maj¹ byæ wyœwietlone dla cen dwucyfrowych
--Uszeregowaæ wed³ug d³ugoœci nazwy produktu rosn¹co
SELECT a.Nazwa+' '+LEFT(b.Nazwa,1)+'.' [Nazwa produktu ze skrótem kategorii], LEN(a.Nazwa) [D³ugoœæ nazwy produktu], a.Cena,
CHARINDEX(' ', a.Nazwa) [Miejsce pierwszej spacji w nazwie produktu] FROM Produkty a
INNER JOIN KategorieProduktow b
ON a.IdKategorii = b.IdKategorieProduktow
WHERE a.Cena LIKE'__' 
ORDER BY [D³ugoœæ nazwy produktu]

--Wyœwietliæ liczbê zrealizowanych zamówieñ w poszczególnych sklepach w miastach, w sklepach stacjonarnych, po 1 maja 2020
--Zak³adamy, ¿e klient robi zakupy w miejscu swojego zamieszkania
SELECT a.Miasto, COUNT(a.Miasto) AS 'Liczba zrealizowanych zamówieñ w danym sklepie stacjonarnym'
FROM Klienci a
INNER JOIN ZakupySklepStacjonarny b
ON a.IdKlienci= b.IdKlienta
WHERE b.DataZakupu > '2020-05-01 00:00:00.000' 
GROUP BY a.Miasto
ORDER BY 'Liczba zrealizowanych zamówieñ w danym sklepie stacjonarnym'

--Wyœwietliæ liczbê zrealizowanych zamówieñ przez mieszkañców poszczególnych miast w sklepie internetowym od 1 marca 2020 
SELECT a.Miasto, COUNT(a.Miasto) AS 'Liczba zrealizowanych zamówieñ przez mieszkañców poszczególnych miast w sklepie internetowym'
FROM Klienci a
INNER JOIN ZakupySklepOnline b
ON a.IdKlienci= b.IdKlienta
WHERE b.DataZakupu >= '2020-03-01 00:00:00.000' 
GROUP BY a.Miasto
ORDER BY 'Liczba zrealizowanych zamówieñ przez mieszkañców poszczególnych miast w sklepie internetowym'

--Wyœwietl liczbê klientów sklepu, liczbê zamówieñ w sklepie online i stacjonarnym
SELECT COUNT (*) AS 'Liczba klientów zarejestrowanych w systemie' FROM Klienci
SELECT COUNT (*) AS 'Liczba zamówieñ sklep online' FROM ZakupySklepOnline
SELECT COUNT (*) AS 'Liczba zamówieñ sklep stscjonarny' FROM ZakupySklepStacjonarny

--Wyœwietl dostêpne produkty w sklepie wraz z nazw¹ kategorii, cen¹ oraz podzia³em ze wzglêdu na pó³kê cenow¹ (niska, œrednia i wysoka)
--Uszereguj wyœwietlone dane wed³ug ceny rosn¹co
SELECT a.Nazwa, a.Cena, b.Nazwa AS 'Kategoria',
CASE
WHEN a.Cena >= 2000 THEN 'Wysoka pó³ka cenowa'
WHEN a.Cena >= 200 AND a.Cena < 2000 THEN 'Œrednia pó³ka cenowa'
ELSE 'Niska pó³ka cenowa'
END as 'Pó³ki cenowe produktów'
FROM Produkty a
INNER JOIN KategorieProduktow b
ON a.IdKategorii = b.IdKategorieProduktow
ORDER BY a.Cena

--Wyœwietl cenê i nazwy produktów wielkimi literami. Uszereguj wed³ug ceny rosn¹co
SELECT Cena, UPPER(Nazwa) as 'NAZWA WIELKIMI LITERAMI' FROM Produkty ORDER BY Cena

--Wyœwietl pracowników, którzy urodzili siê po 1990, od najstarszego do najm³odszego
SELECT * FROM Pracownicy WHERE DATEPART(year,DataUrodzenia)> 1990 ORDER BY DataUrodzenia
--Wyswitl pracowników, którzy urodzili siê pó¿niej ni¿ w czerwcu, od najm³odszego do najstarszego
SELECT * FROM Pracownicy WHERE DATEPART(month,DataUrodzenia)> 06 ORDER BY DataUrodzenia DESC
--Wyswitlic pracowników, którzy urodzili siê od 1970 do 1990 roku, od lutego do sierpnia
--Wyœwietl wyszukania alfabetycznie wed³ug nazwiska
SELECT * FROM Pracownicy
WHERE YEAR (DataUrodzenia) BETWEEN 1970 AND 1990 AND DATEPART(month,DataUrodzenia) BETWEEN 02 AND 08 ORDER BY Nazwisko
--Wyœwietl pracowników, którzy prze¿yli od 7000 do 10000 dni oraz urodzili siê od maja do grudnia
--Uszereguj ich od najm³odszego do najstarszego
SELECT * FROM Pracownicy WHERE DATEDIFF(DAY,DataUrodzenia, GETDATE()) BETWEEN 7000 AND 10000 AND MONTH(DataUrodzenia) BETWEEN 5 AND 12
ORDER BY DataUrodzenia DESC
--Wyswietl pracowników, którzy prze¿yli od 300 do 400 miesiêcy
SELECT*, DATEDIFF(MONTH,DataUrodzenia, GETDATE()) AS 'Liczba miesiêcy'
FROM Pracownicy
WHERE DATEDIFF (MONTH,DataUrodzenia, GETDATE()) BETWEEN 300 AND 400 
ORDER BY Nazwisko

--Wyœwietl czteroznakowy kod nazwy produktuw celu oceny podobieñstwa dwóch wyra¿eñ
--Uszereguj kody alfabetycznie
SELECT Cena,Nazwa, SOUNDEX(Nazwa) as 'Kod' FROM Produkty ORDER BY 'Kod'

--Wyœwietl liczbê oferowanych rodzajów produktów w asortymencie, najwy¿sz¹ i najni¿sz¹ cenê produktu oraz œredni¹ cenê wszystkich produktów
SELECT COUNT(*) AS [Liczba produktów w asortymencie],
MAX(Cena) AS [Najwy¿sza cena produktu], 
MIN(Cena) AS [Najni¿sza cena produktu],
AVG(Cena) AS [Œrednia cena produktów]
FROM Produkty

--Wyœwietl ile zosta³o zrealizowanych dostaw dla danego produktu (wyœwietl tak¿e idproduktu i jego nazwê) - do 5 dostaw w³¹cznie
SELECT a.IdProduktu, COUNT(*) AS [Liczba dostaw produktu], b.Nazwa
FROM DostawaProduktow a
INNER JOIN Produkty b 
ON b.IdProdukty = a.IdProduktu
GROUP BY a.IdProduktu, b.Nazwa
HAVING COUNT(*) <= 5
ORDER BY [Liczba dostaw produktu]

--Wyœwietl id, imiê i nazwisko klienta, który zrealizowa³ najwiêcej zamówieñ w sklepie online. Wyœwietliæ tak¿e liczbê tych zamówieñ oraz ich sumê
SELECT TOP 1 a.IdKlienta, b.Imie, b.Nazwisko, COUNT(a.IdZakupySklepOnline) [Liczba zamówieñ], SUM(d.Cena) [Suma kosztów wszystkich zamówieñ]
FROM ZakupySklepOnline a JOIN Klienci b ON a.IdKlienta=b.IdKlienci
JOIN ZakupySklepOnlineProdukt c ON a.IdZakupySklepOnline=c.IdZakupySklepOnlineProdukt
JOIN Produkty d ON c.IdProduktu=d.IdProdukty
GROUP BY a.IdKlienta, b.Imie, b.Nazwisko
ORDER BY COUNT(a.IdZakupySklepOnline) DESC

--Wyœwietl id, imiê i nazwisko klienta, który zrealizowa³ najwiêcej zamówieñ w sklepie stacjonarnym. Wyœwietliæ tak¿e liczbê tych zamówieñ oraz ich sumê
SELECT TOP 1 a.IdKlienta, b.Imie, b.Nazwisko, COUNT(a.IdZakupySklepStacjonarny) [Liczba zamówieñ], SUM(d.Cena) [Suma kosztów wszystkich zamówieñ]
FROM ZakupySklepStacjonarny a JOIN Klienci b ON a.IdKlienta=b.IdKlienci
JOIN ZakupySklepStacjonarnyProdukt c ON a.IdZakupySklepStacjonarny=c.IdZakupySklepStacjonarnyProdukt
JOIN Produkty d ON c.IdProduktu=d.IdProdukty
GROUP BY a.IdKlienta, b.Imie, b.Nazwisko
ORDER BY COUNT(a.IdZakupySklepStacjonarny) DESC

--Wyœwietliæ id, nazwisko, imiê, pensjê podsawow¹ premiê i nazwê dzia³u pracy pracowników, którzy maj¹ pensjê wynosz¹c¹ conajmniej 2200 i premiê licz¹c¹ nastêpuj¹ce liczby 10,15,20,30,50,80
SELECT a.IdPracownicy, Nazwisko, Imie, PensjaPodstawowa, Premia, NazwaDzialu FROM Pracownicy a JOIN Dzialy b ON a.IdDzialu=b.IdDzialy
WHERE Premia IN (10,15,20,30,50,80) AND [PensjaPodstawowa]>=2200

--Wyswietliæ id dostawcy, jego nazwê oraz iloœæ zrealizowanych dostaw
SELECT b.IdDostawcy, Nazwa, COUNT(distinct(IdDostawa)) AS 'liczba zrealizowanych dostaw przez dostawce'
FROM Dostawa AS a JOIN Dostawcy AS b ON a.IdDostawcy=b.IdDostawcy
GROUP BY b.IdDostawcy, Nazwa

--Wyœwietliæ id, nazwê produktu i iloœæ zmian jego ceny, która jest wy¿sza ni¿ 3
--Wyniki wyœweitliæ od najmniejszej liczby zmian ceny
SELECT IdProduktu, b.Nazwa, COUNT(IdProduktu) AS [Liczba zmian ceny]
FROM CenyProduktow AS a JOIN Produkty AS b ON a.IdProduktu =b.IdProdukty
GROUP BY IdProduktu, b.Nazwa
HAVING COUNT(IdProduktu) >3
ORDER BY [Liczba zmian ceny] ASC

--Wyœwietl najstarszych klientów sklepu z ka¿dego miasta
--Uszereguj ich od najstrszego do najm³odszego
SELECT Miasto, MAX(Wiek) AS [Najwy¿szy wiek klienta]
FROM Klienci
GROUP BY miasto
ORDER BY [Najwy¿szy wiek klienta] DESC

--Podaj œredni wiek klienta sklepu internetowego, z poszczególnych miast, dla wszystkich sposobów dostawy poza odbiorem osobistym
SELECT ROUND(AVG(Wiek),0) AS 'Œredni wiek klienta', Miasto, c.Nazwa
FROM Klienci AS a JOIN ZakupySklepOnline AS b ON a.IdKlienci=b.IdKlienta
JOIN RodzajDostawy AS c ON c.IdRodzajDostawy=b.Dostawa
WHERE b.Dostawa <=3
GROUP BY Miasto, c.Nazwa

--Uszeregowaæ produkty w sklepie wed³ug ceny malej¹co dodaj¹c numer pozycjiproduktu w rankingu
SELECT a.IdProdukty, Nazwa, Cena, IdKategorii, ROW_NUMBER() OVER (ORDER BY Cena DESC) AS Pozycja
FROM Produkty a ORDER BY Pozycja
--Wyœwietliæ 10 produktów o najwy¿szej cenie
SELECT TOP(10) IdProdukty, Nazwa, Cena, IdKategorii
FROM Produkty
ORDER BY Cena DESC

--ZnaleŸæ produkty, których cena przy zakupie by³a równa lub wiêksza od tej oferowanej klientom, w ró¿ych datach
--Uszereguj wyniki wed³ug pozycji - od najwy¿szej
SELECT  Cena, IdCenyProduktow, IdProduktu,
(SELECT COUNT(*) FROM Produkty WHERE Cena>=a.Cena) AS Pozycja
FROM CenyProduktow a
WHERE (SELECT COUNT(*) FROM Produkty WHERE Cena>=a.Cena) BETWEEN 1 AND 20
ORDER BY Pozycja

--Wyœweitl id, imiê i nazwisko pracownika, pensjê oraz nazwê dzia³, którzy zarabiaj¹ najwiêcej w swoim dziale
SELECT IdPracownicy, Imie, Nazwisko, PensjaPodstawowa, NazwaDzialu
FROM Pracownicy a JOIN Dzialy b on a.IdDzialu=b.IdDzialy
WHERE PensjaPodstawowa=(SELECT MAX(PensjaPodstawowa) FROM
Pracownicy a2 join Dzialy b2 on a2.IdDzialu=b2.IdDzialy
WHERE b2.NazwaDzialu=b.NazwaDzialu
GROUP BY b2.NazwaDzialu)

--Wyœwietl id i nazwê produktu wraz z jego iloœci¹ w ka¿dej z dostaw danego produktu oraz numer tej dostawy. Dodatkowo podaej cenê produktu w systemie, cenê jednostkow¹ za sztukê produktu
--kupowanego od dostawcy oraz œredni¹ cenê produktu we wszystkich terminach zmiany ceny - powy¿ej 3000. Uszereguj produkty od ceny kupna od dostawców malej¹co
SELECT IdProdukty, Nazwa, b.Ilosc , b.NumerDostawy, a.Cena AS [Cena w systemie], b.CenaZaSztuke AS [Cena kupna od dostawcy], AVG(c.Cena) AS [Œrednia cena w sklepie we wszystkich terminach]
FROM Produkty a JOIN DostawaProduktow b ON a.IdProdukty=b.IdProduktu
JOIN CenyProduktow c ON c.IdProduktu=b.IdProduktu
GROUP BY IdProdukty, Nazwa, b.Ilosc , b.NumerDostawy, a.Cena, b.CenaZaSztuke
HAVING AVG(c.Cena)>3000
ORDER BY b.CenaZaSztuke DESC

--ZnaleŸæ pracowników, których stawka pensji podstawowej przypadaj¹ca na 2 dni pracy jest wy¿sza ni¿ mediana ceny jednostkowej wszystkich produków kupowanych od dostawców 
--Wyœwietl stawki do 2 miejsc po przecinku oraz dzia³, w którym pracuje pracownik
--Uszereguj wyniki wed³ug stawki dwudniowej malej¹co
SELECT a.IdPracownicy, Imie, Nazwisko, d.NazwaDzialu, CAST((PensjaPodstawowa/15) AS DECIMAL(5, 2)) AS [Stawka pracownika za 2 dni pracy (œrednio)],
( (SELECT MAX(CenaZaSztuke) FROM
   (SELECT TOP 50 PERCENT CenaZaSztuke FROM DostawaProduktow ORDER BY CenaZaSztuke) AS BH)
 +
 (SELECT MIN(CenaZaSztuke) FROM
   (SELECT TOP 50 PERCENT CenaZaSztuke FROM DostawaProduktow ORDER BY CenaZaSztuke DESC) AS TH)
) / 2 AS [Mediana cen produktów w systemia]
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
ORDER BY [Stawka pracownika za 2 dni pracy (œrednio)] DESC

--Wyœwietl nazwisko, wiek, email, ulicê, numer ulicy i miasto klientów z Gdyni, Gdañska, Warszawy i Krakowa oraz te same dane klientów, którzy mieszkaj¹ na ulicy o numerze 2 lub maj¹ 40 lat
SELECT Nazwisko, Wiek, email, Ulica, NumerUlicy, Miasto FROM Klienci
WHERE Miasto IN ( 'Gdynia', 'Gdañsk', 'Warszawa', 'Kraków')
UNION
SELECT Nazwisko, Wiek, email,  Ulica, NumerUlicy, Miasto FROM Klienci
WHERE NumerUlicy = 2
UNION
SELECT Nazwisko, Wiek, email,  Ulica, NumerUlicy, Miasto FROM Klienci
WHERE Wiek = 40
ORDER BY Miasto, Nazwisko