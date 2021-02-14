import 'dart:convert';

class ResaleModel {
  String type;
  String name;
  String color;
  double note;
  String averageTime;
  bool bestPrice;
  double price;

  ResaleModel(
      this.type,
      this.name,
      this.color,
      this.note,
      this.averageTime,
      this.bestPrice,
      this.price);

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'color': color,
      'note': note,
      'averageTime': averageTime,
      'bestPrice': bestPrice,
      'price': price,
    };
  }

  factory ResaleModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResaleModel(
      map['type'],
      map['name'],
      map['color'],
      map['note'],
      map['averageTime'],
      map['bestPrice'],
      map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResaleModel.fromJson(String source) => ResaleModel.fromMap(json.decode(source));
}
