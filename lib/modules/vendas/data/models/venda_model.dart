// ignore_for_file: must_be_immutable

import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/vendas/domain/entities/venda_entity.dart';

class VendaModel extends Venda {
  VendaModel({
    required int id,
    required List<ProductsModel> products,
    required int total,
    required int discountedTotal,
    required int userId,
    required int totalProducts,
    required int totalQuantity,
  }) : super(
    id: id,
    products:products,
    total:total,
    discountedTotal:discountedTotal,
    userId:userId,
    totalProducts:totalProducts,
    totalQuantity:totalQuantity,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }

  factory VendaModel.fromJson(Map<String, dynamic> map) {
    return VendaModel(
      id: map['id'] as int,
      products: List<ProductsModel>.from((map['products'] ).map<ProductsModel>((x) => ProductsModel.fromJson(x as Map<String,dynamic>),),),
      total: map['total'] as int,
      discountedTotal: map['discountedTotal'] as int,
      userId: map['userId'] as int,
      totalProducts: map['totalProducts'] as int,
      totalQuantity: map['totalQuantity'] as int,
    );
  }

  

}
