import 'package:flutter/cupertino.dart';
import 'package:flutter_project/models/signin_model.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseOperations{

  final String _host = '10.0.2.2';
  final int _port = 3306;
  final String _user = 'oguzkaba';
  final String _password = '523287';
  final String _db = 'deneme';
  final String _tablename='dersler';

    DatabaseOperations();

  Future<List<SigninModel>> verileriGetir() async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      List<SigninModel> listem = [];
      var verilerinListesi =
          await baglan.query('select * from $_db.$_tablename order by id DESC;');
     
      for (var item in verilerinListesi) {
        listem.add(
          SigninModel(
            item["id"],
            item["ders"],
            item["ogretmen"],
            item["donem"],
          ),
        );
      }
      print("İlk gelen veriler");
      print(listem[1].ders.toString());
      await baglan.close();
      return listem;
    } catch (e) {
      return null;
    }
  }

  Future<bool> veriEkle(
      {@required String ders, String ogretmen, String donem}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      // ekleme kodları sonra eklerse true döndür

      await baglan.query(
          "insert into deneme.dersler (ders,ogretmen,donem) values (?,?,?)",
          [ders, ogretmen, donem]);
      await baglan.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> veriGuncelle(
      {@required int id, String ders, String ogretmen, String donem}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      // güncelledikte  sonra  true döndür

      await baglan.query(
          "update deneme.dersler set ders=? , ogretmen=? , donem = ? where id = ?",
          [ders, ogretmen, donem, id]);
      await baglan.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> veriSil({@required int id}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      // sildikten sonra  true döndür

      await baglan.query('delete from deneme.dersler where id=?', [id]);
      await baglan.close();
      return true;
    } catch (e) {
      return false;
    }
  }

}