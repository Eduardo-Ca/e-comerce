// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Venda extends Equatable {
  int id;
  List<ProductsModel> produtos;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;
  
  Venda({
    this.id = 0,
    required this.produtos,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  @override
  List<Object?> get props => [
      id,
      produtos,
      total,
      discountedTotal,
      userId,
      totalProducts,
      totalQuantity,
      
      ];

}
