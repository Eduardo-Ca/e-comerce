import 'package:ecomerce/modules/usuario/domain/entities/usuario_entity.dart';


// ignore: must_be_immutable
class UsuarioModel extends Usuario {
  UsuarioModel({
    int id = 0,
    String username = "",
    String senha = "",
    String email = "",
    String dataNascimento = "",
    String genero = "",
   
  }) : super(
    id: id,
    username:username,
    senha:senha,
    email:email,
    dataNascimento:dataNascimento,
    genero:genero,
  );

}
