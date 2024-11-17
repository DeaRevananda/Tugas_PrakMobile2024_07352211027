void main() {
  var produk1 = ProdukDigital(
    namaProduk: "Router",
    harga: 300000,
    kategori: "NetworkAutomation",
  );

  print("Harga sebelum diskon: Rp${produk1.harga}");
  produk1.terapkanDiskon();
  print("Harga setelah diskon: Rp${produk1.harga}");
}

class ProdukDigital {
  String namaProduk;
  double harga;
  String kategori;

  ProdukDigital({required this.namaProduk, required this.harga, required this.kategori});

  void terapkanDiskon() {
    if (kategori == "NetworkAutomation" && harga > 200000) {
      harga = (harga * 0.85).clamp(200000, double.infinity);
      print("Diskon diterapkan. Harga baru: Rp$harga");
    }
  }
}
