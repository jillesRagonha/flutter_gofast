import 'package:flutter_gofast/app/core/enum/response_status.dart';

class ResponseDefault<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  bool get success => status == ResponseStatus.Success;
  bool get failed => status == ResponseStatus.Failed;

  ResponseDefault({this.object, this.message, this.status});
}
