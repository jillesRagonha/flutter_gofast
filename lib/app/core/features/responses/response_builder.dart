import 'package:flutter_gofast/app/core/enum/response_status.dart';
import 'package:flutter_gofast/app/core/features/responses/responde_default.dart';

class ResponseBuilder {
  static ResponseDefault failed<T>({T object, String message}) {
    return ResponseDefault<T>(
      object: object,
      message: message,
      status: ResponseStatus.Failed,
    );
  }

   static ResponseDefault success<T>({T object, String message}) {
    return ResponseDefault<T>(
      object: object,
      message: message,
      status: ResponseStatus.Success,
    );
  }
}
