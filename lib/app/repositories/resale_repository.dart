import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:revenda_gas/app/model/resale_model.dart';

class ResaleRepository {

  Future<List<ResaleModel>> serachAllResale() async {
    var jsonFile = await rootBundle.loadString('assets/dados.json');
    var resales = json.decode(jsonFile) as List;
    return resales.map((resale) => ResaleModel.fromMap(resale)).toList();
  }
}