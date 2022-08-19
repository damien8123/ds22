


-----------------------------------------------
-- DS 11/22 EU -- RDB&SQL Session 3 (Part-2) --
----------- 06.06.2022 ------------------------
-----------------------------------------------


-- TRIM -- https://docs.microsoft.com/en-us/sql/t-sql/functions/trim-transact-sql
-- LTRIM -- https://docs.microsoft.com/en-us/sql/t-sql/functions/ltrim-transact-sql
-- RTIM -- https://docs.microsoft.com/en-us/sql/t-sql/functions/rtrim-transact-sql
-- trımler strınde calışır

SELECT TRIM(' CHARACTER'); --character öncesindeki boşluk gider. trım boşluları traşlar.

SELECT ' CHARACTER'; --select komutu ile bazı fonk.doğrudan çalıştırabiliriz.

SELECT TRIM(' CHARACTER ')

SELECT TRIM(      '          CHAR ACTER          ') --tırnak öncesi boşlukların bir önemi yoktur.

-- Trim yapmak istediğimiz birden fazla karakter var ise bunları aşağıdaki gibi belirtebiliriz.
-- Girdiğimiz ifadenin içindeki herhangi bir karakterle karşılaştığında bu karakter silinecektir. Ta ki bu karakterler dışında başka bir karakterle kaşılaşana kadar.
SELECT TRIM('ABC' FROM 'CCCCBBBAAAFRHGKDFKSLDFJKSDFACBBCACABACABCA') ---basta ve sonda abc leri traslar  cvp FRHGKDFKSLDFJKSDF


SELECT	TRIM('X' FROM 'ABCXXDE') -- basta ve sondaki x leri traslar.

SELECT	TRIM('x' FROM 'XXXXXXXXABCXXDEXXXXXXXX') --cvp  ABCXXDE

SELECT LTRIM ('     CHARACTER ')--sadece soldaki ni traslar

SELECT RTRIM ('     CHARACTER ')--sadece sağdakini traslar.


-- REPLACE -- https://docs.microsoft.com/en-us/sql/t-sql/functions/replace-transact-sql
-- STR -- https://docs.microsoft.com/en-us/sql/t-sql/functions/str-transact-sql


SELECT REPLACE('CHA   RACTER     STR   ING', ' ', '/') ---bir ifadenin yerine yeni birsey ya da o ifadeyi kaldırmak için kullanılır.
--cvp           CHA///RACTER/////STR///ING

SELECT REPLACE('CHARACTER STRING', 'CHARACTER STRING', 'CHARACTER')
--CHARACTER


SELECT STR (5454) -- tırnak olmadığından bunu numeric aldı
      5454   --- str hep 10 haneye göre uygular. virgülüde karakter sayar
SELECT STR (2135454654)
2135454654





SELECT STR (133215.654645, 11, 3) --11 karakterlik virgülden sonra 3 basamak olacak sekilde getir. cvp  133215.655
--regex de kullanılablirmiş ama nasıl bi arastır.

SELECT STR(1234567823421341241290123456)
--cvp********** oldu cunku hangi 10 karakteri alcak bilemedi. biz numeric ifadeleri bu sekilde text e ceviririz.default 10 karakter.
SELECT len(STR(1234567823421341241290123456))


-- CAST -- CONVERT -- https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql

--cast ifadeni  veri tipini  değiştirir. numerik text veya text numeric
--convert de aymı cast gibi
--round float olan sayıyı yuvarlar
--isnull iki değer aynıysa null, farklı ise ilkine döndürmeye yarar.?
SELECT CAST (12345 AS CHAR)--numeric veriyi charactere cevirdi direrk .default u yok///girdi as sonuç seklinde yazılır.
--cvp 12345                         
SELECT CAST (123.65 AS INT) --cvp 123 direk int cevirdi.

--text ile numeric birleşecekse hepsini text cevir öyle birleştir.

SELECT CONVERT(int, 30.60) ---sonuç girdi seklinde yazılır.

SELECT CONVERT (VARCHAR(10), '2020-10-10')--tarihi metin olarak alırız.  cvp 2020-10-10

SELECT CONVERT (DATETIME, '2020-10-10' )--cvp 2020-10-10 00:00:00.000

SELECT CONVERT (NVARCHAR, GETDATE(), 112 ) --getdate sonucu al. nvarchar ile text e dönüştür ve gömülü 112 ye göre çıkar. 
--112 nın anlamı acıklaması üstte ki linkte var. cvp 20220622   -convert cast e göre bu durularda daha avantajlı.

SELECT CAST ('20201010' AS DATE)

-- COALESCE -- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql

--ilk dolu olan girdiyi alır.

SELECT COALESCE(NULL, 'Hi', 'Hello', NULL) --cvp Hi


-- NULLIF -- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/nullif-transact-sql
--iki değer esitse null esit değilse ilk dolu değeri getirmeye yarar.

SELECT NULLIF (10,10) --cvp NULL

SELECT NULLIF(10, 11) --cvp 10


-- ROUND -- https://docs.microsoft.com/en-us/sql/t-sql/functions/round-transact-sql
-- Üçüncü parametre sonucun aşağıya mı yukarıya mı yuvarlanacağını belirlemek için kullanılmaktadır.
-- Default olarak 0 (yani yukarıya yuvarlama) atanmıştır. Aşağı değere yuvarlamak için 1 yazılmalıdır.

SELECT ROUND (432.368, 2, 0) --virgülden sonraki iki basamağa göre yuvarla komutudur.cvp 432.370
SELECT ROUND (432.368, 2, 1)-- cvp 432.360
SELECT ROUND (432.368, 2)--cvp 432.370


-- ISNULL -- https://docs.microsoft.com/en-us/sql/t-sql/functions/isnull-transact-sql

SELECT ISNULL(NULL, 'ABC') -- İKİ İFADEDEN ilki boş ise dolu olanı getrir.cvp ABC

SELECT ISNULL('', 'ABC') -- TIRNAK DOLU KABUL ETTİ. O YUZDEN TIRNAĞIN İÇİNDEKİ BOS GELDİ.

-- ISNUMERIC -- https://docs.microsoft.com/en-us/sql/t-sql/functions/isnumeric-transact-sql

--İFADE SAYISAL YANİ NUMERİC İSE 1 DEĞİLSE 0 DÖNDÜRÜR. CALIŞACAĞIN VERİLERİ İNCELERKEN KULLANIRSIN.


select ISNUMERIC(123)
--CVP 1
--CVP 0
