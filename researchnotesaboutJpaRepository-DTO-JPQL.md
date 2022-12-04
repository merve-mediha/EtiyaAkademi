# ✨ JPA Repository
JPA(Java Persistence API) nesnelerin ilişkilendirilmesini sağlayan uygulama sonlandıktan sonra bile verinin kalıcı olmasını sağlayan teknolojidir. JPA sayesinde nesne ilişkileriyle yaptığımız sql komutlarını direkt olarak nesne üzerinde çalıştırabiliriz.JPa bu sorguları içersinde barındırır ve bu sayede veritabanında verileri saklama güncelleme, veri çekme veya map işlemi yapabiliriz.
JPA , uygulama ile veritabanı arasında arabirim noktasını oluşturur.
-------------------------------------------------------------------------------------------------------
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

----------------------
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

--------------------------------------------
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
------------------------------------------------------------------------------------------
-----------------------------------
# ✨ DTO(Data Transfer Object)
Veri akatarım nesneleri adından anlaşılacağı gibi katmanlar, birimler arasında sadece veri aktarımı için kullanılırlar.Depolama dışında herhangi bir yükümlülükleri yoktur. Setter/getter kullanmına gerek yoktur. Tüm veriler public olarak tutulabilir.
DTO da asıl amaç katmanları arasındaki yapılabilecek call yani çağrım sayılarını azaltmaktır. Bir katmanda elimizde var olan data diğer katmanda kullanılacak ise, veriyi tasımak diğer katmanda yeniden çağrım yapmamak için anlamlı bir çözümdür. Ve Dto'lar nerdeyse hiç davranış içermezler. Veriyi olduğu gibi ileten Dumb objelerdir.
DTO kullanım amacına örnek olarak bazen verilerimizi veritabanında sakladığımız gibi göstermek istemeyebiliriz. Mesela veritabanında bir müşterinin adını ve soyadını farklı alanlarda tutup, UI’da birleşik göstermek için DTO sınıfları oluştururuz yada bir tablonun CRUD işlemleri için farklı DTO’lar oluşturabiliriz.

-------------------------------------
------------------------------------------
-----------------------------------

# ✨ JPQL(Java Persistence Query Language) 
JPA standardının Entity nesnelerini sorgulamak üzerine tanımladığı bir dildir. JPQL, HQL (Hibernate Query Language) ‘e fazlasıyla benzeşir. Bu diller SQL (Structured Query Language) diline hemen hemen benzemelerine karşın, kullandığı argümanlar veritabanı tabloları yerine Entity nesneleridir.

Bir durumu yerine getimek için bazen özel bir soruya ihtiyaç duyabiliriz. Bu durumlarda sorgular repository içinde @Query anotasyonun açıklaması içine yazılır.@Query anotasyonu JPQL'i kullanır.
```sh
@Query("SELECT u FROM User u WHERE u.status = 1")
Collection<User> findAllActiveUsers();
```
Sorguyu yerel SQL sorgusu şeklinde çalıştırmak için sorgunun yanına nativeQuery=true özelliğini ekleriz.Böylelikle sorgular SQL'de nasıl kullanıyorsak öyle yazılabilir.
```sh
@Query(value = "SELECT * FROM Employee ORDER BY name", nativeQuery = true)
 public List<Employee> findAllSortedByNameUsingNative();
   ```
   -------
 Pagination yani sayfalandırma yöntemini kullanmak için Page jeneriği ile nesnemizi alarak method oluştururuz. Sayfa bilsi için ise PageRequest parametresi yazabiliriz.
```sh 
 @Query(value = "SELECT u FROM User u ORDER BY id")
Page<User> findAllUsersWithPagination(Pageable pageable);
```
Native query için sayfalama;
```sh 
@Query(
  value = "SELECT * FROM Users ORDER BY id", 
  countQuery = "SELECT count(*) FROM Users", 
  nativeQuery = true)
Page<User> findAllUsersWithPagination(Pageable pageable);
```
-----------------------------------------------------------
JPQL Query ile aranan parametrenin method parametresi ile eşleşmedi için @Param anotasyonu eklemeliyiz. Ama yöntem parametresi ile ':' ile yazılan sorgu parametresinin aynı olmasına özen göstermeliyiz.
```sh 
@Query("SELECT u FROM User u WHERE u.status = :status and u.name = :name")
User findUserByStatusAndNameNamedParams(
  @Param("status") Integer status, 
  @Param("name") String userName);
  ```
 Native query ile;
 ```sh
@Query("SELECT u FROM User u WHERE u.status = :status and u.name = :name")
User findUserByUserStatusAndUserName(@Param("status") Integer userStatus, 
  @Param("name") String userName);
```
------------------------------------------------------------------
---------------------------------------------------------------------
```sh
SELECT u FROM User u WHERE u.name IN :names
```
yukarıdaki sorguyu liste olarak aramak için koleksiyon jeneriğinden yararlanabiliriz.
```sh
@Query(value = "SELECT u FROM User u WHERE u.name IN :names")
List<User> findUserByNameList(@Param("names") Collection<String> names);
```
--------------------------------------------------------------
-------------------------------------------------------------
verileri değiştirmek, güncellemek için ise  @Modifying anotasyonu kullanırız. Ayrıca sorguda select yerine de update kullanmalıyız.
```sh
@Modifying
@Query("update User u set u.status = :status where u.name = :name")
int updateUserSetStatusForName(@Param("status") Integer status, 
  @Param("name") String name);
```
Dönen değer ile kaç satırın güncellendiğini anlarız. 
Veri ekleme işlemi için de hem @Modifying anotasyonu olmalı hem de sql deki gibi isnert into ile başlayan sorgumuz yazılmalıdır.
```sh
@Modifying
@Query(
  value = 
    "insert into Users (name, age, email, status) values (:name, :age, :email, :status)",
  nativeQuery = true)
void insertUser(@Param("name") String name, @Param("age") Integer age, 
  @Param("status") Integer status, @Param("email") String email);
  ```
