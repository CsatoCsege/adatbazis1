-- Hozzávalók tábla
CREATE TABLE Hozzavalok (
    hozzavalo_id INT PRIMARY KEY,
    nev VARCHAR(100) NOT NULL,
    tipus VARCHAR(50),
    alkohol_szazalek DECIMAL(5,2)
);

-- Koktélok tábla
CREATE TABLE Koktelok (
    koktel_id INT PRIMARY KEY,
    nev VARCHAR(100) NOT NULL,
    szarmazas VARCHAR(100),
    nehezseg INT CHECK (nehezseg BETWEEN 1 AND 10)
);

-- Emberek tábla
CREATE TABLE Emberek (
    ember_id INT PRIMARY KEY,
    nev VARCHAR(100) NOT NULL,
    szomjassagi_szintje INT CHECK (szomjassagi_szintje BETWEEN 1 AND 10),
    email VARCHAR(255) UNIQUE CHECK (email LIKE '%@%.%')
);

-- Koktél összetevők kapcsolótábla
CREATE TABLE Koktel_Osszetevok (
    koktel_id INT,
    hozzavalo_id INT,
    mennyiseg VARCHAR(50),
    PRIMARY KEY (koktel_id, hozzavalo_id),
    FOREIGN KEY (koktel_id) REFERENCES Koktelok(koktel_id),
    FOREIGN KEY (hozzavalo_id) REFERENCES Hozzavalok(hozzavalo_id)
);

-- Koktél vélemények tábla
CREATE TABLE Koktel_Velemeny (
    ember_id INT,
    koktel_id INT,
    velemeny VARCHAR(500),
    ertekeles INT NOT NULL CHECK (ertekeles BETWEEN 1 AND 5),
    ertekeles_datuma DATE,
    PRIMARY KEY (ember_id, koktel_id),
    FOREIGN KEY (ember_id) REFERENCES Emberek(ember_id),
    FOREIGN KEY (koktel_id) REFERENCES Koktelok(koktel_id)
);
INSERT INTO Hozzavalok VALUES
(1, 'Vodka', 'alkohol', 40.0),
(2, 'Gin', 'alkohol', 40.0),
(3, 'Rum', 'alkohol', 37.5),
(4, 'Tequila', 'alkohol', 38.0),
(5, 'Whiskey', 'alkohol', 40.0),
(6, 'Triple Sec', 'likőr', 30.0),
(7, 'Campari', 'aperitív', 25.0),
(8, 'Vermouth', 'aperitív', 18.0),
(9, 'Narancslé', 'gyümölcslé', 0.0),
(10, 'Grapefruitlé', 'gyümölcslé', 0.0),
(11, 'Málnalé', 'gyümölcslé', 0.0),
(12, 'Áfonyalé', 'gyümölcslé', 0.0),
(13, 'Tonik', 'mixer', 0.0),
(14, 'Szódavíz', 'mixer', 0.0),
(15, 'Cola', 'mixer', 0.0),
(16, 'Gyömbérsör', 'mixer', 0.0),
(17, 'Málnaszörp', 'szörp', 0.0),
(18, 'Áfonyaszörp', 'szörp', 0.0),
(19, 'Citromlé', 'gyümölcslé', 0.0),
(20, 'Frissen facsart lime lé', 'gyümölcslé', 0.0),
(21, 'Cukorszirup', 'szörp', 0.0),
(22, 'Habitare', 'likőr', 35.0),
(23, 'Jägermeister', 'likőr', 35.0),
(24, 'Kávélikőr', 'likőr', 20.0),
(25, 'Peach schnapps', 'likőr', 20.0),
(26, 'Friss mentalevél', 'egyéb', 0.0),
(27, 'Jégkocka', 'egyéb', 0.0),
(28, 'Cukor', 'egyéb', 0.0),
(29, 'Só', 'egyéb', 0.0),
(30, 'Bors', 'egyéb', 0.0);
INSERT INTO Koktelok VALUES
(1, 'Vodka Narancs', 'Egyesült Államok', 2),
(2, 'Gin Tonik', 'Anglia', 3),
(3, 'Málnás Vodka', 'Magyarország', 4),
(4, 'Margarita', 'Mexikó', 6),
(5, 'Mojito', 'Kuba', 5),
(6, 'Piña Colada', 'Puerto Rico', 4),
(7, 'Cosmopolitan', 'Egyesült Államok', 5),
(8, 'Negroni', 'Olaszország', 7),
(9, 'Old Fashioned', 'Egyesült Államok', 8),
(10, 'Espresso Martini', 'Anglia', 6);
INSERT INTO Emberek (ember_id, nev, szomjassagi_szintje, email) VALUES
(1, 'Kovács János', 8, 'kovacs.janos@example.com'),
(2, 'Nagy Eszter', 5, 'nagy.eszter@example.com'),
(3, 'Tóth Béla', 3, 'toth.bela@example.com'),
(4, 'Horváth Anna', 7, 'horvath.anna@example.com'),
(5, 'Varga Miklós', 2, 'varga.miklos@example.com');
INSERT INTO Koktel_Osszetevok VALUES
-- Vodka Narancs
(1, 1, '4 cl'), (1, 9, '12 cl'),
-- Gin Tonik
(2, 2, '4 cl'), (2, 13, '12 cl'),
-- Málnás Vodka
(3, 1, '5 cl'), (3, 17, '2 cl'),
-- Margarita
(4, 4, '5 cl'), (4, 6, '2 cl'), (4, 20, '2 cl'),
-- Mojito
(5, 3, '4 cl'), (5, 20, '2 cl'), (5, 21, '2 cl'), (5, 26, '5 levél'),
-- Piña Colada
(6, 3, '4 cl'), (6, 9, '8 cl'), (6, 21, '2 cl'),
-- Cosmopolitan
(7, 1, '4 cl'), (7, 6, '1.5 cl'), (7, 11, '1.5 cl'), (7, 20, '1.5 cl'),
-- Negroni
(8, 2, '3 cl'), (8, 7, '3 cl'), (8, 8, '3 cl'),
-- Old Fashioned
(9, 5, '4.5 cl'), (9, 21, '1 cl'), (9, 28, '1 csipet'),
-- Espresso Martini
(10, 1, '5 cl'), (10, 24, '3 cl'), (10, 21, '1 cl');
INSERT INTO Koktel_Velemeny VALUES
(1, 1, 'Nagyon finom, frissítő ital!', 4, '2023-05-15'),
(1, 2, 'Klasszikus ízek, tökéletes arányban', 5, '2023-06-20'),
(2, 1, 'Átlagos, semmi különös', 3, '2023-04-10'),
(2, 3, 'Érdekes ízkombináció', 4, '2023-07-05'),
(3, 2, 'Mindig ezt iszom, imádom!', 5, '2023-08-12'),
(4, 5, 'Tökéletes nyári ital', 5, '2023-07-30'),
(4, 7, 'Nagyon elegáns koktél', 4, '2023-09-01'),
(5, 8, 'Erős, fanyar íz, nem mindenkinek való', 2, '2023-08-25'),
(5, 10, 'Tökéletes kávés koktél', 5, '2023-09-05'),
(3, 4, 'Kellemesen savanykás, frissítő', 4, '2023-07-18');
-- SELECT * FROM Koktel_Velemeny;