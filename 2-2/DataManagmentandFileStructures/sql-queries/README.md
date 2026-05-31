# Hastane Yönetim Sistemi - SQL Dosyaları

SQL ödevi için hazırlanan tüm sorgu dosyaları.

## Dosyalar

| Dosya | Açıklama |
|-------|----------|
| **00_all_in_one.sql** | Tüm kurulumu tek seferde yapan dosya |
| **01_schema.sql** | Tablo yapısı (CREATE TABLE) |
| **02_data.sql** | 30+ örnek veri kaydı (INSERT) |
| **03_queries.sql** | 10 adet SQL sorgusu (SELECT) |
| **04_indexing.sql** | Tablo değişiklikleri ve indexler (ALTER) |

## Kurulum

### Seçenek 1: Hepsi birden
```bash
mysql -u root -p < 00_all_in_one.sql
```

### Seçenek 2: Adım adım
```bash
mysql -u root -p < 01_schema.sql
mysql -u root -p < 02_data.sql
mysql -u root -p < 03_queries.sql
mysql -u root -p < 04_indexing.sql
```

## Veritabanı Yapısı

**12 Tablo:**
- Hospital (Hastane şubeleri)
- User (Kullanıcılar: doktor, hasta, admin, güvenlik)
- Department (Departmanlar: Kardiyoloji, Nöroloji, vb.)
- Doctor (Doktor bilgileri)
- Patient (Hasta bilgileri)
- Insurance (Sigorta poliçeleri)
- Appointment (Randevular)
- Prescription (İlaç reçeteleri)
- LabResult (Laboratuvar sonuçları)
- Billing (Faturalar)
- MedicalDevice (Tıbbi cihazlar)
- SecurityEvent (Güvenlik olayları)

**İlişkiler:**
- Hastane → Departman (1:N)
- Doktor → Randevu (1:N)
- Hasta → Randevu (1:N)
- Randevu → Reçete (1:N)
- Hasta → Fatura (1:N)
- Hasta → Sigorta (N:1)

## Örnek Veriler

- 3 hastane
- 15 kullanıcı (5 doktor, 7 hasta, 2 admin, 1 güvenlik)
- 8 departman
- 10 sigorta şirketi
- 15 randevu
- 15 reçete
- 11 laboratuvar sonucu
- 10 fatura
- 6 tıbbi cihaz
- 5 güvenlik olayı

## SQL Sorguları

10 örnek sorgu:
1. Randevusu çok olan doktorlar
2. Randevusu olmayan hastalar
3. Departmana göre en yaygın teşhisler
4. Ödenmemiş faturalar
5. İlaç ve lab sonucu olan randevular
6. Departmana göre ortalama randevu
7. Güvenlik olayları
8. Hasta ve sigorta bilgileri
9. Yüksek riskli tıbbi cihazlar
10. İlaç analizi

---

**Veritabanı:** MySQL 8.0+
**Karakter Seti:** UTF-8
