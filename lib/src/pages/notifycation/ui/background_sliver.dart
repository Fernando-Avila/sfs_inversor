import 'package:flutter/material.dart';

class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/icons/degradado/iconlogo.png',
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }
}
