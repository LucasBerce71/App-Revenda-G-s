import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  const Bullet({
    Key key, 
    @required this.enabled, 
    @required 
    this.label
  }) : super(key: key);
  
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 15),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: enabled ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: !enabled ? Border.all(color: Colors.grey) : null,
            boxShadow: enabled ? [
              BoxShadow(
                  blurRadius: 1, 
                  spreadRadius: 10, 
                  color: Colors.grey[300]
              ),
            ] : null,
          ),
        ),
        Text(label),
      ],
    );
  }
}
