

/* 
SELECT
FROM
WHERE
ORDER BY
TOP
*/


SELECT *
FROM	product.brand
ORDER BY brand_name -- ASC default olarak artan s�raada 


SELECT *
FROM	product.brand
ORDER BY brand_name DESC --  default olarak aazalan s�rala



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
---<> ve !=   e�it de�ildir anlam�ndad�r.

-- 

SELECT	store_id, product_id, quantity
FROM	product.stock
ORDER BY 2,1 -- �nce 2. sutun(product id ye g�re) sonra 1. sutun (store �d ) g�re s�rala demektir. 



---

/* Session 3 Functions */

--Date Functions


--DROP TABLE t_date_time   --- tablo kay�tl�ysA �ALI�MA �NCES� DROP EDER�Z K� YENI TABLO OLU�TURALIM.

CREATE TABLE t_date_time (
	A_time time,
	A_date date,
	A_smalldatetime smalldatetime,
	A_datetime datetime,
	A_datetime2 datetime2,
	A_datetimeoffset datetimeoffset
	)
	--S�TUN SAYISI 6 OLAN TABLA YAPTIK.


select * from t_date_time


SELECT GETDATE()  --GETDATE KEND� BA�INA B�R DE�ER D�ND�R�R. BUNU SELECT �LE �A�IRAB�L�R.
--B�Z BUNA A�A�IDA OLD. G�B� GATE_DATE �SM�N� VEREB�L�R�Z.



SELECT GETDATE() as get_date  --sistemin  o anl�k saatini getirir. session da 1.18 deki iki adet tabloya bak
--AYRICA AS GET_DATE D�YEREKTE TABLOYU �S�MLEND�RD�K.


INSERT t_date_time --GATDATE KULLANARAK TABLOYA UYGUN DATE LER� �NSERT ETT�K
VALUES ( GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE() )



INSERT t_date_time (A_time, A_date, A_smalldatetime, A_datetime, A_datetime2, A_datetimeoffset)
VALUES 
('12:00:00', '2021-07-17', '2021-07-17','2021-07-17', '2021-07-17', '2021-07-17' )

--YUKARDA SADECE TAR�H G�RERSEK HER SUTUN KEND�NE G�RE TAR�H� BEL�RT�R.
--SAAT DE�ER� G�STERENE SAAT G�R�LMEZSE SAAT KISMINI  000000 LARLA G�STER�L�R.



----convert date to varchar

--SAAT DE�ER� SEN�N FORMATINA UYGUN DE��LSE CONVERT �LE FORMAT DE����KL��� YAPAB�L�YORUZ.

SELECT  GETDATE()

SELECT CONVERT(VARCHAR(10), GETDATE(), 6) --VARCHAR I D�N��T�RCEM ,
--GATE DATE VER�S�N� D�N��T�RCEZ.STYLE FORMAT �SE 6 YA D�N��T�R�R�Z. BU STYLE LER�N L�STES� VAR SESS�ON 3 - 1.28 DE


--VARCHAR TO DATE


SELECT CONVERT(DATE, '04 Jun 22' , 6) --6 STL �NDE 04 JUN 22 TAR�H�N�  DATE HEDEF�NE D�N��T�R.
--DATE YER�NE DATET�ME DA YAZILAB�L�RD�. yazd���n de�er 6 sitilinde date de�eridir diyoruz bu komutla.

SELECT CONVERT(DATETIME, '04 Jun 22' , 6)


---convert �n farkl� kullan�mlar� da var. varchar dan int a cevirme mesela.


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
--�r; t_date_time tablosunda a_date sutunundan DAY  al ve day_ alt�na yaz.komutudur.
--reserve wordden kurtarmak i�in kelimeyi k��eli parantezede alabilirsin.
-- alter table kullanarak bunlar�n yan�na kolon ekleyebiliriz.

---

SELECT DATEDIFF(DAY, '2022-05-10', GETDATE()) --2022-05-10 dan suana gecen g�n de�erini ald�k. �nt d�nd�r�r
--dated�ff ile iki zaman aras�ndaki fark� alabiliriz. ses3 1.52
-


SELECT DATEDIFF(SECOND, '2022-05-10', GETDATE())


---

--Teslimat tarihi ile kargolama/teslimat tarihi aras�ndaki g�n fark� 2 den b�y�k olanlar bulunuz.

SELECT	*, DATEDIFF(DAY, order_date, shipped_date) Diff_of_day
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2

--DATEDIFF(DAY, order_date, shipped_date) Diff_of_day  k�sm� yaz�lmazsa tabloda g�remezsin
--ayr� bir sutunda ancak sart�n� sa�layan veriler gelir yinede

SELECT	*
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2

--�al��ma s�ras� from where select seklindedir.


---

SELECT DATEADD(DAY, 5, GETDATE()) --getdate nin g�n�ne 5 ekle

SELECT DATEADD(MINUTE, 5, GETDATE())



SELECT EOMONTH(GETDATE()) --,i�inde bulunan ay�n son g�n�

SELECT EOMONTH(GETDATE(), 2)--i �inde bulunan aydan 2 ay sonraki ay�n son g�n�



--�sdate fonksiyonunu incele--g�n m� de�il mi inceler olumlu 1 olumsuz durum varsa 0 de�erini al�r.


--LEN, CHARINDEX, PATINDEX

SELECT LEN ('CHARACTER')-- uz 9


SELECT LEN ('CHARACTER ')--uz 9

SELECT LEN (' CHARACTER ')--uz 10
--karakter uzunlu�unu verir. ba�taki bo�lu�u sayar ancak sondakini saymaz
----

SELECT CHARINDEX('R', 'CHARACTER') --r nin kac�nc� karakter oldu�una bakar�z.
--cevap 4

SELECT CHARINDEX('R', 'CHARACTER', 5)--5. karakteri de sayma ancak 5 i birinci olarak g�r ve r kac�nc� karakter onu bul.
--cevap 9- burda 9 karakter oldu�undan oyle dedi hoca

SELECT CHARINDEX('RA', 'CHARACTER')
--cevap 4-- indeksleme 1 den baslar.

SELECT CHARINDEX('R', 'CHARACTER', 5) - 1
--cev 8 ��nk� 9-1=8 // 2. r den bir �ncekinin indeksini bulabiliriz.

--R ile biten stringler

SELECT PATINDEX('%r', 'CHARACTER')--patern arar�z �r ne�in sonu r olan, cvp 9  , ilk r yi almad�
--% ile r den once sonunda bilmedi�in kadar karakter var.b�y�k*k���k harf duyarl� l��� yok

SELECT PATINDEX('%R', 'CHARACTER')

SELECT PATINDEX('%H%', 'CHARACTER')--cvp 2


SELECT PATINDEX('%A%', 'CHARACTER') --cvp 3   ilk a  geldi 

SELECT PATINDEX('__A______', 'CHARACTER')--cvp 1

SELECT PATINDEX('__A%', 'CHARACTER')--cvp 1

SELECT PATINDEX('____A%', 'CHARACTER') -- cvp 1

SELECT PATINDEX('%A____', 'CHARACTER')--cvp 5

--PATINDEKS MANTI�I ANLA�ILMADI
----

--LEFT, RIGHT, SUBSTRING, string i�inden par�a almam�z� sa�lar.

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


---'character' kelimesinin ilk harfini b�y�lten bir script yaz�n�z.


SELECT UPPER ('character')


SELECT UPPER (LEFT('character', 1))


SELECT SUBSTRING('character', 2, 9)

select LEN('character')


SELECT LOWER (SUBSTRING('character', 2, LEN('character')))


--SONU�
SELECT UPPER (LEFT('character', 1)) + LOWER (SUBSTRING('character', 2, LEN('character')))


SELECT CONCAT (UPPER(LEFT('character', 1)) , LOWER (SUBSTRING('character', 2, LEN('character'))))







