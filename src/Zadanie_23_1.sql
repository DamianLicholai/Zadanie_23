CREATE DATABASE Zadanie23 COLLATE utf8mb4_polish_ci;
-- 1


CREATE TABLE worker (
    id INT PRIMARY KEY AUTO_INCREMENT,
    workerName VARCHAR(30) NOT NULL,
    workerLastName VARCHAR(40) NOT NULL,
    workerSallary double Not NULL,
    birthDate date NOT NULL,
    position VARCHAR(40) NOT NULL
);


-- 2
INSERT INTO worker 
(workerName, workerLastName, workerSallary, birthDate, position)
values 
('Robert' , 'Lewandowski', 5000, '1990-10-10' , 'Księgowy'),
('Piotr' , 'Zieliński', 8000, '1997-06-10' , 'Logistyk'),
('Grzegorz' , 'Krychowiak', 7000, '1995-10-10' , 'Programista'),
('Karol' , 'Linettty', 8500, '1999-8-9' , 'Administrator'),
('Tymoteusz' , 'Puchacz', 7500, '1999-1-11' , 'Administrator'),
('Łukasz' , 'Fabiański0', 6000, '1980-07-06' , 'Wdrożeniowiec')
;


-- 3
select*
from worker
order by workerLastName;

-- 4
select*
from worker
where position = 'Administrator';

-- 5
select*
from worker
where ABS(datediff(birthDate, CURDATE())) > 30*365;

-- 6
update worker
Set workerSallary = workerSallary * 1.1
where id = 6;

-- 7

select *
from worker
order by birthDate DESC
limit 1;

-- 8

Drop table worker;

-- 9 Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)

CREATE TABLE stanowisko (
    id INT PRIMARY KEY AUTO_INCREMENT,
    NazwaStanowiska VARCHAR(50) NOT NULL,
    Opis VARCHAR(300) NOT NULL,
    wypłata double Not NULL
);





-- 10. Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)

CREATE TABLE adres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Ulica_Numer_domu_mieszkanie VARCHAR(200) NOT NULL,
    Kod_pocztowy VARCHAR(300) NOT NULL,
    Miejscowość VARCHAR(50) Not NULL
);


-- 11. Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres

CREATE TABLE pracownik (
    id INT PRIMARY KEY AUTO_INCREMENT,
    imię VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(40) NOT NULL,
    stanowisko_id int not null,
    adres_id int not null,
    foreign key (stanowisko_id) references stanowisko (id),
    foreign key (adres_id) references adres (id)
);

-- 12. Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)

INSERT INTO stanowisko 
(NazwaStanowiska, Opis, wypłata)
values 
('Wdrożeniowiec' , 'Wdrażanie systemów i utrzymywanie relacji z klientem', 6000),
('Programista' , 'Tworzenie nowych aplikacji oraz dbanie o czystość kodu', 10000),
('Administrator' , 'Utrzymanie infrastruktury aplikacji', 8000)
;

INSERT INTO adres 
(Ulica_Numer_domu_mieszkanie, Kod_pocztowy, Miejscowość)
values 
('Podkarpaca 33/55' , '35-012', 'Rzeszów'),
('Otwocka 3/22' , '38-044', 'Warszawa'),
('Poznańska 12/11' , '32-011', 'Kraków')
;

INSERT INTO pracownik 
(imię, nazwisko, stanowisko_id, adres_id) 
values
('Jan', 'Kowal', 1, 1),
('Adam', 'Maliniak', 2, 2),
('Karol', 'Kiełb', 3, 3)
;

-- 13. Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)

select *
from pracownik
join stanowisko on pracownik.stanowisko_id = stanowisko.id
join adres on pracownik.adres_id = adres.id
;

-- 14. Oblicza sumę wypłat dla wszystkich pracowników w firmie

select sum(wypłata)
from pracownik
join stanowisko on pracownik.stanowisko_id = stanowisko.id
join adres on pracownik.adres_id = adres.id
;

-- 15. Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)

select *
from pracownik
join stanowisko on pracownik.stanowisko_id = stanowisko.id
join adres on pracownik.adres_id = adres.id
where Kod_pocztowy = '32-011'
;
















