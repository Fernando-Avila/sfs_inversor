import 'package:flutter/material.dart';

class Cardanimated extends StatelessWidget {
  final int pos;
  final int pagepos;
  final Widget child;
  const Cardanimated(
      {Key? key, required this.pos, required this.pagepos, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.all(pos != pagepos ? 10 : 0),
      duration: Duration(milliseconds: 500),
      child: child,
    );
  }
}
