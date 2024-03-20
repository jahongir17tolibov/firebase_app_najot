import 'package:firebase_app_najot/feature/auth/model/google_user.dart';
import 'package:flutter/cupertino.dart';

@immutable
class GoogleAuthResult {
  final GoogleUser? user;
  final String? errorMessage;

  const GoogleAuthResult({this.user, this.errorMessage});
}
