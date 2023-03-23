class TrataMsg {
  String trataMgsErro(String erroMessage) {
    String texto = '';

    texto = erroMessage
        .replaceAll('Exception:', '')
        .replaceAll('[', '')
        .replaceAll(']', '');

    return texto;
  }
}
