import 'package:ecomerce/modules/produtos/domain/entities/produto_entity.dart';


// ignore: must_be_immutable
class ProductsModel extends Products {
  ProductsModel({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<dynamic>? images,
  }) : super(
    id: id,
    brand: brand,
    category: category,
    description: description,
    discountPercentage: discountPercentage,
    price: price,
    rating: rating,
    stock: stock,
    title:title,
    thumbnail: thumbnail,
    images: images,
  );

  
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      discountPercentage: map['discountPercentage'] != null ? map['discountPercentage'] as double : null,
      rating: map['rating'].toDouble() != null ? map['rating'].toDouble() as double : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      images: map['images'] != null ? map['images'] as List<dynamic> : null
    );
  }


}
