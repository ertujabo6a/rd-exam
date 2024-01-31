SELECT NazevFirmy, Vlozeno, NazevZbozi, CenazaJednotku, ProdejniCenazaJ, Marze, Nasklade, 
Nasklade * CenazaJednotku AS 'Hodnota_Skladu', ZZ.ZboziKategorie, NazevKategorie
FROM Dodavatel.Identifikace AS DI
INNER JOIN Dodavatel.Zbozi AS DZ on DI.DodavatelID = DZ.DodavatelID
INNER JOIN Zbozi.Zbozi AS ZZ on DZ.ZboziID = ZZ.ZboziID
INNER JOIN Zbozi.Kategorie AS ZK on ZZ.ZboziKategorie = ZK.ZboziKategorie
WHERE Nasklade > 5 AND YEAR(Vlozeno) = '2023'
GROUP BY NazevFirmy, Vlozeno, NazevZbozi, CenazaJednotku, ProdejniCenazaJ, Marze, Nasklade, 
Nasklade * CenazaJednotku, ZZ.ZboziKategorie, NazevKategorie
HAVING Marze >= (SELECT AVG(Marze) FROM Zbozi.Zbozi)
ORDER BY Nasklade DESC;