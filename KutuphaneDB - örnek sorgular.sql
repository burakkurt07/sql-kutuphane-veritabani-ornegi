--İşlem Süresi Hesaplama Fonksiyonu
CREATE FUNCTION hesapla_kitap_kalma_suresi(@islemno INT)
RETURNS INT
AS
BEGIN
  DECLARE @atarih DATE;
  DECLARE @vtarih DATE;
  DECLARE @kalma_suresi INT;

  SELECT @atarih = atarih, @vtarih = vtarih
  FROM islem
  WHERE islemno = @islemno;

  SET @kalma_suresi = DATEDIFF(DAY, @atarih, @vtarih);

  RETURN @kalma_suresi;
END;

---Matematik Türünde Kitap Alan Öğrencilerin Adını Listeleme
SELECT o.ograd
FROM ogrenci o
INNER JOIN islem i ON o.ogrno = i.ogrno
INNER JOIN kitap k ON i.kitapno = k.kitapno
INNER JOIN tur t ON k.turno = t.turno
WHERE t.turadi = 'Matematik';

--Yeni Yazar Ekleme İşlemi
CREATE PROCEDURE sp_YazarEkle
    @yazarad NVARCHAR(50),
    @yazarsoyad NVARCHAR(50)
AS
BEGIN
    INSERT INTO yazar (yazarad, yazarsoyad)
    VALUES (@yazarad, @yazarsoyad);
END;

--Çağrı
EXEC sp_YazarEkle 'Yeni Yazar Adı', 'Yeni Yazar Soyadı';


--Otomatik Alış Tarihi Güncelleme Triggerı
CREATE TRIGGER tr_ogrenci_kitap_alis
ON islem
AFTER INSERT
AS
BEGIN
  UPDATE islem
  SET atarih = GETDATE()
  WHERE islemno IN (SELECT islemno FROM inserted);
END;


--Peyami Safa İsimli Yazarın Kitaplarının Adını Listeleme
SELECT k.kitapadi
FROM kitap k
INNER JOIN yazar y ON k.yazarno = y.yazarno
WHERE y.yazarad = 'Peyami' AND y.yazarsoyad = 'Safa';


--Einstein’ın Kitaplarını Alan Öğrencilerin Adını ve Soyadını Listeleme
SELECT o.ograd, o.ogrsoyad
FROM ogrenci o
INNER JOIN islem i ON o.ogrno = i.ogrno
INNER JOIN kitap k ON k.kitapno = i.kitapno
INNER JOIN yazar y ON k.yazarno = y.yazarno
WHERE y.yazarad = 'Einstein' OR y.yazarsoyad = 'Einstein';

--Erkek ve Kadın Öğrenci Sayılarını Listeleyen Sorgu
SELECT cinsiyet, COUNT(*) AS sayi
FROM ogrenci
GROUP BY cinsiyet;

--En Popüler Yazarları Listeleyen SQL Sorgusu (ilk 5 yazar)
SELECT y.yazarad, y.yazarsoyad, COUNT(*) AS kitap_sayisi
FROM kitap k
INNER JOIN yazar y ON k.yazarno = y.yazarno
GROUP BY y.yazarad, y.yazarsoyad
ORDER BY COUNT(*) DESC
LIMIT 5;

--En Son Hangi Kitap Öğrenci Tarafından İade Edildi?
SELECT k.kitapadi
FROM kitap k
INNER JOIN islem i ON i.kitapno = k.kitapno
WHERE i.vtarih = (
    SELECT MAX(vtarih)
    FROM islem
);

--Hangi Öğrenci En Fazla Kitap Ödünç Almış?

SELECT o.ograd, o.ogrsoyad, COUNT(*) AS kitap_sayisi
FROM ogrenci o
INNER JOIN islem i ON i.ogrno = o.ogrno
GROUP BY o.ograd, o.ogrsoyad
HAVING COUNT(*) = (
    SELECT MAX(kitap_sayisi)
    FROM (
        SELECT COUNT(*) AS kitap_sayisi
        FROM islem
        GROUP BY ogrno
    ) AS t
);













