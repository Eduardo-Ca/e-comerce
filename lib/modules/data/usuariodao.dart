// ignore_for_file: avoid_print

import 'package:ecomerce/modules/data/database.dart';
import 'package:ecomerce/modules/usuario/data/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao{
  //criação da tabela ===
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_username TEXT,'
      '$_email TEXT,'
      '$_genero TEXT,'
      '$_dataNascimento TEXT)';

  static const String _tablename = 'TarefaTable';
  static const String _username = 'username';
  static const String _email = 'email';
  static const String _genero = 'genero';
  static const String _dataNascimento = 'dataNascimento';

  save(UsuarioModel usuario) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(usuario.username);
    Map<String, dynamic> usuarioMap = toMap(usuario);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(_tablename, usuarioMap);
    } else {
      return await bancoDeDados.update(_tablename, usuarioMap,where: '$_username = ?', whereArgs: [usuario.username]);
    }
  }


  Map<String, dynamic> toMap(UsuarioModel usuario) {
    final Map<String, dynamic> mapaDeUsuario = {};
    mapaDeUsuario[_username] = usuario.username;
    mapaDeUsuario[_email] = usuario.email;
    mapaDeUsuario[_genero] = usuario.genero;
    mapaDeUsuario[_dataNascimento] = usuario.dataNascimento;
    print('Mapa de Tarefas: $mapaDeUsuario');
    return mapaDeUsuario;
  }

    List<UsuarioModel> toList(List<Map<String, dynamic>> mapaDeUsuarios) {
    final List<UsuarioModel> usuarios = [];
    for (Map<String, dynamic> linha in mapaDeUsuarios) {
      final UsuarioModel usuario = UsuarioModel(username:  linha[_username],email: linha[_email],genero: linha[_genero],dataNascimento: linha[_dataNascimento]);
      usuarios.add(usuario);
    }
    return usuarios;
  }


  Future<List<UsuarioModel>> find(String email) async {

    final Database bancoDeDados = await getDatabase();
    final  List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_email = ?',
      whereArgs: [email],
    );
   
    return toList(result);
  }

  delete(String email) async {
  
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_email = ?',
      whereArgs: [email],
    );
  }
}
