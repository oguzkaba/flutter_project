import 'package:flutter/cupertino.dart';
import 'package:flutter_project/models/signin_model.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseOperations {
  final String _host = '10.0.2.2';
  final int _port = 3306;
  final String _user = 'oguzkaba';
  final String _password = '523287';
  final String _db = 'program_database';
  final String _tablename = 'user_data';
  bool isLogin;

  DatabaseOperations();

  Future<bool> loginQuery(
    {@required String name, String pass}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      //  List<SigninModel> listem = [];
      var sonuc = await baglan.query(
          'SELECT * FROM $_db.$_tablename where name=? and password=?',
          [name, pass]);

      var a = sonuc.length;

      if (a >= 1) {
        isLogin = true;
        print('Tamam tamam oldu ' + a.toString()+' '+isLogin.toString());
      } else {
        isLogin = false;
      }

       for (var row in sonuc) {
        print('Name: ${row[1]}, password: ${row[2]}, sonuc: $a');
       }

      // for (var item in verilerinListesi) {
      //   listem.add(
      //     SigninModel(
      //       item["id"],
      //       item["name"],
      //       item["password"],
      //       item["role"],
      //     ),
      //   );
      // }
      // print("İlk gelen veriler");
      //  print(listem[0].name.toString());
      await baglan.close();
      return isLogin;
    } catch (e) {
      return null;
    }
  }

  // Future<bool> veriEkle(
  //     {@required String name, String password, String role}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );
  //     // ekleme kodları sonra eklerse true döndür

  //     await baglan.query(
  //         "insert into $_db.$_tablename (name,password,role) values (?,?,?)",
  //         [name, password, role]);
  //     await baglan.close();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> veriGuncelle(
  //     {@required int id, String ders, String ogretmen, String donem}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );
  //     // güncelledikte  sonra  true döndür

  //     await baglan.query(
  //         "update deneme.dersler set ders=? , ogretmen=? , donem = ? where id = ?",
  //         [ders, ogretmen, donem, id]);
  //     await baglan.close();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> veriSil({@required int id}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );
  //     // sildikten sonra  true döndür

  //     await baglan.query('delete from deneme.dersler where id=?', [id]);
  //     await baglan.close();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

}
