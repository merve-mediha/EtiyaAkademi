# JPA Repository
JPA(Java Persistence API) nesnelerin ilişkilendirilmesini sağlayan uygulama sonlandıktan sonra bile verinin kalıcı olmasını sağlayan teknolojidir. JPA sayesinde nesne ilişkileriyle yaptığımız sql komutlarını direkt olarak nesne üzerinde çalıştırabiliriz.JPa bu sorguları içersinde barındırır ve bu sayede veritabanında verileri saklama güncelleme, veri çekme veya map işlemi yapabiliriz.
JPA , uygulama ile veritabanı arasında arabirim noktasını oluşturur.
----------------------------------------------------------------------------
## JPA Repository ile Türetilmiş Sorgu Yöntemleri
  By anahtar sözcüğüyle ayırılmış iki ana bölümü içeren JPA sorgularında ilk kısım 'find' gibi işlevi belirtir 'By' anahtar kelimesinden sonraki kısım ise ölçütü belirtir. Ölçüt bölümü ise veriye özelliğinde olan koşul ifadesini içerir.
```sh
List<User> findByName(String name)
```
Verdiğimiz isim dışındakileri aramaz için ise 
```sh
List<User> findByNameIsNot(String name);
```
sorgulara is koşulundan sonra null veya nutnull ekleyerek ise o özelliği olmayan verileri de getirebiliriz.
------
Yinelemeleri kaldırmak için distinct veya sonuç küme sınıflandırmaları için ise first, top anahtar kelimelerini kullanabiliriz.

```sh
List<User> findFirstByStock(int stock)
```
```sh
List<User> findTop3ByAge(String name)
```
----------
Boolean değerleri için True ve False ölçütleri ile sorgularımızı yazabiliriz.
```sh
List<User> findByActiveTrue();
List<User> findByActiveFalse();
```
-----
SQL sorgularında  WHERE.. LIKE 'value%' gibi sorgular için StartingWith, '%value' için EndingWith ve '%value%' Containing kelimelerini findBy koşulumuzun sonuna ekleyebiliriz.
Ya da bunun yerine Like koşulunu kullanmak istersek JPA repository içine;
```sh
List<User> findByNameLike(String likePattern);
```
 ve metodu çağırırken ;
 ```sh
  String likePattern = "a%b%c";
userRepository.findByNameLike(likePattern);
```
kodlarını ekleyebiliriz.
----------------------------------------
Karşılaştırmalar için <, <=, >, => operatörleri yerine LessThan, LessThanEqual, GreaterThan, GreaterThanEqual anahtar kelimeleri kullanılabilir.
```sh
List<User> findByAgeLessThanEqual(Integer age);
List<User> findByAgeGreaterThan(Integer age);
```
İki değer arası koşul arıyorsak Between kullanabiliriz. Ya da tam değer için In ifadesini kullanırız.
```sh
List<User> findByAgeBetween(Integer startAge, Integer endAge);
 List<User> findByAgeIn(Collection<Integer> ages);
 ```
 Tarih cinsinden koşullarımız için Before ve After kullanabiliriz.
 ```sh
 List<User> findByBirthDateAfter(ZonedDateTime birthDate);
List<User> findByBirthDateBefore(ZonedDateTime birthDate);
```
-------------------------------------------
Ayrıca birden fazla özellik için koşul arıyorsak And ve Or anahtar kelimesi kullanabiliriz.
İkisi aynı sorguda kullanılıyorsa öncelik sırası and sonra or şeklinde çalışır.
```sh
List<User> findByNameOrBirthDate(String name, ZonedDateTime birthDate);
List<User> findByNameOrBirthDateAndActive(String name, ZonedDateTime birthDate, Boolean active);
```
------------------------------------
Sıralamalar için OrderBy ifadesinden yararlanırız.Varsayılan seçenek artan düzendir, yani Asc. Bunun tersi için ifadenin sonuna Desc ekleyebiliriz. 
```sh
List<User> findByNameOrderByNameAsc(String name);
  List<User> findByNameOrderByNameDesc(String name);
```
------------------------------------------------------------------------------------------
-----------------------------------
