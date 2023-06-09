// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Products extends Equatable {
  int? id;
  int? quantity;
  String? title;
  String? description;
  int? price;
  int? priceTotal;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic>? images;
  bool favorito = false;

  Products({
    this.id = 0,
    this.quantity = 0,
    this.title = '',
    this.description = '',
    this.price = 0,
    this.priceTotal,
    this.discountPercentage = 0,
    this.rating = 0,
    this.stock = 0,
    this.brand = '',
    this.category = '',
    this.thumbnail = '',
    this.images = const [],
    this.favorito = false,
  });

  @override
  List<Object?> get props => [
        id,
        quantity,
        title,
        description,
        price,
        priceTotal,
        discountPercentage,
        rating,
        stock,
        brand,
        category,
        thumbnail,
        images,
        favorito,
      ];

}
