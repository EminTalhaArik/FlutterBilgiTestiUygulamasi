import 'package:bilgi_testi_uygulamasi/soru.dart';

class TestVeri {
  int _soruNo = 0;
  List<Soru> _soruBankasi = [
    Soru("Titanic gelmiş geçmiş en büyük gemidir.", false),
    Soru("Dünyadaki tavuk sayısı insan sayısından fazladır.", true),
    Soru("Kelebeklerin ömrü bir gündür.", false),
    Soru("Dünya düzdür.", false),
    Soru("Kaju fıstığı aslında bir meyvenin sapıdır.", true),
    Soru("Fatih Sultan Mehmet hiç patates yememiştir.", true)
  ];
  String getSoruMetni() {
    return _soruBankasi[_soruNo].soruMetni;
  }

  bool getSoruCevabi() {
    return _soruBankasi[_soruNo].soruCevap;
  }

  void sonrakiSoru() {
    if (_soruNo < _soruBankasi.length - 1) {
      _soruNo++;
    }
  }

  bool testBittiMi() {
    if (_soruNo >= _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void sorulariSifirla() {
    _soruNo = 0;
  }
}
