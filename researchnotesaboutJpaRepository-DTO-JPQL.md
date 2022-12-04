# JPA Repository
JPA(Java Persistence API) nesnelerin ilişkilendirilmesini sağlayan uygulama sonlandıktan sonra bile verinin kalıcı olmasını sağlayan teknolojidir. JPA sayesinde nesne ilişkileriyle yaptığımız sql komutlarını direkt olarak nesne üzerinde çalıştırabiliriz.JPa bu sorguları içersinde barındırır ve bu sayede veritabanında verileri saklama güncelleme, veri çekme veya map işlemi yapabiliriz.
JPA , uygulama ile veritabanı arasında arabirim noktasını oluşturur.
----------------------------------------------------------------------------
## JPA Repository ile Türetilmiş Sorgu Yöntemleri
  By anahtar sözcüğüyle ayırılmış iki ana bölümü içeren JPA sorgularında ilk kısım 'find' gibi işlevi belirtir 'By' anahtar kelimesinden sonraki kısım ise ölçütü belirtir.
```sh
List<User> findByName(String name)
``
---
  Yinelemeleri kaldırmak için distinct veya sonuç küme sınıflandırmaları için ise first, top anahtar kelimelerini kullanabiliriz.
------
```sh
List<User> findFirstByStock(int stock)
``
```sh
List<User> findTop3ByAge(String name)
``
