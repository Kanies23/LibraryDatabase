-- tables
-- Table: Autor
CREATE TABLE Autor (
    IdAutor integer  NOT NULL,
    Imie varchar2(100)  NOT NULL,
    Nazwisko varchar2(100)  NOT NULL,
    CONSTRAINT Autor_pk PRIMARY KEY (IdAutor)
) ;

-- Table: Czytelnik
CREATE TABLE Czytelnik (
    IdCzytelnik integer  NOT NULL,
    Imie varchar2(100)  NOT NULL,
    Nazwisko varchar2(100)  NOT NULL,
    NrTelefonu varchar2(15)  NOT NULL,
    CONSTRAINT Czytelnik_pk PRIMARY KEY (IdCzytelnik)
) ;

-- Table: Gatunek
CREATE TABLE Gatunek (
    IdGatunek integer  NOT NULL,
    Opis varchar2(100)  NOT NULL,
    CONSTRAINT Gatunek_pk PRIMARY KEY (IdGatunek)
) ;

-- Table: Ksiazka
CREATE TABLE Ksiazka (
    IdKsiazka integer  NOT NULL,
    IdGatunek integer  NOT NULL,
    IdAutor integer  NOT NULL,
    Tytul varchar2(100)  NOT NULL,
    ISBN varchar2(30)  NOT NULL,
    Opis varchar2(500)  NOT NULL,
    CONSTRAINT Ksiazka_pk PRIMARY KEY (IdKsiazka)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    IdPracownik integer  NOT NULL,
    Imie varchar2(100)  NOT NULL,
    Nazwisko varchar2(100)  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (IdPracownik)
) ;

-- Table: Stan
CREATE TABLE Stan (
    IdStan integer  NOT NULL,
    IdKsiazki integer  NOT NULL,
    DataDodania date  NOT NULL,
    KwotaZaSpoznienie number(6,2)  NOT NULL,
    CONSTRAINT Stan_pk PRIMARY KEY (IdStan)
) ;

-- Table: Wypozyczenie
CREATE TABLE Wypozyczenie (
    IdWypozyczenie integer  NOT NULL,
    IdPracownik integer  NOT NULL,
    IdStan integer  NOT NULL,
    IdCzytelnik integer  NOT NULL,
    DataWypozyczenia date  NOT NULL,
    Termin date  NOT NULL,
    DataZwrotu date  NULL,
    CONSTRAINT Wypozyczenie_pk PRIMARY KEY (IdWypozyczenie)
) ;

-- foreign keys
-- Reference: Ksiazka_Autor (table: Ksiazka)
ALTER TABLE Ksiazka ADD CONSTRAINT Ksiazka_Autor
    FOREIGN KEY (IdAutor)
    REFERENCES Autor (IdAutor);

-- Reference: Ksiazka_Gatunek (table: Ksiazka)
ALTER TABLE Ksiazka ADD CONSTRAINT Ksiazka_Gatunek
    FOREIGN KEY (IdGatunek)
    REFERENCES Gatunek (IdGatunek);

-- Reference: Stan_Czytelnik (table: Wypozyczenie)
ALTER TABLE Wypozyczenie ADD CONSTRAINT Stan_Czytelnik
    FOREIGN KEY (IdCzytelnik)
    REFERENCES Czytelnik (IdCzytelnik);

-- Reference: Stan_Ksiazka (table: Stan)
ALTER TABLE Stan ADD CONSTRAINT Stan_Ksiazka
    FOREIGN KEY (IdKsiazki)
    REFERENCES Ksiazka (IdKsiazka);

-- Reference: Wypozyczenie_Pracownik (table: Wypozyczenie)
ALTER TABLE Wypozyczenie ADD CONSTRAINT Wypozyczenie_Pracownik
    FOREIGN KEY (IdPracownik)
    REFERENCES Pracownik (IdPracownik);

-- Reference: Wypozyczenie_Stan (table: Wypozyczenie)
ALTER TABLE Wypozyczenie ADD CONSTRAINT Wypozyczenie_Stan
    FOREIGN KEY (IdStan)
    REFERENCES Stan (IdStan);

-- End of file.