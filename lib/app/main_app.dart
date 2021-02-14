import 'package:flutter/material.dart';
import 'package:revenda_gas/app/detail/detail_page.dart';
import 'package:revenda_gas/app/home/home_page.dart';
import 'package:revenda_gas/app/model/resale_model.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Revenda Gás',
      home: HomePage(),
      routes: {
        DetailPage.routerName: (_) {
          var resale = ModalRoute.of(_).settings.arguments as ResaleModel;
          return DetailPage(resale: resale);
        }
      },
    );
  }
}
