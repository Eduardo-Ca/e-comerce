
import 'package:ecomerce/modules/core/utils/constants/data_base_contants.dart';
import 'package:ecomerce/modules/data/usuariodao.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {


  final String path = join(await getDatabasesPath(), DataBaseContants.DATABASENOME);
  return openDatabase(path, onCreate: (db, version) {
    db.execute(UsuarioDao.tableSql);
  }, version: DataBaseContants.VERSION); 
}


