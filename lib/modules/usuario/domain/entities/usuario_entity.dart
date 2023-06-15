// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Usuario extends Equatable {
  int id;
  String username;
  String senha;
  String email;
  String dataNascimento;
  String genero;


  Usuario({
    this.id = 0,
    this.username = "",
    this.senha = '',
    this.email = '',
    this.dataNascimento = '',
    this.genero = '',
  });

  @override
  List<Object?> get props => [
        id,
        username,
        senha,
        email,
        dataNascimento,
        genero,
      ];

}
