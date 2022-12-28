import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';

Widget szv(double h) {
  return SizedBox(height: h);
}

Widget szh(double h) {
  return SizedBox(width: h);
}

Widget dvh() {
  return Divider(
    thickness: 2,
    height: 5,
    color: EstiloApp.primarypink,
  );
}

Widget dvv() {
  return VerticalDivider(
    thickness: 2,
    width: 6,
    color: EstiloApp.primarypink,
  );
}
