import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gofast/app/core/features/responses/responde_default.dart';
import 'package:flutter_gofast/app/core/features/responses/response_builder.dart';
import 'package:flutter_gofast/app/core/interfaces/auth_repository_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<ResponseDefault> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<ResponseDefault> doLoginGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;
      if (googleSignInAuthentication.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth
            .signInWithCredential(credential)
            .then((auth) => firebaseUser = auth.user);
      }
      return ResponseBuilder.success<FirebaseUser>(
          object: firebaseUser, message: "Logado com sucesso");
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: "Falhaa ao logar ERRO:  ${e.toString()}");
    }
  }

  @override
  Future<ResponseDefault> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<ResponseDefault> logout() async {
    try {
      return ResponseBuilder.success<void>(
          object:  firebaseAuth.signOut());
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<ResponseDefault> registerEmailPassword(
      {String email, String senha}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: senha.trim())
          .then((value) {
        return ResponseBuilder.success<FirebaseUser>(object: value.user);
      });
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
}
