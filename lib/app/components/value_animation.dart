import 'package:flutter/material.dart';
import 'package:revenda_gas/utils/formated_price.dart';

class ValueAnimation extends ImplicitlyAnimatedWidget {
  final double value;

  ValueAnimation({
    Key key,
    this.value,
  }) : super(duration: Duration(seconds: 1), curve: Curves.linear, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _ValueAnimation();
}

class _ValueAnimation extends AnimatedWidgetBaseState<ValueAnimation> {
  Tween _count;

  @override
  Widget build(BuildContext context) {
    double value = _count.evaluate(animation);
    return RichText(
      text: TextSpan(style: TextStyle(color: Colors.black), children: [
        TextSpan(
          text: 'R\$',
          style: TextStyle(fontSize: 10),
        ),
        TextSpan(
          text: formatedPrice(value),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    _count = visitor(_count, widget.value, (dynamic value) => Tween(begin: value));
  }
}
