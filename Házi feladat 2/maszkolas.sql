CREATE TABLE webshop_ugyfel (
    LOGIN TEXT MASKED WITH (FUNCTION = 'partial(1,"XXX",1)'),
    EMAIL TEXT MASKED WITH (FUNCTION = 'email()'),
    NEV TEXT,
    SZULEV INTEGER MASKED WITH (FUNCTION = 'random(1950,2000)'),
    NEM TEXT,
    CIM TEXT MASKED WITH (FUNCTION = 'partial(0,"XXX",8)')
);

INSERT INTO webshop_ugyfel (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) 
VALUES ('adam1', 'ádám.kiss@mail.hu', 'Kiss Ádám', '1991', 'F', '5630 Békés, Szolnoki út 8.');

INSERT INTO webshop_ugyfel (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) 
VALUES ('adam3', 'adam3@gmail.com', 'Barkóci Ádám', '1970', 'F', '3910 Tokaj, Dózsa György utca 37.');

INSERT INTO webshop_ugyfel (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) 
VALUES ('adam4', 'ádám.bieniek@mail.hu', 'Bieniek Ádám', '1976', 'F', '8630 Balatonboglár, Juhászföldi út 1.');

INSERT INTO webshop_ugyfel (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) 
VALUES ('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', '1979', 'N', '5200 Törökszentmiklós, Deák Ferenc út 5.');

CREATE USER MaskUser WITHOUT LOGIN;
GRANT SELECT ON webshop_ugyfel TO MaskUser;

--maszk
EXECUTE AS USER = 'MaskUser';
SELECT * FROM webshop_ugyfel;
--maszk nélkül
REVERT;
SELECT * FROM webshop_ugyfel;