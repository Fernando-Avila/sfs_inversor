import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';

class BtnWhite extends StatelessWidget {
  final Function() metod;
  final Widget widget;
  double? width;
  double? height;
  BtnWhite(
      {Key? key,
      required this.metod,
      required this.widget,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      splashColor: EstiloApp.primarypink,
      onTap: metod,
      child: Container(
        width:
            width != null ? MediaQuery.of(context).size.width * width! : null,
        height: height ?? null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: EstiloApp.decorationBoxwhite,
        child: Center(child: widget),
      ),
    );
  }
}

class BtnWhiteMarginblue extends StatelessWidget {
  final Function() metod;
  final Widget widget;
  double? width;
  double? height;
  BtnWhiteMarginblue(
      {Key? key,
      required this.metod,
      required this.widget,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      splashColor: EstiloApp.primarypink,
      onTap: metod,
      child: Container(
        width:
            width != null ? MediaQuery.of(context).size.width * width! : null,
        height: height ?? null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: EstiloApp.primaryblue),
            color: EstiloApp.colorwhite,
            boxShadow: kElevationToShadow[9],
            borderRadius: BorderRadius.circular(20)),
        child: Center(child: widget),
      ),
    );
  }
}

class BtnDisable extends StatelessWidget {
  final Function()? metod;
  final Widget widget;
  double? width;
  double? height;
  BtnDisable(
      {Key? key, this.metod, required this.widget, this.width, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: metod ?? null,
      borderRadius: BorderRadius.circular(60),
      child: Container(
        width:
            width != null ? MediaQuery.of(context).size.width * width! : null,
        height: height ?? null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            boxShadow: kElevationToShadow[9],
            borderRadius: BorderRadius.circular(60)),
        child: widget,
      ),
    );
  }
}

class BtnDegraded extends StatelessWidget {
  final Function()? metod;
  final Widget widget;
  double? width;
  double? height;
  BtnDegraded(
      {Key? key, this.metod, required this.widget, this.width, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      splashColor: EstiloApp.primarypink,
      onTap: metod,
      child: Container(
        width:
            width != null ? MediaQuery.of(context).size.width * width! : null,
        height: height ?? null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            gradient: EstiloApp.horizontalgradientpurplepink,
            boxShadow: kElevationToShadow[9],
            borderRadius: BorderRadius.circular(60)),
        child: Center(child: widget),
      ),
    );
  }
}

class BtnDegraded2 extends StatelessWidget {
  final Function() metod;
  final Widget widget;
  double? width;
  double? height;
  BtnDegraded2(
      {Key? key,
      required this.metod,
      required this.widget,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      splashColor: EstiloApp.primarypink,
      onTap: metod,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            gradient: EstiloApp.horizontalgradientpurplepink,
            boxShadow: kElevationToShadow[9],
            borderRadius: BorderRadius.circular(60)),
        child: Center(child: widget),
      ),
    );
  }
}

class BtnBlue extends StatelessWidget {
  final Function() metod;
  final Widget widget;
  double? width;
  double? height;
  BtnBlue(
      {Key? key,
      required this.metod,
      required this.widget,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      splashColor: EstiloApp.primarypink,
      onTap: metod,
      child: Container(
        width:
            width != null ? MediaQuery.of(context).size.width * width! : null,
        height: height ?? null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            gradient: EstiloApp.horizontalgradientblue,
            color: EstiloApp.primaryblue,
            boxShadow: kElevationToShadow[9],
            borderRadius: BorderRadius.circular(60)),
        child: Center(child: widget),
      ),
    );
  }
}
