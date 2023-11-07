

import 'package:technaures_machine_test/rest/server_error.dart';

class ServerResponse<T> {
  ServerError? error;
  T? data;
}