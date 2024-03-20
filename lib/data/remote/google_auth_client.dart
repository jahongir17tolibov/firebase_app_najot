import 'dart:async';

import 'package:firebase_app_najot/feature/auth/model/google_auth_result.dart';
import 'package:firebase_app_najot/feature/auth/model/google_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<GoogleAuthResult> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential signInCredential = await _firebaseAuth.signInWithCredential(credential);
      return GoogleAuthResult(
        user: (signInCredential.user != null)
            ? GoogleUser(
                userId: signInCredential.user?.uid,
                userEmail: signInCredential.user?.email,
                userName: signInCredential.user?.displayName,
                userProfileImg: signInCredential.user?.photoURL,
              )
            : null,
      );
    } catch (e) {
      return GoogleAuthResult(errorMessage: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await _firebaseAuth.signOut();
    } catch (_) {
      rethrow;
    }
  }
}
