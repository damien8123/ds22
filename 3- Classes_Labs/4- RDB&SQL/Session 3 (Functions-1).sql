

/* 
SELECT
FROM
WHERE
ORDER BY
TOP
*/


SELECT *
FROM	product.brand
ORDER BY brand_name -- ASC default olarak artan sýraada 


SELECT *
FROM	product.brand
ORDER BY brand_name DESC --  default olarak aazalan sýrala



SELECT TOP 10 *
FROM	product.brand
ORDER BY brand_id



SELECT TOP 10 *
FROM	product.brand
ORDER BY brand_id DESC


--WHERE


SELECT *
FROM	product.brand
WHERE	brand_name LIKE 'S%'


SELECT  brand_name
FROM	product.brand
WHERE	brand_name LIKE 'S%'



-----

SELECT  *
FROM	product.product
WHERE	model_year BETWEEN 2019 AND 2021


SELECT  TOP 1 *
FROM	product.product
WHERE	model_year BETWEEN 2019 AND 2021
ORDER BY model_year DESC


---

SELECT *
FROM	product.product
WHERE	category_id IN (3,4,5)

--


SELECT *
FROM	product.product
WHERE	category_id = 3 OR category_id = 4 OR category_id = 5


---


SELECT	*
FROM	product.product
WHERE	category_id NOT IN (3,4,5)



SELECT	*
FROM	product.product
WHERE	category_id <> 3 AND category_id != 4 AND category_id <> 5 
---<> ve !=   eþit deðildir anlamýndadýr.

-- 

SELECT	store_id, product_id, quantity
FROM	product.stock
ORDER BY 2,1 -- önce 2. sutun(product id ye göre) sonra 1. sutun (store ýd ) göre sýrala demektir. 



---

/* Session 3 Functions */

--Date Functions


--DROP TABLE t_date_time   --- tablo kayýtlýysA ÇALIÞMA ÖNCESÝ DROP EDERÝZ KÝ YENI TABLO OLUÞTURALIM.

CREATE TABLE t_date_time (
	A_time time,
	A_date date,
	A_smalldatetime smalldatetime,
	A_datetime datetime,
	A_datetime2 datetime2,
	A_datetimeoffset datetimeoffset
	)
	--SÜTUN SAYISI 6 OLAN TABLA YAPTIK.


select * from t_date_time


SELECT GETDATE()  --GETDATE KENDÝ BAÞINA BÝR DEÐER DÖNDÜRÜR. BUNU SELECT ÝLE ÇAÐIRABÝLÝR.
--BÝZ BUNA AÞAÐIDA OLD. GÝBÝ GATE_DATE ÝSMÝNÝ VEREBÝLÝRÝZ.



SELECT GETDATE() as get_date  --sistemin  o anlýk saatini getirir. session da 1.18 deki iki adet tabloya bak
--AYRICA AS GET_DATE DÝYEREKTE TABLOYU ÝSÝMLENDÝRDÝK.


INSERT t_date_time --GATDATE KULLANARAK TABLOYA UYGUN DATE LERÝ ÝNSERT ETTÝK
VALUES ( GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE() )



INSERT t_date_time (A_time, A_date, A_smalldatetime, A_datetime, A_datetime2, A_datetimeoffset)
VALUES 
('12:00:00', '2021-07-17', '2021-07-17','2021-07-17', '2021-07-17', '2021-07-17' )

--YUKARDA SADECE TARÝH GÝRERSEK HER SUTUN KENDÝNE GÖRE TARÝHÝ BELÝRTÝR.
--SAAT DEÐERÝ GÖSTERENE SAAT GÝRÝLMEZSE SAAT KISMINI  000000 LARLA GÖSTERÝLÝR.



----convert date to varchar

--SAAT DEÐERÝ SENÝN FORMATINA UYGUN DEÐÝLSE CONVERT ÝLE FORMAT DEÐÝÞÝKLÝÐÝ YAPABÝLÝYORUZ.

SELECT  GETDATE()

SELECT CONVERT(VARCHAR(10), GETDATE(), 6) --VARCHAR I DÖNÜÞTÜRCEM ,
--GATE DATE VERÝSÝNÝ DÖNÜÞTÜRCEZ.STYLE FORMAT ÝSE 6 YA DÖNÜÞTÜRÜRÜZ. BU STYLE LERÝN LÝSTESÝ VAR SESSÝON 3 - 1.28 DE


--VARCHAR TO DATE


SELECT CONVERT(DATE, '04 Jun 22' , 6) --6 STL ÝNDE 04 JUN 22 TARÝHÝNÝ  DATE HEDEFÝNE DÖNÜÞTÜR.
--DATE YERÝNE DATETÝME DA YAZILABÝLÝRDÝ. yazdýðýn deðer 6 sitilinde date deðeridir diyoruz bu komutla.

SELECT CONVERT(DATETIME, '04 Jun 22' , 6)


---convert ýn farklý kullanýmlarý da var. varchar dan int a cevirme mesela.


----DATE FUNCTIONS

 --session 3 - 1.40 daki tablo 

---Functions for return date or time parts

SELECT A_DATE
		, DAY(A_DATE) DAY_
		, MONTH(A_DATE) [MONTH]
		, DATENAME(DAYOFYEAR, A_DATE) DOY
		, DATEPART(WEEKDAY, A_date) WKD
		, DATENAME(MONTH, A_DATE) MON
FROM t_date_time
--ör; t_date_time tablosunda a_date sutunundan DAY  al ve day_ altýna yaz.komutudur.
--reserve wordden kurtarmak için kelimeyi köþeli parantezede alabilirsin.
-- alter table kullanarak bunlarýn yanýna kolon ekleyebiliriz.

---

SELECT DATEDIFF(DAY, '2022-05-10', GETDATE()) --2022-05-10 dan suana gecen gün deðerini aldýk. ýnt döndürür
--datedýff ile iki zaman arasýndaki farký alabiliriz. ses3 1.52
-


SELECT DATEDIFF(SECOND, '2022-05-10', GETDATE())


---

--Teslimat tarihi ile kargolama/teslimat tarihi arasýndaki gün farký 2 den büyük olanlar bulunuz.

SELECT	*, DATEDIFF(DAY, order_date, shipped_date) Diff_of_day
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2

--DATEDIFF(DAY, order_date, shipped_date) Diff_of_day  kýsmý yazýlmazsa tabloda göremezsin
--ayrý bir sutunda ancak sartýný saðlayan veriler gelir yinede

SELECT	*
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2

--çalýþma sýrasý from where select seklindedir.


---

SELECT DATEADD(DAY, 5, GETDATE()) --getdate nin gününe 5 ekle

SELECT DATEADD(MINUTE, 5, GETDATE())



SELECT EOMONTH(GETDATE()) --,içinde bulunan ayýn son günü

SELECT EOMONTH(GETDATE(), 2)--i çinde bulunan aydan 2 ay sonraki ayýn son günü



--ýsdate fonksiyonunu incele--gün mü deðil mi inceler olumlu 1 olumsuz durum varsa 0 deðerini alýr.


--LEN, CHARINDEX, PATINDEX

SELECT LEN ('CHARACTER')-- uz 9


SELECT LEN ('CHARACTER ')--uz 9

SELECT LEN (' CHARACTER ')--uz 10
--karakter uzunluðunu verir. baþtaki boþluðu sayar ancak sondakini saymaz
----

SELECT CHARINDEX('R', 'CHARACTER') --r nin kacýncý karakter olduðuna bakarýz.
--cevap 4

SELECT CHARINDEX('R', 'CHARACTER', 5)--5. karakteri de sayma ancak 5 i birinci olarak gör ve r kacýncý karakter onu bul.
--cevap 9- burda 9 karakter olduðundan oyle dedi hoca

SELECT CHARINDEX('RA', 'CHARACTER')
--cevap 4-- indeksleme 1 den baslar.

SELECT CHARINDEX('R', 'CHARACTER', 5) - 1
--cev 8 çünkü 9-1=8 // 2. r den bir öncekinin indeksini bulabiliriz.

--R ile biten stringler

SELECT PATINDEX('%r', 'CHARACTER')--patern ararýz ör neðin sonu r olan, cvp 9  , ilk r yi almadý
--% ile r den once sonunda bilmediðin kadar karakter var.büyük*küçük harf duyarlý lýðý yok

SELECT PATINDEX('%R', 'CHARACTER')

SELECT PATINDEX('%H%', 'CHARACTER')--cvp 2


SELECT PATINDEX('%A%', 'CHARACTER') --cvp 3   ilk a  geldi 

SELECT PATINDEX('__A______', 'CHARACTER')--cvp 1

SELECT PATINDEX('__A%', 'CHARACTER')--cvp 1

SELECT PATINDEX('____A%', 'CHARACTER') -- cvp 1

SELECT PATINDEX('%A____', 'CHARACTER')--cvp 5

--PATINDEKS MANTIÐI ANLAÞILMADI
----

--LEFT, RIGHT, SUBSTRING, string içinden parça almamýzý saðlar.

SELECT LEFT('CHARACTER', 3)--cvp cha

SELECT RIGHT('CHARACTER', 3)--cvp ter

SELECT SUBSTRING('CHARACTER', 3, 5)--cvp   aract   -3 . karakterden basla 5 karaakter al


SELECT SUBSTRING('CHARACTER', 4, 9)--cvp racter   - 

SELECT SUBSTRING('CHARACTER', 4, 20)--cvp racter  
---

--LOWER, UPPER, STRING_SPLIT

SELECT LOWER('CHARACTER')--cvp  


SELECT UPPER('character')--cvp  



SELECT value as name
FROM STRING_SPLIT('jack,martin,alain,owen', ',') 



----


---'character' kelimesinin ilk harfini büyülten bir script yazýnýz.


SELECT UPPER ('character')


SELECT UPPER (LEFT('character', 1))


SELECT SUBSTRING('character', 2, 9)

select LEN('character')


SELECT LOWER (SUBSTRING('character', 2, LEN('character')))


--SONUÇ
SELECT UPPER (LEFT('character', 1)) + LOWER (SUBSTRING('character', 2, LEN('character')))


SELECT CONCAT (UPPER(LEFT('character', 1)) , LOWER (SUBSTRING('character', 2, LEN('character'))))







