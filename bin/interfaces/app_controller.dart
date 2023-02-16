import 'package:shelf_router/shelf_router.dart';

abstract class AppController {
  final Router router;

  AppController({required this.router}) {
    print('${runtimeType}Created');
    init();
  }

  void init();
}
