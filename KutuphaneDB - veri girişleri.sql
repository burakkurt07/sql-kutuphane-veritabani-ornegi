-- İşlem tablosuna veri ekleme
INSERT INTO islem (islemno, ogrno, kitapno, atarih, vtarih)
VALUES (1, 101, 201, '2023-06-01', '2023-06-10'),
       (2, 102, 202, '2023-06-02', '2023-06-12'),
       (3, 103, 203, '2023-06-03', '2023-06-13'),
       (4, 104, 204, '2023-06-04', '2023-06-14'),
       (5, 105, 205, '2023-06-05', '2023-06-15'),
       (6, 106, 206, '2023-06-06', '2023-06-16'),
       (7, 107, 207, '2023-06-07', '2023-06-17');

-- Öğrenci tablosuna veri ekleme
INSERT INTO ogrenci (ogrno, ograd, ogrsoyad, cinsiyet, dtarih, sinif)
VALUES (101, 'Ahmet', 'Yılmaz', 'Erkek', '2002-01-10', '12. Sınıf'),
       (102, 'Ayşe', 'Kaya', 'Kadın', '2003-03-15', '11. Sınıf'),
       (103, 'Mehmet', 'Demir', 'Erkek', '2002-05-20', '12. Sınıf'),
       (104, 'Zeynep', 'Aksoy', 'Kadın', '2003-07-25', '11. Sınıf'),
       (105, 'Emre', 'Yıldız', 'Erkek', '2002-09-30', '12. Sınıf'),
       (106, 'Selin', 'Arslan', 'Kadın', '2003-11-05', '11. Sınıf'),
       (107, 'Murat', 'Kara', 'Erkek', '2002-12-10', '12. Sınıf');

-- Kitap tablosuna veri ekleme
INSERT INTO kitap (kitapno, isbnno, kitapadi, yazarno, turno, sayfasayisi, puan)
VALUES (201, '9786052980001', 'Kırmızı Pazartesi', 1, 1, 300, 8),
       (202, '9789750723843', 'İstanbul Hatırası', 2, 2, 400, 9),
       (203, '9789753638013', 'Sineklerin Tanrısı', 3, 1, 350, 7),
       (204, '9789750725236', 'Kürk Mantolu Madonna', 4, 2, 250, 8),
       (205, '9789753638044', '1984', 5, 1, 320, 9),
       (206, '9786053753468', 'Beyaz Gemi', 6, 2, 280, 7),
       (207, '9789750738588', 'Dönüşüm', 7, 1, 200, 8);

-- Yazar tablosuna veri ekleme
INSERT INTO yazar (yazarno, yazarad, yazarsoyad)
VALUES (1, 'Ahmet', 'Ümit'),
       (2, 'Orhan', 'Pamuk'),
       (3, 'William', 'Golding'),
       (4, 'Sabahattin', 'Ali'),
       (5, 'George', 'Orwell'),
       (6, 'Peyami', 'Safa'),
       (7, 'Franz', 'Kafka');

-- Tür tablosuna veri ekleme
INSERT INTO tur (turno, turadi)
VALUES (1, 'Roman'),
       (2, 'Matematik'),
       (3, 'Bilim Kurgu'),
       (4, 'Tarih'),
       (5, 'Psikoloji'),
       (6, 'Felsefe'),
       (7, 'Klasik');
