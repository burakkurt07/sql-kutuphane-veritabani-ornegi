CREATE DATABASE KutuphaneDB;

CREATE TABLE islem (
  islemno INT,
  ogrno INT,
  kitapno INT,
  atarih DATE,
  vtarih DATE
);

CREATE TABLE ogrenci (
  ogrno INT,
  ograd VARCHAR(50),
  ogrsoyad VARCHAR(50),
  cinsiyet VARCHAR(10),
  dtarih DATE,
  sinif VARCHAR(20)
);

CREATE TABLE kitap (
  kitapno INT,
  isbnno VARCHAR(20),
  kitapadi VARCHAR(100),
  yazarno INT,
  turno INT,
  sayfasayisi INT,
  puan INT
);

CREATE TABLE yazar (
  yazarno INT,
  yazarad VARCHAR(50),
  yazarsoyad VARCHAR(50)
);

CREATE TABLE tur (
  turno INT,
  turadi VARCHAR(50)
);
