import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import 'initialize_controllers.dart';

var router = Router();

void main(List<String> arguments) async {

  initControllers(router);  //Init all Controllers 

  var handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  var server = await shelf_io.serve(handler, 'localhost', 8080);

  print('Server online at ${server.port}');
}
