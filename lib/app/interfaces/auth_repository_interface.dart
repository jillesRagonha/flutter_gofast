
import '../core/responses/responde_default.dart';

abstract class IAuthRepository{
  Future<ResponseDefault> doLoginGoogle();
  Future<ResponseDefault> doLoginEmailPassword();
  Future<ResponseDefault> registerEmailPassword();
  Future<ResponseDefault> getUser();
  Future<ResponseDefault> logout();
}