import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel._(
      {required super.id, required super.name, required super.price});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel._(
      id: map['id'],
      name: map['name'],
      price: map['price'],
    );
  }
}

extension ProductToJson on Product {
  Map<String, dynamic> get() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
