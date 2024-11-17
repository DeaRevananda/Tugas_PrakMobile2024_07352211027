class KaryawanWithRole {
  final String nama;
  final int umur;
  final String peran;

  KaryawanWithRole(this.nama, {required this.umur, required this.peran});
}

void main() {
  var karyawan = KaryawanWithRole('John', umur: 30, peran: 'Developer');
  print("${karyawan.nama}, ${karyawan.umur} tahun, bekerja sebagai ${karyawan.peran}");
}
