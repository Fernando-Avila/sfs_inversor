import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/layouts/Textfield.dart';
import 'package:sfs_inversor/src/widgets/layouts/drawer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Firstinvest extends StatefulWidget {
  const Firstinvest({Key? key}) : super(key: key);

  @override
  _FirstinvestState createState() => _FirstinvestState();
}

class _FirstinvestState extends State<Firstinvest> {
  String values = '';
  TextEditingController Controll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawerZ(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Stack(
          children: [
            SleekCircularSlider(
              min: 0,
              max: 100,
              appearance: CircularSliderAppearance(
                  //  spinnerMode: true,
                  animationEnabled: false,
                  customColors: CustomSliderColors(
                    dynamicGradient: true,
                    progressBarColors: [
                      EstiloApp.primarypink,
                      EstiloApp.primarypurple,
                    ],
                  )),
              onChange: (double value) {
                setState(() {
                  values = value.toString();
                  Controll.text = value.toString();
                });
              },
              onChangeStart: (double startValue) {
                // callback providing a starting value (when a pan gesture starts)
              },
              onChangeEnd: (double endValue) {
                // ucallback providing an ending value (when a pan gesture ends)
              },
            ),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: TextField(
                  controller: Controll,
                  onChanged: (value) => setState(() {}),
                )),
          ],
        ),
        //drawer: DrawerC(),
      ),
    );
  }
}
