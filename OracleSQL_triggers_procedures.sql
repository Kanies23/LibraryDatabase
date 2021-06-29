/*
 deleteReader - sprawdza przed usunięciem czytelnika czy ten nie ma jakiejś 	nieoddanej książki, w takim wypadku aplikacja wywołuje błąd.
 */
CREATE OR REPLACE TRIGGER deleteReader
    BEFORE DELETE OR UPDATE
    ON CZYTELNIK
    FOR EACH ROW
DECLARE
    niezwrocone integer := 0;
BEGIN
    SELECT COUNT(*)
    INTO niezwrocone
    FROM WYPOZYCZENIE
    WHERE WYPOZYCZENIE.IDCZYTELNIK = :old.idczytelnik
      AND DATAZWROTU IS NULL;
    IF DELETING THEN
        IF niezwrocone > 0 THEN
            raise_application_error(-20500, 'Czytelnik ma niezwrócone książki');
        end if;
    end if;
    IF UPDATING THEN
        IF niezwrocone > 0 AND (:new.NRTELEFONU is null OR :new.NRTELEFONU = '') THEN
            :new.NRTELEFONU := :old.nrtelefonu;
            DBMS_OUTPUT.PUT_LINE('Nie mozna usunąć numeru osoby która nie oddała wszystkich ksiązek');
        end if;
    end if;
end;



/*
 addAutor - sprawdza czy dodawany do tabeli autor nie występuje już gdzieś w tej tabeli, a jeśli tak to zwraca jego id i wywołuje błąd
 */
CREATE OR REPLACE TRIGGER addAutor
    BEFORE INSERT
    ON AUTOR
    FOR EACH ROW
declare
    znalezione integer := 0;
    v_idautor  autor.idautor%type;
BEGIN
    SELECT IDAUTOR, COUNT(*)
    INTO v_idautor, znalezione
    FROM AUTOR
    WHERE IMIE = :new.imie
      AND NAZWISKO = :new.NAZWISKO
    GROUP BY IDAUTOR;
    IF znalezione > 0 THEN
        raise_application_error(-20501, 'Autor już występuje  pod id: ' || v_idautor);
    end if;
EXCEPTION
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nie znaleziono autora, wstawiono pod id: ' || :new.IDAUTOR);
end;



/*
 increaseByPercent - procedura z Cursorem która przyjmuje dwa parametry v_percent oraz v_limitValue. Pozwala użytkownikowi podnieść kwoty za spóźnienie o wartość procentową podaną jako liczba (bez 0.4 tylko np 40)
    której maksymalna wysokość przed podniesieniem wynosi v_limitValue, po czym wypisuje na konsole uzyskane zmiany
 */
CREATE OR REPLACE PROCEDURE increaseByPercent(v_percent integer, v_limitValue integer)
AS
    CURSOR titleIncrease IS SELECT KSIAZKA.TYTUL, STAN.IDSTAN, STAN.KWOTAZASPOZNIENIE
                            FROM STAN
                                     JOIN KSIAZKA on KSIAZKA.IDKSIAZKA = STAN.IDKSIAZKI FOR UPDATE OF stan.KWOTAZASPOZNIENIE;
    v_rekord    titleIncrease%ROWTYPE;
    v_nowaKwota NUMBER(6, 2) := 0;
BEGIN
    OPEN titleIncrease;
    Loop
        FETCH titleIncrease INTO v_rekord;
        EXIT WHEN titleIncrease%NOTFOUND;
        IF v_rekord.KWOTAZASPOZNIENIE < v_limitValue THEN
            v_nowaKwota := v_rekord.KWOTAZASPOZNIENIE * (1 + (v_percent / 100));
            UPDATE STAN SET KWOTAZASPOZNIENIE = v_nowaKwota WHERE CURRENT OF titleIncrease;
            DBMS_OUTPUT.PUT_LINE('Zmieniono cenę książki o ID: ' || v_rekord.IDSTAN || ', tytule: ' || v_rekord.TYTUL ||
                                 ', na kwotę: ' || v_nowaKwota);
        end if;
    end loop;
    CLOSE titleIncrease;
end;



/*
 zwrotKsiazki - powoduje wstawienie aktualnej daty w kolumnie daty zwrotu, jako parametr przyjmuje idStanu czyli unikalny identyfikator danego egzemplarza książki.
 */
CREATE OR REPLACE PROCEDURE zwrotKsiazki(idStanu integer)
AS
    v_kwota    stan.KWOTAZASPOZNIENIE%type;
    v_iloscDni integer;
BEGIN
    UPDATE WYPOZYCZENIE SET DATAZWROTU = SYSDATE WHERE DATAZWROTU IS NULL AND IDSTAN = idStanu;
    SELECT KWOTAZASPOZNIENIE INTO v_kwota FROM STAN where IDSTAN = idStanu;
    SELECT ROUND((SYSDATE - DATAWYPOZYCZENIA)) INTO v_iloscDni FROM WYPOZYCZENIE where IDSTAN = idStanu;
    IF v_kwota * v_iloscDni < 0 THEN
        v_kwota := 0;
    ELSE
        v_kwota := v_kwota * v_iloscDni;
    end if;
    DBMS_OUTPUT.PUT_LINE('Opłata za zwrot książki wynosi: ' || v_kwota);
end;


