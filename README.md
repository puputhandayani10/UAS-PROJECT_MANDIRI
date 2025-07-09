# 💻 UAS PBO – Program Input dan View Barang (Java + MySQL)

## 🧠 Deskripsi
Program ini dibuat untuk memenuhi tugas UAS mata kuliah Pemrograman Berorientasi Objek (PBO). Aplikasi berbasis terminal ini memungkinkan user untuk menginput data barang, menyimpannya ke database lewat stored procedure, mencatat log otomatis menggunakan trigger, dan menampilkan data melalui view.

---

## 🧩 Fitur Program
- Input data barang via terminal
- Simpan data menggunakan procedure `insertBarang`
- Pencatatan log otomatis oleh trigger `logInsertBarang`
- Menampilkan data barang via `view_barang`
- Validasi input angka (harga dan stok)
- Notifikasi koneksi sukses atau gagal

---

## 🗂️ Struktur Folder
UAS_PBO/
│
├── lib/
│   └── mysql-connector-java-8.0.33.jar
├── src/
│   └── MainProgram.java
