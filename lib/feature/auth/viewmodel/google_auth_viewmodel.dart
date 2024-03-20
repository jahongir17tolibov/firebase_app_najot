import 'package:firebase_app_najot/feature/auth/repository/repository.dart';
import 'package:flutter/cupertino.dart';

class GoogleAuthViewModel extends ChangeNotifier {
  final Repository repository;

  GoogleAuthViewModel(this.repository);

  String errorText = '';
  bool signInStatus = false;
  bool isLoading = false;

  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;
      notifyListeners();
      final signInResult = await repository.googleSignIn();
      notifyListeners();
      signInStatus = signInResult.user != null;
      notifyListeners();
      if (signInResult.errorMessage != null) {
        errorText = signInResult.errorMessage!;
        notifyListeners();
      }
    } catch (e) {
      errorText = e.toString();
      notifyListeners();
    }
  }

  bool checkCurrentUser() => repository.getSignedUser() != null;
}
