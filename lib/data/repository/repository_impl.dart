import 'package:firebase_app_najot/data/remote/google_auth_client.dart';
import 'package:firebase_app_najot/feature/auth/model/google_auth_result.dart';
import 'package:firebase_app_najot/feature/auth/model/google_user.dart';
import 'package:firebase_app_najot/feature/auth/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this._googleAuthClient);

  final GoogleAuthClient _googleAuthClient;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<GoogleAuthResult> googleSignIn() => _googleAuthClient.signIn();

  @override
  Future<void> googleSignOut() => _googleAuthClient.signOut();

  @override
  GoogleUser? getSignedUser() => (_firebaseAuth.currentUser != null)
      ? GoogleUser(
          userId: _firebaseAuth.currentUser?.uid,
          userEmail: _firebaseAuth.currentUser?.email,
          userName: _firebaseAuth.currentUser?.displayName,
          userProfileImg: _firebaseAuth.currentUser?.photoURL,
        )
      : null;
}
