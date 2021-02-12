import 'package:flutter/material.dart';
import 'package:revenda_gas/app/home/home_page.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Revenda Gás',
      home: HomePage(),
    );
  }
}
