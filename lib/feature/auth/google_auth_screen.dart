import 'package:firebase_app_najot/feature/auth/viewmodel/google_auth_viewmodel.dart';
import 'package:firebase_app_najot/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleAuthScreen extends StatefulWidget {
  const GoogleAuthScreen({super.key});

  @override
  State<GoogleAuthScreen> createState() => _GoogleAuthScreenState();
}

class _GoogleAuthScreenState extends State<GoogleAuthScreen> {
  @override
  void initState() {
    Future.microtask(() {
      _authState(context.read<GoogleAuthViewModel>().checkCurrentUser());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google sign in example')),
      body: Consumer<GoogleAuthViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.signInStatus) {
            _authState(viewModel.signInStatus);
          }

          return Center(
            child: MaterialButton(
              onPressed: () async {
                await viewModel.signInWithGoogle();
              },
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Visibility(
                    visible: viewModel.isLoading,
                    child: const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _authState(bool state) {
    if (state) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }
}
