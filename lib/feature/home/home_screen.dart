import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {
              if (value!.length < 8) {
                return '8 dan koproq boliwi kk';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              errorStyle: TextStyle(color: Colors.red),
              fillColor: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
