import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../data/models/product_model.dart';
import '../../domain/entities/product.dart';
import '../../interfaces/app_controller.dart';

class ProductController extends AppController {
  final List<Product> products = <Product>[
    Product(id: '2', name: 'Intel', price: 6750.0)
  ];

  ProductController({
    required super.router,
  });

  @override
  void init() {
    router.get('/product/', (Request request) {
      var data = {
        'items': products.map((v) => ProductToJson(v).get()).toList()
      };

      return Response.ok(jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
    });

    router.post('/product/', (Request request) async {
      final payload = await request.readAsString();

      try {
        products.add(ProductModel.fromJson(json.decode(payload)));
      } catch (e) {
        return Response.badRequest();
      }

      return Response.ok(payload);
    });
  }
}
