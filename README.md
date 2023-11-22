Nama           : Harjuno Abdullah

Kelas          : PBP C

Link Aplikasi  : -

---
# Tugas 9
<details>
<summary>1) Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</summary>

Pengambilan data JSON sendiri tidak memerlukan pembuatan model terlebih dahulu. JSON (JavaScript Object Notation) adalah format data ringan yang digunakan untuk pertukaran data antar aplikasi. Jadi, Anda dapat mengambil data JSON langsung tanpa membangun model khusus.

Namun, apakah Anda memerlukan pembuatan model tergantung pada tujuan pengambilan data tersebut. Jika Anda hanya ingin membaca atau mengambil data dari file JSON atau endpoint API, Anda tidak perlu membuat model. Anda dapat menggunakan bahasa pemrograman atau alat yang mendukung manipulasi data JSON, seperti Python dengan library json atau JavaScript dengan JSON.parse().

</details>

<details>
<summary>2) Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter</summary>

CookieRequest adalah kelas yang digunakan untuk mengirim permintaan HTTP dengan cookie. Ketika permintaan HTTP dikirim, cookie dapat disertakan dalam permintaan tersebut. Ini memungkinkan server untuk mengidentifikasi pengguna yang terautentikasi dan menyimpan informasi tentang sesi pengguna.

Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter karena ini memungkinkan setiap komponen untuk mengakses cookie yang sama. Dengan cara ini, setiap komponen dapat mengakses informasi yang sama tentang pengguna yang terautentikasi dan sesi pengguna. Ini sangat penting dalam aplikasi yang memerlukan otentikasi pengguna, seperti aplikasi perbankan atau aplikasi media sosial.

</details>

<details>
<summary>3) Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter</summary>

Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter melibatkan beberapa langkah. Berikut adalah dua pendekatan yang umum digunakan:

1. **Menggunakan Backendless SDK (Server-Side):** 

    Backendless adalah platform backend as a service yang menyediakan layanan untuk mengelola data dan otentikasi pengguna. Dalam hal ini, menggunakan Backendless SDK for Flutter. Untuk mengambil data, kita menggunakan API pengambilan data Backendless.

2. **Menggunakan HTTP Package (Client-Side):** 

    HTTP Package adalah package yang menyediakan API untuk mengirim permintaan HTTP. Dalam hal ini, menggunakan package http. Untuk mengambil data, kita menggunakan API pengambilan data package http. Setelah data diterima, kita dapat mengubahnya menjadi objek Dart menggunakan package convert.

</details>

<details>
<summary>4) Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter</summary>

Proses autentikasi antara aplikasi Flutter dan backend Django melibatkan beberapa langkah kunci untuk memastikan keamanan dan kesinambungan data.

1. **Input Data**:
   
    Pengguna memasukkan data akun (seperti username dan password) di aplikasi Flutter.

2. **Kirim ke Django**:
  
    Flutter mengirimkan data akun tersebut ke backend Django menggunakan HTTP request (biasanya `POST`).

3. **Proses di Django**:
  
    Backend Django menerima data tersebut dan melakukan proses autentikasi. Ini melibatkan pengecekan ke database untuk mencocokkan data pengguna.

4. **Respons ke Flutter**:
  
    Setelah memproses data, Django mengirimkan respons ke aplikasi Flutter. Respons ini bisa berupa konfirmasi keberhasilan atau gagalnya proses autentikasi.

5. **Tampilan di Flutter**:
    
    Berdasarkan respons dari Django, Flutter kemudian menampilkan hasil autentikasi. Jika berhasil, aplikasi mungkin akan membuka halaman menu utama atau dashboard. Jika gagal, aplikasi mungkin akan menampilkan pesan error atau meminta pengguna untuk mencoba lagi.

</details>

<details>
<summary>5) Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing</summary>

  1. **Scaffold**: Kerangka dasar aplikasi Flutter. 
  2. **AppBar**: Baris judul di bagian atas layar. 
  3. **LeftDrawer**: Widget kustom yang kemungkinan berisi navigasi atau tautan. 
  4. **FutureBuilder**: Menggunakan hasil dari Future (fetchProduct()) untuk membangun antarmuka pengguna berdasarkan status Future. 
  5. **Column**: Wadah vertikal untuk tata letak. 
  6. **ListView.builder**: Membuat daftar elemen dengan jumlah dinamis. 
  7. **Container**: Wadah elemen-elemen UI dengan margin dan padding. 
  8. **Text**: Menampilkan teks pada antarmuka pengguna. 
  9. **SizedBox**: Memberikan spasi vertikal. 
  10. **ElevatedButton**: Tombol dengan latar belakang yang diangkat, digunakan untuk kembali ke halaman produk.

</details>

<details>
<summary>6) Cara mengimplementasikan checklist tugas secara step-by-step</summary>

- [x] Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

    Pastikan Secret and Variables pada Repository GitHub sudah benar dan tepat lalu pastikan file-file yang dibutuhkan untuk keperluan deployment sudah ada pada file proyek Django.

- [x] Membuat halaman login pada proyek tugas Flutter. 

    Buat file 'login.dart' pada projek Flutter lalu isi dengan kode:
    ```
    import 'package:stockio/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    
    void main() {
      runApp(const LoginApp());
    }
    
    class LoginApp extends StatelessWidget {
      const LoginApp({super.key});
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        );
      }
    }
    
    class LoginPage extends StatefulWidget {
      const LoginPage({super.key});
    
      @override
      _LoginPageState createState() => _LoginPageState();
    }
    
    class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
    
      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
    
                    // Cek kredensial
                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                    // gunakan URL http://10.0.2.2/
                    final response = await request.login("http://10.0.2.2:8000/auth/login/", {
                      'username': username,
                      'password': password,
                    });
    
                    if (request.loggedIn) {
                      String message = response['message'];
                      String uname = response['username'];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login Gagal'),
                          content:
                          Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      }
    }
    ```

- [x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

    Pada projek Django buat app baru bernama `authentication` lalu install library 'django-cors-headers'. Tambahkan `authentication dan `corsheaders` kedalam `INSTALLED_APPS` di `settings.py`. Tambahkan juga `corsheaders.middleware.CorsMiddleware` pada `settings.py` dan tambahkan beberapa variabel berikut ini:
    ```
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
    Buat fungsi `login`, `logout` pada `authentication/views.py` dan lakukan routingnya pada `urls.py`

    Install package berikut ini pada projek Flutter:
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
    Lalu ubah class `MyApp` pada `main.dart` menjadi:
    ```
    class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
          child: MaterialApp(
              title: 'Flutter App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
              ),
              home: LoginPage()),
        );
      }
  }
  ```

- [x] Membuat model kustom sesuai dengan proyek aplikasi Django. 

    Buka endpoint `JSON` pada website Django lalu copy semua data yang ada di endpoint `JSON`. Buka situs web Quicktype dan tempel data `JSON` tadi lalu ubah language menjadi `DART`. Lalu tekan tombol `Copy Code` pada Quicktype.
    
    Pada projek Flutter buat folder baru `lib/models` lalu buat file baru `product.dart` dan tempel kode yang sudah disalin dari Quicktype sehingga menjadi seperti ini:
    ```
    // To parse this JSON data, do
    //
    //     final product = productFromJson(jsonString);
    
    import 'dart:convert';
    
    List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
    
    String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
    
    class Product {
      String model;
      int pk;
      Fields fields;
    
      Product({
        required this.model,
        required this.pk,
        required this.fields,
      });
    
      factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );
    
      Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
    }
    
    class Fields {
      int user;
      String name;
      int amount;
      String description;
    
      Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
      });
    
      factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
      );
    
      Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
      };
    }
    ```

- [x] Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. 
        
    Pada projek Flutter buat file `list_product.dart` lalu isi dengan kode:
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:stockio/models/product.dart';
    import 'package:stockio/screens/detail_product.dart';
    import 'package:stockio/widgets/left_drawer.dart';
    
    class ProductPage extends StatefulWidget {
      const ProductPage({Key? key}) : super(key: key);
    
      @override
      _ProductPageState createState() => _ProductPageState();
    }
    
    class _ProductPageState extends State<ProductPage> {
      Future<List<Product>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://10.0.2.2:8000/json/');
        var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
        );
    
        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));
    
        // melakukan konversi data json menjadi object Product
        List<Product> list_product = [];
        for (var d in data) {
          if (d != null) {
            list_product.add(Product.fromJson(d));
          }
        }
        return list_product;
      }
    }
    ```
    
  - [x] Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.

        Pada file `list_product.dart` tambahkan kode:
        ```
        ...
        @override
          Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Product'),
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchProduct(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return const Column(
                            children: [
                              Text(
                                "Tidak ada data produk.",
                                style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                  ],
                                ),
                              ));
                        }
                      }
                    }));
          }
        ...
        ```

- [x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. 

    Pada projek Flutter buat file baru `detail_product.dart` lalu isi dengan kode:
    ```
    import 'dart:ui';
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:stockio/models/product.dart';
    import 'package:stockio/widgets/left_drawer.dart';
    import 'package:stockio/screens/list_product.dart';
    
    class DetailProductPage extends StatelessWidget {
      const DetailProductPage({Key? key, required this.id}) : super(key: key);
      final int id;
    
      Future<List<Product>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://10.0.2.2:8000/json/${id}');
        var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
        );
    
        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));
    
        // melakukan konversi data json menjadi object Product
        List<Product> list_product = [];
        for (var d in data) {
          if (d != null) {
            list_product.add(Product.fromJson(d));
          }
        }
        return list_product;
      }
    }
    ```

    - [x] Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
  
        Pada file `list_product.dart` tambahkan kode berikut ini di bagian `return ListView.builder(...)`:
        ```
        ...
         ElevatedButton(
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DetailProductPage(id: snapshot.data![index].pk)),
              );
            },
            child: const Text('Detail Product'),
          ),
        ...
        ```

      - [x] Tampilkan seluruh atribut pada model item kamu pada halaman ini. 
  
          Pada file `detail_product.dart` tambahkan kode berikut ini:
          ```
          ...
          @override
            Widget build(BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Detail Product'),
                  ),
                  drawer: const LeftDrawer(),
                  body: FutureBuilder(
                      future: fetchProduct(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return const Column(
                              children: [
                                Text(
                                  "Tidak ada data produk.",
                                  style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("Amount: ${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "${snapshot.data![index].fields.description}"),
                                    ],
                                  ),
                                ));
                          }
                        }
                      }));
            }
          ...
          ```

      - [x] Tambahkan tombol untuk kembali ke halaman daftar item. 

          Pada file `list_product.dart` tambahkan kode berikut ini di bagian `return Scaffold(...)`:
          ```
          ...
          ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              child: const Text('Kembali'),
            ),
          ...
          ```

</details>

Referensi:
- https://pbp-fasilkom-ui.github.io/ganjil-2024/docs/tutorial-8
- https://www.niagahoster.co.id/blog/cookies-adalah/
- https://www.gamelab.id/news/1792-tutorial-menampilkan-data-api-menggunakan-flutter

---
# Tugas 8
<details>
<summary>1) Perbedaan antara Navigator.push() dan Navigator pushReplacement(), serta contoh penggunaan kedua metode tersebut yang tepat</summary>

`Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang digunakan dalam Flutter untuk melakukan navigasi antar halaman (routes) di dalam aplikasi.

1. **Navigator.push()**

    `Navigator.push()` digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi. Ketika menggunakan `Navigator.push()`, halaman baru akan ditambahkan di atas halaman saat ini dalam tumpukan navigasi. Pada saat ingin kembali ke halaman sebelumnya, dapat menggunakan tombol kembali perangkat atau memanggil `Navigator.pop(context)`.

    Contoh penggunaan `Navigator.push()`:
    ```
    Button(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen()),
        );
      },
    )
    ```
    Dalam contoh ini, ketika tombol ditekan, `SecondScreen()` ditambahkan ke dalam tumpukan navigasi di atas halaman saat ini.

2. **Navigator.pushReplacement()**
    `Navigator.pushReplacement()` digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi dan menggantikan halaman saat ini dengan halaman baru tersebut. Ini berguna ketika ingin menggantikan halaman saat ini dengan halaman baru dan menghindari pengguna dapat kembali ke halaman sebelumnya.

    Contoh penggunaan `Navigator.pushReplacement()`:
    ```
    Button(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NewScreen()),
        );
      },
    )
    ```
    Dalam contoh ini, ketika tombol ditekan, `NewScreen()` ditambahkan ke dalam tumpukan navigasi, menggantikan halaman saat ini. Pengguna tidak akan dapat kembali ke halaman sebelumnya menggunakan tombol kembali perangkat setelah penggunaan `Navigator.pushReplacement()`.

Jadi, perbedaan utama antara keduanya adalah bahwa `Navigator.push()` menambahkan halaman ke dalam tumpukan navigasi, sedangkan `Navigator.pushReplacement()` menggantikan halaman saat ini dengan halaman baru di dalam tumpukan navigasi. Pemilihan metode tergantung pada kebutuhan navigasi dan pengalaman pengguna yang diinginkan dalam aplikasi Flutter.

</details>

<details>
<summary>2) Layout widget pada Flutter dan konteks penggunaannya</summary>

Flutter memiliki berbagai jenis Layout Widgets yang digunakan untuk mengatur tata letak (layout) elemen-elemen dalam tampilan aplikasi. Berikut adalah beberapa Layout Widgets yang umum digunakan berserta konteks penggunaannya:

1. **Container**

    Container adalah widget serbaguna yang digunakan untuk mengatur tampilan elemen-elemen dalam kotak dengan tata letak yang lebih kompleks. Ini dapat berisi widget lain dan sering digunakan untuk mengatur tampilan elemen seperti gambar, teks, dan sebagainya dalam tata letak yang lebih terstruktur.

2. **Column**

    Column adalah widget yang digunakan untuk mengatur elemen-elemen secara vertikal. Ini sangat berguna saat ingin menumpuk elemen-elemen di dalam kolom, seperti daftar atau tumpukan widget.

3. **Row**

    Row adalah widget yang digunakan untuk mengatur elemen-elemen secara horizontal. Ini berguna ketika ingin mengatur elemen secara berdampingan dalam baris.

4. **Expanded**

    Expanded adalah widget yang digunakan untuk memberikan ruang ekstra pada widget anak di dalam Column atau Row. Ini berguna untuk mendistribusikan ruang yang tersedia secara merata di antara anak-anaknya.

5. **ListView**

    ListView adalah widget yang digunakan untuk membuat daftar gulir vertikal atau horizontal. Ini sangat berguna ketika memiliki daftar item yang panjang atau tumpukan widget yang perlu ditampilkan secara gulir.

6. **Stack**

    Stack adalah widget yang digunakan untuk menumpuk widget di atas satu sama lain. Ini berguna ketika ingin menggabungkan beberapa widget dan menumpuknya dalam tumpukan tampilan.

7. **Card**

    Card adalah widget yang digunakan untuk mengelilingi konten dalam bingkai yang berbeda. Ini digunakan ketika ingin membuat elemen seperti kartu, tegel, atau kartu info dalam tampilan.

8. **Wrap**

    Wrap adalah widget yang digunakan untuk mengatur widget dalam baris atau kolom, dan jika elemen-elemen melebihi ruang yang tersedia, mereka akan melanjutkan di baris atau kolom berikutnya. Ini berguna untuk mengatur elemen dengan ukuran yang bervariasi.

9. **GridView**

    GridView adalah widget yang digunakan untuk mengatur widget dalam bentuk kotak berbentuk grid. Ini berguna untuk menampilkan data dalam tata letak grid seperti galeri gambar atau daftar item dalam grid.

10. **Table**

    Table adalah widget yang digunakan untuk membuat tata letak berbasis tabel dengan baris dan kolom. Ini berguna saat ingin mengatur data dalam bentuk tabel.

Pemilihan Layout Widget bergantung pada kebutuhan tampilan. Dapat menggabungkan dan menyusun widget-widget ini sesuai dengan kebutuhan tampilan aplikasi untuk mencapai tata letak yang diinginkan.

</details>

<details>
<summary>3) Elemen input pada form yang dipakai pada tugas kali ini dan penjelasan mengapa menggunakan elemen input tersebut</summary>

1. **TextFormField untuk `Add Movie`**
  
    * Digunakan untuk mengambil input judul movie. 
    * Menggunakan TextFormField karena merupakan input teks biasa. 
    * Menyediakan dekorasi dengan placeholder ("Add Movie") dan label ("Add Movie"). 
    * Menggunakan validasi untuk memastikan bahwa input tidak boleh kosong.

2. **TextFormField untuk `Amount`**

    * Digunakan untuk mengambil input jumlah movie. 
    * Menggunakan TextFormField karena merupakan input teks untuk angka. 
    * Menyediakan dekorasi dengan placeholder ("Amount") dan label ("Amount"). 
    * Menggunakan validasi untuk memastikan bahwa input tidak boleh kosong dan harus berupa angka.

3. **TextFormField untuk `Synopsis`**

    * Digunakan untuk mengambil input sinopsis movie. 
    * Menggunakan TextFormField karena merupakan input teks biasa. 
    * Menyediakan dekorasi dengan placeholder ("Synopsis") dan label ("Synopsis"). 
    * Menggunakan validasi untuk memastikan bahwa input tidak boleh kosong.

</details>

<details>
<summary>4) Penerapan clean architecture pada aplikasi Flutter</summary>

Clean Architecture adalah pendekatan desain perangkat lunak yang membantu memisahkan tugas-tugas dan tanggung jawab dalam aplikasi agar lebih terstruktur, mudah diuji, dan mudah dipelihara. Penerapan Clean Architecture pada aplikasi Flutter melibatkan pembagian aplikasi menjadi beberapa lapisan, seperti Presentasi, Domain, dan Data, yang masing-masing memiliki tanggung jawab yang jelas. Di bawah ini adalah panduan umum untuk menerapkan Clean Architecture pada aplikasi Flutter:

1. **Pembagian Lapisan**

    * **Lapisan Presentasi (Presentation Layer)**: Ini adalah lapisan yang berisi semua komponen UI, seperti widget, tampilan, dan logika tampilan. Pada lapisan ini dapat menggunakan Flutter untuk membuat tampilan dan widget yang menghubungkan tampilan dengan lapisan Domain.
    
    * **Lapisan Domain (Domain Layer)**: Ini adalah inti dari aplikasi dan berisi logika bisnis atau aturan yang independen dari platform. Ini berisi kelas-kelas entitas, use cases, dan repository interfaces. Ini adalah lapisan yang paling penting dan harus bersifat platform-agnostic.
    
    * **Lapisan Data (Data Layer)**: Lapisan ini bertanggung jawab untuk berinteraksi dengan data dari sumber eksternal, seperti database, API, atau penyimpanan lokal. Lapisan Data mengimplementasikan repository yang didefinisikan di lapisan Domain.

2. **Penggunaan Dependency Injection (DI)**

    Kita dapat menggunakan library seperti `get_it`, `provider`, atau `kiwi` untuk mengatur dependensi di aplikasi Flutter. Ini memungkinkan untuk memisahkan lapisan Presentasi, Domain, dan Data serta menghubungkannya dengan mudah.

3. **Use Cases (Interactors)**

    Use Cases adalah komponen di lapisan Domain yang menjalankan logika bisnis aplikasi. Mereka berfungsi sebagai perantara antara Presentasi dan Data. Use Cases harus beroperasi pada objek-objek entitas dari lapisan Domain dan dapat mengambil objek-objek dari Data Layer melalui repository.

4. **Repository Interfaces**

    Repository adalah kontrak yang didefinisikan di lapisan Domain. Mereka mendefinisikan metode yang digunakan oleh Use Cases untuk mengambil dan menyimpan data. Implementasi konkret dari repository ditempatkan di lapisan Data.

5. **Entity**

    Entity adalah objek yang mewakili entitas utama dalam aplikasi. Mereka berisi properti dan logika yang relevan untuk entitas tersebut.

6. **Menggunakan BLoC atau Provider**

    Untuk mengelola keadaan aplikasi dan berbagi data antara lapisan Presentasi dan Domain dapat menggunakan BLoC (Business Logic Component) atau Provider, dua solusi yang populer dalam komunitas Flutter.

7. **Tampilan Terpisah dari Logika Bisnis**

    Pastikan logika bisnis tidak tercampur aduk dengan tampilan. Terapkan prinsip pemisahan tanggung jawab dengan baik, sehingga tampilan hanya bertanggung jawab untuk menampilkan data dan menerima masukan dari pengguna.

Penerapan Clean Architecture pada aplikasi Flutter memungkinkan untuk membuat aplikasi yang lebih mudah diuji, dapat diperluas, dan memungkinkan perubahan platform dengan lebih mudah. Selain itu, hal ini membantu menghindari ketergantungan platform yang kuat dan menjaga kode bersih dan terstruktur.

</details>

<details>
<summary>5) Cara mengimplementasikan checklist tugas secara step-by-step</summary>

- [x] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

    Buat file baru bernama `shoplist_form.dart` dan isi dengan kode berikut:
    ```
    class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});
    
      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
    }
    
    class _ShopFormPageState extends State<ShopFormPage> {
      final _formKey = GlobalKey<FormState>();
      @override
      Widget build(BuildContext context) {
        return Scaffold()
    }
    ```

    - [x] Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
  
        Pada file `Shop_form.dart` didalam class `_ShopFormPageState` isi dengan kode berikut:
        ```
        ...
        final _formKey = GlobalKey<FormState>();
          String _name = "";
          int _amount = 0;
          String _description = "";
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    'Add Movie Form',
                  ),
                ),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              drawer: const LeftDrawer(),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Movie Title",
                                labelText: "Movie Title",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Amount",
                                labelText: "Amount",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _amount = int.parse(value!);
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Synopsis",
                                labelText: "Synopsis",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                            ),
                          ),
                        ]
                    )
                ),
              ),
            );
          }    
        ...
        ```
  
    - [x] Memiliki sebuah tombol Save.

        Pada file `Shop_form.dart` didalam class `_ShopFormPageState`, bagian `return Scaffold(...)` isi dengan kode berikut:
        ```
        ...
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.deepOrange),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Movie saved successfully'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text('Movie Title: $_name'),
                              Text('Amount: $_amount'),
                              Text('Synopsis: $_description')
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                  _formKey.currentState!.reset();
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ...
        ```  

    - [x] Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
        - [x] Setiap elemen input tidak boleh kosong.

            Pada file `Shop_form.dart` didalam class `_ShopFormPageState`, bagian `return Scaffold(...)`, dan setiap bagian `child: TextFormField(...)` isi dengan kode berikut:
            ```
            ...
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Title cannot be empty!";
              }
              return null;
            },
            ...
            ```
  
        - [x] Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

            Pada file `Shop_form.dart` didalam class `_ShopFormPageState`, bagian `return Scaffold(...)`, bagian `child: TextFormField(...)`, dan bagian `validator: ` khusus untuk `amount` isi dengan kode berikut:
            ```
            ...
            if (int.tryParse(value) == null) {
              return "Amount must be a number!";
            }
            ...
            ```

- [x] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

    Pada file `menu.dart` didalam class `MyHomePage`, bagian `return Scaffold(...)` isi dengan kode berikut:
    ```
    ...
    drawer: const LeftDrawer(),
    ...
    ```
    Pada file `Shop_card.dart` didalam class `ShopCard`, bagian `return Material(...)` isi dengan kode berikut:
    ```
    ...
    if (item.name == "Add Movie") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
    ...
    ```

- [x] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

    Pada file `Shop_form.dart` didalam class `_ShopFormPageState`, bagian `child: Column(...)`, dan bagian `Align(...)` isi dengan kode berikut:
    ```
    ...
    return AlertDialog(
      title: const Text('Movie saved successfully'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text('Movie Title: $_name'),
            Text('Amount: $_amount'),
            Text('Synopsis: $_description')
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    ...
    ```

- [x] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
    - [x] Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.

      Pada file `left_drawer.dart` didalam class `LeftDrawer`, bagian `return Drawer(...)` isi dengan kode berikut:
      ```
      ...
      ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Main Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
      ListTile(
        leading: const Icon(Icons.add_shopping_cart),
        title: const Text('Add Movie'),
        // Bagian redirection ke ShopFormPage
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
              ));
        },
      ),
      ...
      ```

    - [x] Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.

        Pada file `left_drawer.dart` didalam class `LeftDrawer`, bagian `return Drawer(...)`, dan bagian `ListTile(...)` khusus untuk bagian `Main Page` isi dengan kode berikut:
        ```
        ...
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        },
        ...
        ```

    - [x] Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
        
        Pada file `left_drawer.dart` didalam class `LeftDrawer`, bagian `return Drawer(...)`, dan bagian `ListTile(...)` khusus untuk bagian `Add Movie` isi dengan kode berikut:
        ```
        ...
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
              ));
        },
        ...
        ```

</details>

Referensi:
- https://pbp-fasilkom-ui.github.io/ganjil-2024/docs/tutorial-7
- https://derangga.medium.com/flutter-clean-architecture-bloc-streams-89fc2c9146f
- https://docs-flutter-dev.translate.goog/ui/layout?_x_tr_sl=en&_x_tr_tl=id&_x_tr_hl=id&_x_tr_pto=tc

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

Dalam pengembangan aplikasi Flutter, seringkali akan menggunakan kombinasi kedua jenis widget ini untuk membangun antarmuka pengguna yang dinamis. Stateless widget digunakan untuk bagian-bagian tampilan yang tidak berubah, sementara stateful widget digunakan untuk bagian-bagian yang memerlukan pembaruan saat keadaan berubah. Ini memungkinkan untuk mengoptimalkan kinerja dan membangun antarmuka yang responsif

</details>

<details>
<summary>2) Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing</summary>

 Widget yang digunakan untuk menyelesaikan tugas ini adalah sebagai berikut:

- `MyHomePage (StatelessWidget)` : Widget utama yang mewakili halaman beranda aplikasi. Ini mengatur tampilan utama aplikasi dan termasuk dalam Scaffold.

- `Scaffold`: Widget yang igunakan untuk membuat layout dasar aplikasi.

- `AppBar` : Widget yang digunakan untuk mengelola navigasi dan tindakan.

- `Column`: Widget yang digunakan untuk menempatkan child dalam satu kolom.

- `Container`: Widget yang digunakan untuk menyimpan dan mengelola widget lain.

- `Material` : Widget yang digunakan sebagai wadah untuk setiap kartu dan memberikan warna latar belakang sesuai dengan jenis item yang ditentukan.

- `InkWell` : Widget yang memberikan respons terhadap sentuhan, sehingga pengguna dapat menekan kartu. Saat ditekan, SnackBar akan muncul.

- `Text`: Widget yang digunakan untuk menampilkan teks di aplikasi.

- `SnackBar`: Muncul ketika salah satu kartu ditekan dan memberikan umpan balik kepada pengguna.

- `Icon`: Widget yang digunakan untuk menampilkan ikon dari berbagai ikon yang sudah disediakan oleh Flutter.

</details>

<details>
<summary>3) Cara mengimplementasikan checklist tugas secara step-by-step</summary>

- [x] Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

    Membuka terminal di direktori yang diinginkan lalu memasukkan command:
    ```
    flutter create  stockio
    cd stockio
    ```
    Kemudian untuk menjalankan proyek gunakan command:
    ```
    flutter run
    ```

- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:

  Menambahkan kode ini pada `menu.dart` didalam class `MyHomePage`:
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

  Kemudian tambahkan kode untuk class `ShopItem` dan `ShopCard`:

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
- https://daengweb.id/belajar-flutter-basic-6-stateless-stateful-widget
- https://www.barajacoding.or.id/mempelajari-widget-dasar-pada-flutter/