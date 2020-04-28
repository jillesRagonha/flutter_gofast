import 'package:flutter_gofast/app/core/features/responses/responde_default.dart';

abstract class IAuthRepository{
  Future<ResponseDefault> doLoginGoogle();
  Future<ResponseDefault> doLoginEmailPassword();
  Future<ResponseDefault> registerEmailPassword();
  Future<ResponseDefault> getUser();
  Future<ResponseDefault> logout();
}