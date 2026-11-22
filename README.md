# MyPortfolio Mobile 
Nama    : Ria Lavenia Kharissa

NPM     : 2506543905

Kelas   : PBP A

---

## Panduan Instalasi & Menjalankan Proyek

1. Clone repositori ini:

```bash
git clone https://github.com/mickiepie/myportfolio_mobile.git
cd myportofolio_mobile
```

2. Unduh seluruh dependensi:

```bash
flutter pub get
```

3. Periksa kebersihan kode (pastikan muncul "No issues found!"):

```bash
flutter analyze
```

4. Jalankan aplikasi (disarankan di Google Chrome):

```bash
flutter run -d chrome
```

Opsional: jalankan `flutter run` biasa jika memakai Android Emulator atau HP fisik.

---

## Log Progres Mingguan

### Minggu 7

**Tugas 7 - Basic Flutter**

- **Target:** Mengubah aplikasi tutorial menjadi portofolio berisi profil asli dan memvariasikan warna tombol menu.
- **Implementasi:** Mengganti data sampel di `InfoCard` dengan data pribadi (NPM, Nama, Kelas PBP), menambahkan atribut `Color` pada kelas model `ItemHomepage`, mendesain 3 tombol menu dengan warna berbeda, dan memastikan `flutter analyze` bersih.
- **Hasil:** Halaman utama menampilkan profil asli dan tiga tombol yang memunculkan SnackBar sesuai nama tombol saat ditekan.

### Minggu 8

**Tugas 8 - Flutter Navigation, Layouts, Forms, and Input Elements**

- **Target:** Menerapkan navigasi, layout, dan formulir untuk membuat halaman formulir baru bagi bagian portofolio (`Experience`).
- **Implementasi:** Membuat halaman formulir ExperienceFormPage di `lib/screens/experience_form.dart`, menerapkan validasi input dan menampilkan ringkasan isian pada `AlertDialog` melalui `showDialog()`, Menambahkan kartu aksi Tambah Pengalaman di `lib/screens/menu.dart` serta opsi Add Experience di `lib/widgets/left_drawer.dart`.
- **Hasil:** Dapat membuka formulir tambah pengalaman dari kartu aksi maupun drawer, melihat pesan kesalahan saat input tidak valid, melihat ringkasan data di `AlertDialog` saat valid, serta kembali ke halaman utama dengan lancar.


---

## Penggunaan AI (AI Disclosure)

### Tugas 7

**Tautan Chatlog AI:**[Gemini](https://share.gemini.google/wGPLToETInRr)


**Tujuan penggunaan:**

- Memahami cara menambahkan atribut `Color` ke model `ItemHomepage`.
- Merangkum konsep teori yang terdapat pada tutorial 8
- Membantu dalam pengerjaan refleksi tugas 7

**Strategi Prompting:** 
- Mengirimkan berkas Tutorial 8 dan berkas Tugas 7 untuk mengetahui apa hal yang harus saya tambahkan untuk memenuhi seluruh *checklist* pada Tugas 7. 
- Mengirim tangkapan layar ketika ingin mengetahui bagaimana cara mengubah warna pada mobile saya. 
- Bertanya teori dasar Flutter untuk memahami dan mengerjakan Tugas 7

**Keterbatasan AI & perbaikan manual:**

- Saat menambahkan parameter dinamis (`item.color`, `item.name`), kode dari AI benar tetapi tidak mengingatkan secara langsung bahwa `const` pada widget induk harus dihapus. Sehingga saya harus menelusuri lagi dan melakukan perbaikan sendiri.



### Tugas 8

**Tautan Chatlog AI:** [Gemini](https://share.gemini.google/2p6R0Q4AU2Xm)

**Tujuan penggunaan:**

- Membandingkan ruang lingkup antara Tutorial 09 dan Tugas 8 untuk menentukan fitur yang perlu ditambahkan (`ExperienceFormPage`).
- Memahami cara memisahkan konfigurasi tema aplikasi ke berkas tersendiri (`lib/theme/app_theme.dart`) agar tampilan antarhalaman seragam.
- Mencari tahu cara mengimplementasikan palet warna dari gambar referensi ke dalam kode Flutter.
- Membantu menyusun jawaban refleksi Tugas 8.

**Strategi Prompting:**

- Mengirimkan berkas PDF Tutorial 09 dan Tugas 8 untuk memetakan perbedaan serta memastikan seluruh *checklist* Tugas 8 terpenuhi.
- Mengirimkan tangkapan layar referensi warna dan tampilan aplikasi saat ini untuk menanyakan cara menerapkan palet warna tersebut ke kode Flutter.

**Keterbatasan AI & perbaikan manual:**

- Saya tidak mengirimkan kode pada AI karena masalah privasi, sehingga saya menyesuaikan kembali palet warna pilihan saya sendiri di `lib/theme/app_theme.dart`, menyamakan seluruh *import* secara manual, dan menghapus warna *hardcoded* di `menu.dart`, `left_drawer.dart`, `project_form.dart`, serta `experience_form.dart` agar warna dan kontras teks navbar sesuai dengan yang saya inginkan.


---

## Refleksi Tugas 7

### 1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!

*Widget tree* adalah struktur hierarki visual di Flutter di mana antarmuka dibangun seperti cabang pohon. Di Flutter, semuanya adalah widget (teks, ikon, tombol, kartu, tata letak). Hubungan parent-child bekerja dengan cara widget induk (misalnya `Column` atau `Container`) mengatur posisi dan batasan ukuran bagi widget anak. Anak menggambar dirinya sesuai ruang yang diizinkan induk.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

- `MaterialApp`: widget utama yang menjadi *root* aplikasi dan membungkus seluruh elemen untuk menerapkan desain material, tema, dan navigasi.
- `Scaffold`: kerangka halaman (`appBar`, `body`,`SnackBar`).
- `AppBar`: Widget untuk menampilkan bar menu di bagian atas aplikasi.
- `Padding`: memberi ruang kosong di sekitar widget.
- `Column`: menyusun anak secara vertikal.
- `Row`: menyusun anak secara horizontal.
- `GridView.count`: menampilkan anak dalam kisi-kisi dengan jumlah kolom tertentu.
- `Center`: menempatkan anak di tengah ruang yang tersedia.
- `Card`: wadah bersudut lengkung dengan efek bayangan.
- `Material`: Menambahkan karakteristik desain Material pada suatu area, digunakan pada latar belakang tombol aksi.
- `InkWell`: membuat widget responsif terhadap sentuhan dengan efek riak (*ripple*).
- `Icon`: menampilkan simbol grafis.
- `Text`: menampilkan teks.
- `SnackBar`: pesan singkat dari bawah layar yang hilang sendiri.
- `SizedBox`: kotak tak terlihat berukuran tertentu, sering dipakai untuk memberi jarak antar-widget.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

`MaterialApp` adalah widget utama yang menjadi *root* aplikasi dan membungkus seluruh elemen untuk menerapkan desain material, tema, dan navigasi. Widget ini ditempatkan sebagai root agar semua widget di bawahnya otomatis bisa mengakses tema dan navigasi yang sama dari satu sumber, tanpa menyetel ulang di tiap halaman.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

- **StatelessWidget:** Tampilannya ditentukan sekali dan tidak berubah sendiri. Dapat digunakan untuk elemen antarmuka yang isinya hanya data tetap dan tidak berubah sepanjang layar ditampilkan, contohnya teks nama atau identitas.
- **StatefulWidget:** Tampilannya dapat diperbarui sesuai interaksi pengguna tanpa pindah halaman. Dapat digunakan untuk halaman atau komponen yang harus merespon interaksi pengguna, misalnya form input, animasi atau angka yang terus berubah.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

`BuildContext` adalah objek yang menyimpan lokasi sebuah widget di dalam widget tree. Widget memerlukannya untuk berinteraksi dengan widget lain, misalnya membaca tema, ukuran layar, atau melakukan navigasi. Di metode `build`, `context` dipakai misalnya pada `ScaffoldMessenger.of(context).showSnackBar(...)`. Dengan `context`, Flutter tahu `Scaffold` mana yang harus menampilkan SnackBar tersebut.

### 6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

- **Hot Reload:** memperbarui kode di layar dalam hitungan milidetik setelah ada perubahan kode tanpa kehilangan state aplikasi yang sedang berjalan. Contohnya mengubah teks atau mengganti warna latar
- **Hot Restart:** menjalankan ulang aplikasi dari `main()` sehingga seluruh state direset.
- **Full Restart:** menghentikan aplikasi secara total dan melakukan proses kompilasi ulang dari awal.
- **Harus melakukan Hot Restart:** saat ingin mereset ulang seluruh state aplikasi kembali ke kondisi awal. Ini dilakukan jika perlu mengubah struktur utama state, mengubah nilai awal sebuah variabel di dalam `StatefulWidget`, mengubah fungsi `main()`, atau mengubah variabel global.
-**Harus melakukan Full Restart:** saat ingin melakukan perubahan yang berada di luar kode Dart itu sendiri. Contohnya saat ingin menambahkan package/library baru di berkas `pubspec.yaml`, menambahkan aset baru atau ketika kamu memodifikasi kode native di dalam folder `android/` atau `ios/`.


### Tugas 8

1. **Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama**
   - `Navigator.push()` menambahkan *route* (halaman) baru ke posisi paling atas pada tumpukan (*stack*) navigasi tanpa menghapus halaman sebelumnya, sehingga pengguna masih bisa kembali ke halaman sebelumnya.
   - `Navigator.pushReplacement()` menggantikan *route* yang sedang aktif di puncak *stack* dengan *route* baru secara langsung tanpa menumpuk riwayat halaman di bawahnya.
   - `Navigator.pop()` Menghapus halaman yang berada paling atas di tumpukan, sehingga tampilan otomatis kembali ke halaman yang ada tepat di bawahnya.
   - Untuk membuka formulir dari kartu aksi (`ItemCard`), metode yang digunakan adalah **`Navigator.push()`** agar pengguna dapat kembali ke halaman utama memakai tombol *Back* bawaan perangkat atau browser. Sementara itu, opsi **Home** di `LeftDrawer` menggunakan **`Navigator.pushReplacement()`** untuk menggantikan halaman formulir yang sedang dibuka dengan `MyHomePage()`, sehingga pengguna langsung kembali ke halaman utama tanpa membuat tumpukan halaman menumpuk saat berpindah lewat *drawer*.

2. **Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**
   - `Scaffold` menyediakan kerangka dasar halaman yang seragam, `AppBar` menjaga konsistensi bilah judul dan tombol menu di bagian atas, serta `LeftDrawer` yang dipakai ulang pada `MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage` memastikan pengguna selalu menemukan menu navigasi yang sama di setiap halaman.
   - Contoh penggunaan warna tema portofolio di lebih dari satu halaman adalah pemusatan tema di `lib/theme/app_theme.dart` (`AppTheme.darkTheme` dan `AppColors`), di mana warna utama `AppColors.pastelYellow` dengan teks gelap `AppColors.textDark` diterapkan secara seragam pada `AppBar` di semua halaman, `DrawerHeader` di `LeftDrawer`, serta tombol `ElevatedButton` di halaman formulir.

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**
   - Formulir disusun menggunakan `Column` di dalam `SingleChildScrollView` karena susunan vertikal dari atas ke bawah paling rapi, mudah dibaca, dan nyaman diisi pada layar ponsel yang sempit.
   - Widget pengatur jarak seperti `Padding` dan `SizedBox` memberi ruang antarelemen agar kolom input tidak saling menempel, mudah ditekan, serta pesan kesalahan validasi di bawah kolom tetap terbaca jelas. Widget penggulir (`SingleChildScrollView`) mencegah *overflow* dan memastikan seluruh input hingga tombol **Simpan** tetap dapat dijangkau dengan digulir ketika ruang layar terbatas atau saat keyboard muncul.

4. **Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**
   - `GlobalKey<FormState>` (`_formKey`) digunakan sebagai kunci untuk mengakses kondisi (`FormState`) dari widget `Form`, misalnya untuk menjalankan validasi atau mengosongkan kembali isi formulir setelah disimpan.
  - `validator` adalah fungsi di setiap kolom input yang bertugas memeriksa isian pengguna. Jika data tidak sesuai aturan, fungsi ini akan mengembalikan pesan kesalahan, tapi jika sudah sesuai, ia mengembalikan `null`.
  - Saat tombol **Simpan** ditekan, `_formKey.currentState!.validate()` akan menjalankan seluruh `validator` yang ada di dalam `Form`. Jika semua kolom lolos pemeriksaan (`true`), barulah `AlertDialog` ringkasan ditampilkan melalui `showDialog()`.
  - Contoh nilai yang ditolak oleh validasi adalah isian yang hanya berisi spasi pada kolom wajib (Nama Pengalaman, Jabatan, Deskripsi), tautan Thumbnail tanpa awalan `http://` atau `https://`, atau tanggal selesai yang lebih awal dibandingkan tanggal mulai. Mengatur jenis input atau tampilan papan ketik (seperti `TextInputType.url`) saja belum cukup karena hal itu hanya mempermudah pengguna saat mengetik, bukan mencegah data kosong, format URL yang keliru, atau urutan tanggal yang tidak sesuai.