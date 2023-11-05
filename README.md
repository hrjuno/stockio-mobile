Nama           : Harjuno Abdullah

Kelas          : PBP C

Link Aplikasi  : -

---
# Tugas 7
<details>
<summary>1) Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</summary>

Dalam pengembangan aplikasi Flutter, terdapat perbedaan utama antara stateless widget dan stateful widget, terutama dalam hal bagaimana mereka mengelola dan merender data. Berikut adalah perbedaan utama antara keduanya:

1. **Stateless Widget**

    * Tidak memiliki keadaan (state) yang dapat berubah. Widget ini tidak dapat berubah setelah dibuat
   
    * Cocok untuk elemen UI yang tidak memerlukan perubahan berdasarkan input atau peristiwa tertentu
   
    * Stateless widget lebih efisien dalam hal kinerja dibandingkan dengan stateful widget karena tidak perlu mengelola perubahan keadaan

   Contoh penggunaan stateless widget adalah ikon, teks, gambar, tombol, dan elemen UI statis lainnya

2. **Stateful Widget**

    * Memiliki keadaan yang dapat berubah. Widget ini dapat memperbarui tampilannya ketika keadaannya berubah

    * Cocok untuk elemen UI yang perlu merespons perubahan data, input pengguna, atau peristiwa tertentu

    * Stateful widget menggunakan obyek yang disebut "State" untuk menyimpan dan mengelola keadaan. State ini dikelola secara terpisah dan dapat diperbarui selama siklus hidup widget

   Contoh penggunaan stateful widget adalah daftar scrollable, formulir input, aplikasi dengan halaman/tab yang dapat diubah, dan komponen yang memerlukan pembaruan berdasarkan data dinamis

Dalam pengembangan aplikasi Flutter, seringkali Anda akan menggunakan kombinasi kedua jenis widget ini untuk membangun antarmuka pengguna yang dinamis. Stateless widget digunakan untuk bagian-bagian tampilan yang tidak berubah, sementara stateful widget digunakan untuk bagian-bagian yang memerlukan pembaruan saat keadaan berubah. Ini memungkinkan Anda untuk mengoptimalkan kinerja dan membangun antarmuka yang responsif

</details>

<details>
<summary>2) Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing</summary>

 Widget yang digunakan untuk menyelesaikan tugas ini adalah sebagai berikut:
    - `MyHomePage (StatelessWidget)` : Widget utama yang mewakili halaman beranda aplikasi. Ini mengatur tampilan utama aplikasi dan termasuk dalam Scaffold.
    - `Scaffold`: Widget yang igunakan untuk membuat layout dasar aplikasi.
    - `AppBar` : Widget yang digunakan untuk mengelola navigasi dan tindakan.
    - `Column`: Widget yang digunakan untuk menempatkan child dalam satu kolom.
    - `Container`: Widget yang digunakan untuk menyimpan dan mengelola widget lain.
    -  `Material` : Widget yang digunakan sebagai wadah untuk setiap kartu dan memberikan warna latar belakang sesuai dengan jenis item yang ditentukan.
    - `InkWell` : Widget yang memberikan respons terhadap sentuhan, sehingga pengguna dapat menekan kartu. Saat ditekan, SnackBar akan muncul.
    - `Text`: Widget yang digunakan untuk menampilkan teks di aplikasi.
    - `SnackBar`: Muncul ketika salah satu kartu ditekan dan memberikan umpan balik kepada pengguna.
    - `Icon`: Widget yang digunakan untuk menampilkan ikon dari berbagai ikon yang sudah disediakan oleh Flutter.

</details>

<details>
<summary>3) Cara mengimplementasikan checklist tugas secara step-by-step</summary>

- [x] Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

    Buka terminal di direktori yang diinginkan lalu memasukkan command:
    ```
    flutter create  stockio
    cd stockio
    ```
    lalu untuk menjalankan proyek gunakan command:
    ```
    flutter run
    ```

- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:

  Tambahkan kode ini pada `menu.dart` didalam class `MyHomePage`:
  ```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STOCKIO',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'MENU', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ```

  Lalu tambahkan kode untuk class `ShopItem` dan `ShopCard`:

  ```
    class ShopItem {
    final String name;
    final IconData icon;
    final Color color;

    ShopItem(this.name, this.icon, this.color);
    }

    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
      }
    }
  ```

    - [x] Melihat daftar item (Lihat Item)

      Tambahkan kode ini pada `menu.dart` didalam class `MyHomePage`:
      ```
      ...
      final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.orangeAccent),
        ...
      ];
      ...
      ```

    - [x] Menambah item (Tambah Item)

      Tambahkan kode ini pada `menu.dart` didalam class `MyHomePage`:
      ```
      ...
      final List<ShopItem> items = [
        ...
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.orange),
        ...
      ];
      ...
      ```

    - [x] Logout (Logout)
      Tambahkan kode ini pada `menu.dart` didalam class `MyHomePage`:
      ```
      ...
      final List<ShopItem> items = [
        ...
        ShopItem("Logout", Icons.logout, Colors.deepOrangeAccent),
        ...
      ];
      ...
      ```

- [x] Memunculkan Snackbar dengan tulisan:

  Tambahkan kode didalam class `ShopCard`:
  ```
          ...
          // Area responsive terhadap sentuhan
          onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}")));
          },
          ...
  ```

    - [x] "Kamu telah menekan tombol "Lihat Item" ketika tombol Lihat Item ditekan.

      Pastikan kode ini ada di `menu.dart` didalam class `MyHomePage`:
      ```
      ...
      final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.orangeAccent),
        ...
      ];
      ...
      ```

    - [x] "Kamu telah menekan tombol "Tambah Item" ketika tombol Tambah Item ditekan.

      Pastikan kode ini ada di `menu.dart` didalam class `MyHomePage`:
      ```
      ...
      final List<ShopItem> items = [
        ...
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.orange),
        ...
      ];
      ...
      ```

    - [x] "Kamu telah menekan tombol "Logout" ketika tombol Logout ditekan.

      Pastikan kode ini ada di `menu.dart` didalam class `MyHomePage`:
      ```
      ...
      final List<ShopItem> items = [
        ...
        ShopItem("Logout", Icons.logout, Colors.deepOrangeAccent),
        ...
      ];
      ...
      ```

</details>

Referensi:
- https://pbp-fasilkom-ui.github.io/ganjil-2024/docs/tutorial-6