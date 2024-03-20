import 'package:firebase_app_najot/data/remote/google_auth_client.dart';
import 'package:firebase_app_najot/data/repository/repository_impl.dart';
import 'package:firebase_app_najot/feature/auth/google_auth_screen.dart';
import 'package:firebase_app_najot/feature/auth/repository/repository.dart';
import 'package:firebase_app_najot/feature/auth/viewmodel/google_auth_viewmodel.dart';
import 'package:firebase_app_najot/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final GoogleAuthClient client = GoogleAuthClient();
  final Repository repository = RepositoryImpl(client);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GoogleAuthViewModel(repository)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GoogleAuthScreen(),
    );
  }
}
