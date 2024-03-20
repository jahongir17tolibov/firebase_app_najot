import 'package:firebase_app_najot/feature/auth/model/google_auth_result.dart';
import 'package:firebase_app_najot/feature/auth/model/google_user.dart';

abstract class Repository {
  Future<GoogleAuthResult> googleSignIn();

  Future<void> googleSignOut();

  GoogleUser? getSignedUser();
}
