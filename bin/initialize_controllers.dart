import 'package:shelf_router/shelf_router.dart';

import 'controllers/product/product_controller.dart';

void initControllers(Router router) {
  ProductController(router: router);
}
