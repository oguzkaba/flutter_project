import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/signin_model.dart';
import 'package:flutter_project/data/database_helper.dart';
import 'package:flutter_project/pages/veri_ekle.dart';

class VERILISTESI extends StatefulWidget {
  bool durum = false;
  VERILISTESI({this.durum});

  @override
  _VERILISTESIState createState() => _VERILISTESIState();
}

class _VERILISTESIState extends State<VERILISTESI> {
  DatabaseOperations _operations = new DatabaseOperations();
  List<SigninModel> tumVeriler = [];

  @override
  void initState() {
    super.initState();
    verileriGetir();
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kayıtlı Veriler||avdisx"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Duration(seconds: 3);
            Navigator.push<bool>(context,
                    MaterialPageRoute(builder: (context) => VERIEKLE()))
                .then((value) {
              print("  value");
              if (value == true) {
                snackbarGoster("Kayıt Eklendi");
                verileriGetir();
                setState(() {});
              }
            });
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: tumVeriler.length != 0
              ? ListView.builder(
                  itemCount: tumVeriler.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        title: Text(tumVeriler[index].ders +
                            " " +
                            tumVeriler[index].ogretmen),
                        subtitle:
                            Text("Dönem : " + tumVeriler[index].donem),
                        leading: Text(tumVeriler[index].id.toString()),
                        trailing: IconButton(
                            tooltip: "Kişiyi Sil",
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              //silme kodu
                              bool sonuc = await _operations.veriSil(
                                  id: tumVeriler[index].id);
                              if (sonuc) {
                                setState(() {
                                  snackbarGoster("Kayıt silindi");
                                  verileriGetir();
                                });
                              }
                            }),
                      ),
                    );
                  })
              : Center(
                  child: Text("Kayıtlı Veri Yok."),
                ),
        ),
      ),
    );
  }

  void verileriGetir() async {
    tumVeriler = await _operations.verileriGetir();
    setState(() {});

    /* _databaseislemleri.verileriGetir().then((value) {
     
      setState(() { tumVeriler = value;});
    }); */
  }

  void snackbarGoster(String mesaj) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: EdgeInsets.all(8),
      borderRadius: 15,
       /* backgroundGradient: LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.green],
        
      ),*/
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      message: mesaj,
      icon: Icon(
        Icons.done_all,
        size: 28.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  /*  Widget teksatir() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        title: Text("data"),
      ),
    );
  } */
}