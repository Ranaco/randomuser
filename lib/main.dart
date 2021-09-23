// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'HomePage.dart';

main() {
  runApp(const start());
}

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rnadom User using api',
      home: HomePage(
        title: "Random User using json",
      ),
    );
  }
}
