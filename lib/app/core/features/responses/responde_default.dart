import 'package:flutter_gofast/app/core/enum/response_status.dart';

class ResponseDefault<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  ResponseDefault({this.object, this.message, this.status});
}
