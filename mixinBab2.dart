void main() {
  var manager = Manager(nama: "Budi", umur: 35);

  manager.bekerja();
  manager.tambahProduktivitas(90);
  manager.bekerja();
}

mixin Kinerja {
  int produktivitas = 0;

  void tambahProduktivitas(int nilai) {
    produktivitas = (produktivitas + nilai).clamp(0, 100);
    print("Produktivitas bertambah. Sekarang: $produktivitas");
  }
}

abstract class Karyawan {
  String nama;
  int umur;
  String peran;

  Karyawan({required this.nama, required this.umur, required this.peran});

  void bekerja();
}

class Manager extends Karyawan with Kinerja {
  Manager({required String nama, required int umur})
      : super(nama: nama, umur: umur, peran: "Manager");

  @override
  void bekerja() {
    print("$nama sedang mengelola tim.");
    if (produktivitas < 85) {
      print("Peringatan: Produktivitas harus minimal 85.");
    }
  }
}
