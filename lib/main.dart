import 'package:bilgi_testi_uygulamasi/test_veri.dart';
import 'package:flutter/material.dart';
import 'package:bilgi_testi_uygulamasi/constant.dart';

void main() {
  runApp(BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: SoruSayfasi(),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri testVeri1 = TestVeri();

  void butonFonksiyonu(bool butonDeger) {
    if (testVeri1.testBittiMi()) {
      //AlertDialog Göster
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Son soruya geldiniz!"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Başa Dön"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      //Indexi Sıfırla
                      testVeri1.sorulariSifirla();
                      //Secimleri temizle
                      secimler.clear();
                    });
                  },
                ),
              ],
            );
          });
    } else {
      bool dogruYanit = testVeri1.getSoruCevabi();
      setState(() {
        testVeri1.sonrakiSoru();
        if (dogruYanit == butonDeger) {
          secimler.add(kDogruIconu);
        } else {
          secimler.add(kYanlisIconu);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                testVeri1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 3,
            runSpacing: 3,
            children: secimler,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    padding: EdgeInsets.all(20),
                    onPressed: () {
                      butonFonksiyonu(false);
                    },
                    child: Icon(
                      Icons.thumb_down,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.greenAccent,
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.thumb_up,
                      size: 30,
                    ),
                    onPressed: () {
                      butonFonksiyonu(true);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
