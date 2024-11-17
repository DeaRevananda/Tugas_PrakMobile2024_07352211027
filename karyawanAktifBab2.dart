class Perusahaan {
  List<String> karyawanAktif = [];
  List<String> karyawanNonAktif = [];
  final int batasKaryawanAktif = 20;

  void tambahKaryawan(String nama) {
    if (karyawanAktif.length < batasKaryawanAktif) {
      karyawanAktif.add(nama);
      print("$nama ditambahkan ke daftar karyawan aktif.");
    } else {
      print("Tidak dapat menambahkan $nama, batas karyawan aktif tercapai.");
    }
  }

  void resignKaryawan(String nama) {
    if (karyawanAktif.contains(nama)) {
      karyawanAktif.remove(nama);
      karyawanNonAktif.add(nama);
      print("$nama sekarang menjadi karyawan non-aktif.");
    } else {
      print("$nama tidak ditemukan di daftar karyawan aktif.");
    }
  }
}
