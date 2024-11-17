enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }


class Proyek {
  FaseProyek faseSaatIni = FaseProyek.Perencanaan;

  void pindahFase(FaseProyek faseBaru) {
    if (faseSaatIni == FaseProyek.Perencanaan && faseBaru == FaseProyek.Pengembangan) {
      print("Berpindah ke fase Pengembangan.");
      faseSaatIni = faseBaru;
    } else if (faseSaatIni == FaseProyek.Pengembangan && faseBaru == FaseProyek.Evaluasi) {
      print("Berpindah ke fase Evaluasi.");
      faseSaatIni = faseBaru;
    } else {
      print("Transisi tidak valid.");
    }
  }
}
