--Gatunek
INSERT ALL
    INTO GATUNEK (IDGATUNEK, OPIS) VALUES (0,'Epika')
    INTO GATUNEK (IDGATUNEK, OPIS) VALUES (1,'Liryka')
    INTO GATUNEK (IDGATUNEK, OPIS) VALUES (2,'Dramat')
SELECT * FROM dual;

--Autor
INSERT ALL
INTO AUTOR (IDAUTOR, IMIE, NAZWISKO) VALUES (0,'Nieznany','Nieznany')
INTO AUTOR (idautor, imie, nazwisko) VALUES (1,'Adam','Mickiewicz')
INTO AUTOR (idautor, imie, nazwisko) VALUES (2,'Jan','Kochanowski')
INTO AUTOR (idautor, imie, nazwisko) VALUES (3,'Juliusz','Słowacki')
INTO AUTOR (idautor, imie, nazwisko) VALUES (4,'Ignacy','Krasicki')
INTO AUTOR (idautor, imie, nazwisko) VALUES (5,'William','Shakespeare')
SELECT * FROM dual;

--Ksiazka
INSERT ALL
INTO KSIAZKA(idksiazka, idgatunek, idautor, tytul, isbn, opis) VALUES (0,0,1,'Pan Tadeusz','9780781800334','Pan Tadeusz, czyli ostatni zajazd na Litwie – poemat epicki Adama Mickiewicza wydany w dwóch tomach w 1834 w Paryżu przez Aleksandra Jełowickiego. Ta epopeja narodowa powstała w latach 1832–1834 w Paryżu. Składa się z dwunastu ksiąg pisanych wierszem, trzynastozgłoskowym aleksandrynem polskim.')
INTO KSIAZKA(idksiazka, idgatunek, idautor, tytul, isbn, opis) VALUES (1,2,1,'Dziady cz. II','9788376703947','Dziady część II – utwór dramatyczny Adama Mickiewicza należący do cyklu dramatów Dziady. Utwór powstawał w latach 1821–1822 w Kownie. Opublikowany został w roku 1823 w drugim tomie Poezji wraz z wierszem Upiór i dramatem Dziady część IV.')
INTO KSIAZKA(idksiazka, idgatunek, idautor, tytul, isbn, opis) VALUES (2,1,2,'Na dom w Czarnolesie','0000000000','„Na dom w Czarnolesie”, fraszka Jana Kochanowskiego to utwór o charakterze religijnym o widocznych akcentach autobiograficznych.')
INTO KSIAZKA(idksiazka, idgatunek, idautor, tytul, isbn, opis) VALUES (3,2,3,'Balladyna','9788304014893','Balladyna – dramat romantyczny w pięciu aktach, napisany przez Juliusza Słowackiego w Genewie w 1834 roku, a wydany w Paryżu w roku 1839.')
INTO KSIAZKA(idksiazka, idgatunek, idautor, tytul, isbn, opis) VALUES (4,0,4,'Żona modna','9788366729469','Żona modna – satyra autorstwa Ignacego Krasickiego. Utwór stanowi część zbioru satyr, opracowywanego w latach 1778-1779 i opublikowanego w 1 września 1779. Zbiór ukazał się pt. Satyry. Za przywilejem. W Warszawie 1779, nazywany jest tradycyjnie Satyr częścią pierwszą.')
INTO KSIAZKA(idksiazka, idgatunek, idautor, tytul, isbn, opis) VALUES (5,2,5,'Romeo i Julia','9781402790027','Romeo i Julia – dramat angielskiego pisarza Williama Szekspira napisany we wczesnym stadium jego kariery. Przedstawia historię tragicznej miłości dwojga młodych ludzi, którzy stali się wzorcami romantycznych kochanków. Historia toczy się w Weronie i Mantui.')
SELECT * FROM dual;

--Stan
INSERT ALL
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (0,0,SYSDATE,0.30)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (1,0,SYSDATE,0.30)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (2,1,SYSDATE,0.40)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (3,1,SYSDATE,0.40)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (4,2,SYSDATE,0.50)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (5,2,SYSDATE,0.50)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (6,3,SYSDATE,0.60)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (7,3,SYSDATE,0.60)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (8,4,SYSDATE,0.70)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (9,4,SYSDATE,0.70)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (10,5,SYSDATE,0.80)
INTO STAN(idstan, idksiazki, datadodania, kwotazaspoznienie) VALUES (11,5,SYSDATE,0.80)
SELECT * FROM DUAL;

--Pracownik
INSERT ALL
INTO PRACOWNIK(idpracownik, imie, nazwisko) VALUES (0, 'Andrzej','Kowalski')
INTO PRACOWNIK(idpracownik, imie, nazwisko) VALUES (1,'Jan','Nowak')
INTO PRACOWNIK(idpracownik, imie, nazwisko) VALUES (2,'Anna','Wiśniewska')
SELECT * FROM dual;

--Czytelnik
INSERT ALL
INTO CZYTELNIK(idczytelnik, imie, nazwisko, nrtelefonu) VALUES (0,'Michał','Bajurski','36273')
INTO CZYTELNIK(idczytelnik, imie, nazwisko, nrtelefonu) VALUES (1,'Wiktor','Andrzejewski','11906')
INTO CZYTELNIK(idczytelnik, imie, nazwisko, nrtelefonu) VALUES (2,'Michalina','Kacprzak','46720')
INTO CZYTELNIK(idczytelnik, imie, nazwisko, nrtelefonu) VALUES (3,'Antonina','Rudnicka','43303')
INTO CZYTELNIK(idczytelnik, imie, nazwisko, nrtelefonu) VALUES (4,'Julia','Kowalewska','40946')
INTO CZYTELNIK(idczytelnik, imie, nazwisko, nrtelefonu) VALUES (5,'Małgorzata','Kordalewska','81544')
SELECT * FROM dual;

--Wypożyczenie
INSERT ALL
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (0,0,0,0,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (1,0,1,0,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (2,1,2,1,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (3,2,3,1,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (4,2,4,2,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (5,1,5,2,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (6,1,6,3,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (7,0,7,3,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (8,0,8,4,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (9,2,9,4,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (10,1,10,5,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/07/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (11,0,11,5,(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),null)
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (12,0,0,1,(TO_DATE('2021/05/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/06/22 12:00:00', 'yyyy/mm/dd hh24:mi:ss')))
INTO WYPOZYCZENIE(idwypozyczenie, idpracownik, idstan, idczytelnik, datawypozyczenia, termin, datazwrotu) VALUES (13,2,1,3,(TO_DATE('2021/05/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/06/15 12:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2021/06/22 12:00:00', 'yyyy/mm/dd hh24:mi:ss')))
SELECT * FROM dual;