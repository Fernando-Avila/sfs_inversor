import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class Errorpage extends StatelessWidget {
  const Errorpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: H3(text: '404'),
      ),
      body: Container(),
    );
    ;
  }
}
