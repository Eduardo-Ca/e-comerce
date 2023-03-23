// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class Request {
  static const String POST = "POST";
  static const String GET = "GET";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";

   static const int SKIP = 1;
  static const int TAKE = 20;

  static const int UNAUTHORIZED = 401;
  static const int QUANTIDADE_TENTATIVAS = 5;
}

class Endpoints {
  //GET
  static const String FICHA_PEDIDOS = 'api/ficha';


  //POST

  static const String EXCLUIR_PRODUTOS_FICHA = 'api/v1/prevenda/cancelamento';
}
